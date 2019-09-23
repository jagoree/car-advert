<?php
namespace App\Model\Table;

use Cake\ORM\Table;

/**
 * Marks Model
 *
 * @property \App\Model\Table\ModelsTable&\Cake\ORM\Association\HasMany $Models
 *
 * @method \App\Model\Entity\Mark get($primaryKey, $options = [])
 * @method \App\Model\Entity\Mark newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\Mark[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\Mark|false save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\Mark saveOrFail(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\Mark patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\Mark[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\Mark findOrCreate($search, callable $callback = null, $options = [])
 */
class MarksTable extends Table
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
        $this->hasMany('Models');
    }
}
