<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Car Entity
 *
 * @property int $id
 * @property int $model_id
 * @property int $mileage
 * @property int $price
 * @property string $phone
 *
 * @property \App\Model\Entity\Model $model
 * @property \App\Model\Entity\Image[] $images
 * @property \App\Model\Entity\Option[] $options
 */
class Car extends Entity
{
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array
     */
    protected $_accessible = [
        'model_id' => true,
        'mileage' => true,
        'price' => true,
        'phone' => true,
        'model' => true,
        'images' => true,
        'options' => true
    ];
}
