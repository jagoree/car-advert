<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;
use Cake\Event\Event;
use Cake\Datasource\EntityInterface;
use Intervention\Image\ImageManager;

/**
 * Cars Model
 *
 * @property \App\Model\Table\ModelsTable&\Cake\ORM\Association\BelongsTo $Models
 * @property \App\Model\Table\ImagesTable&\Cake\ORM\Association\HasMany $Images
 * @property \App\Model\Table\OptionsTable&\Cake\ORM\Association\BelongsToMany $Options
 *
 * @method \App\Model\Entity\Car get($primaryKey, $options = [])
 * @method \App\Model\Entity\Car newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\Car[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\Car|false save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\Car saveOrFail(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\Car patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\Car[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\Car findOrCreate($search, callable $callback = null, $options = [])
 */
class CarsTable extends Table
{
    
    /**
     * Images config array
     * 
     * @var array
     */
    public $config = [
        'accept' => [
            'image/jpeg' => 'jpg',
            'image/png' => 'png',
        ],
        'limit' => 3,
        'resize' => [
            'image' => [
                'x' => 720,
                'y' => 540
            ],
            'thumb' => [
                'x' => 146,
                'y' => 106
            ]
        ],
        'path' => WWW_ROOT . 'images' . DS
    ];
    /**
     * Initialize method
     *
     * @param array $config The configuration for the Table.
     * @return void
     */
    public function initialize(array $config)
    {
        parent::initialize($config);

        $this->setTable('cars');
        $this->setDisplayField('id');
        $this->setPrimaryKey('id');

        $this->belongsTo('Models');
        $this->hasMany('Images');
        $this->belongsToMany('Options');
        
        $this->addBehavior('Timestamp');
    }

    /**
     * Default validation rules.
     *
     * @param \Cake\Validation\Validator $validator Validator instance.
     * @return \Cake\Validation\Validator
     */
    public function validationDefault(Validator $validator)
    {
        $validator
            ->integer('id')
            ->allowEmptyString('id', null, 'create');
        $validator
                ->integer('model_id')
                ->notEmptyString('model_id');
        
        $validator->requirePresence(['mark', 'model_id', 'price', 'phone'], true, 'Поле нужно заполнить');
        
        $validator->add('price', [
            'nonNegative' => [
                'rule' => ['naturalNumber', true],
                'message' => 'Заполните цену правильно'
            ],
            'notEmpty' => [
                'rule' => function ($value) {
                    return !empty($value);
                },
                'message' => 'Нужно указать цену'
            ]
        ]);
        
        $validator->add('phone', 'custom', [
            'rule' => function ($value) {
                return (bool) preg_match('~\+\d\s\(\d{3}\)\s\d{3}(-\d{2}){2}~', $value);
            },
            'message' => 'Некорректный номер телефона'
        ]);

        return $validator;
    }
    
    /**
     * After save listener 
     * 
     * @param \Cake\Event\Event $event
     * @param \Cake\Datasource\EntityInterface $entity
     * @param \ArrayObject $options
     * @return void
     */
    public function afterSave(Event $event, EntityInterface $entity, \ArrayObject $options)
    {
        if (!$images = $entity->get('_images')) {
            return ;
        }
        $imageManager = new ImageManager();
        if (!is_dir($this->config['path'])) {
            mkdir($this->config['path']);
        }
        foreach ($this->getImages($images) as $image) {
            $resource = $imageManager->make($image['file']);
            $imageEntity = $this->Images->newEntity(['car_id' => $entity->get('id'), 'ext' => $image['ext']]);
            $this->Images->save($imageEntity, ['atomic' => false]);
            $this->imageResize($resource, $imageEntity->get('id') . '.' . $image['ext']);
        }
    }
    
    public function afterDelete(Event $event, EntityInterface $entity, $options)
    {
        foreach ($entity->get('images') as $image) {
            foreach (array_keys($this->config['resize']) as $key) {
                foreach (glob($this->config['path'] . $key . '-' . $image->get('id') . '.*') as $file) {
                    unlink($file);
                }
            }
        }
    }
    
    /**
     * Resizes an image
     * 
     * @param resource $image
     * @param string $filename
     */
    private function imageResize($image, $basename)
    {
        foreach ($this->config['resize'] as $type => $options) {
            $filename = $this->config['path'] . $type . '-' . $basename;
            $x = null;
            $y = $options['y'];
            if ($image->width() >= $image->height()) {
                $x = $options['x'];
            }
            $image
                    ->resize($x, $y, function ($c) {
                        $c->aspectRatio();
                        $c->upsize();
                    })
                    ->resizeCanvas($options['x'], $options['y'], 'center', false, '#fff')
                    ->save($filename);
        }
    }
    
    /**
     * Makes limited array of uploaded files
     * 
     * @param array $images
     * @return array
     */
    private function getImages($images)
    {
        $finfo = finfo_open(FILEINFO_MIME_TYPE);
        $passed = [];
        $count = 0;
        foreach ($images as $file) {
            if ($count == $this->config['limit']) {
                break;
            }
            if (($ext = $this->checkImage($finfo, $file)) === false) {
                continue;
            }
            $count ++;
            $passed[] = ['file' => $file['tmp_name'], 'ext' => $ext];
        }
        finfo_close($finfo);
        return $passed;
    }
    
    /**
     * Checks that uploaded file is an image
     * 
     * @param resource $finfo
     * @param array $file
     * @return boolean|string
     */
    private function checkImage($finfo, $file)
    {
        if (!isset($file['tmp_name']) or !isset($this->config['accept'][$file['type']]) or !is_uploaded_file($file['tmp_name'])) {
            return false;
        }
        $mime = finfo_file($finfo, $file['tmp_name']);
        if (!isset($this->config['accept'][$mime])) {
            return false;
        }
        return $this->config['accept'][$mime];
    }

    /**
     * Returns a rules checker object that will be used for validating
     * application integrity.
     *
     * @param \Cake\ORM\RulesChecker $rules The rules object to be modified.
     * @return \Cake\ORM\RulesChecker
     */
    public function buildRules(RulesChecker $rules)
    {
        $rules->add($rules->existsIn(['model_id'], 'Models'));

        return $rules;
    }
}
