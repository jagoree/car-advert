<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\Table;
use Cake\Event\Event;

/**
 * Images Model
 *
 * @property \App\Model\Table\CarsTable&\Cake\ORM\Association\BelongsTo $Cars
 *
 * @method \App\Model\Entity\Image get($primaryKey, $options = [])
 * @method \App\Model\Entity\Image newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\Image[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\Image|false save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\Image saveOrFail(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\Image patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\Image[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\Image findOrCreate($search, callable $callback = null, $options = [])
 */
class ImagesTable extends Table
{
    /**
     * Initialize method
     *
     * @param array $config The configuration for the Table.
     * @return void
     */
    public function initialize(array $config)
    {
        parent::initialize($config);

        $this->belongsTo('Cars');
    }
    
    /**
     * Before find listener
     * 
     * @param \Cake\Event\Event $event
     * @param \Cake\ORM\Query $query
     * @param \ArrayObject $options
     * @return \Cake\ORM\Query|array
     */
    public function beforeFind(Event $event, Query $query, \ArrayObject $options)
    {
        return $query->mapReduce(function ($result, $key, $mapReduce) {
            foreach ($this->Cars->config['resize'] as $type => $options) {
                if (is_file($filename = $this->Cars->config['path'] . ($basename = $type . '-' . $result->get('id') . '.' . $result->get('ext')))) {
                    $result->set($type . '-uploaded', [
                        'uri'  => '/images/' . $basename,
                        'filename' => $filename
                    ]);
                }
                $mapReduce->emit($result, $key);
            }
        });
    }
}
