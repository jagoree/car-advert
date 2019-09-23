<?php
namespace App\Model\Table;

use Cake\ORM\Table;

/**
 * Models Model
 *
 * @property \App\Model\Table\MarksTable&\Cake\ORM\Association\BelongsTo $Marks
 * @property \App\Model\Table\CarsTable&\Cake\ORM\Association\HasMany $Cars
 *
 * @method \App\Model\Entity\Model get($primaryKey, $options = [])
 * @method \App\Model\Entity\Model newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\Model[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\Model|false save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\Model saveOrFail(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\Model patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\Model[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\Model findOrCreate($search, callable $callback = null, $options = [])
 */
class ModelsTable extends Table
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

        $this->setDisplayField('caption');

        $this->belongsTo('Marks');
        $this->hasMany('Cars');
    }
}
