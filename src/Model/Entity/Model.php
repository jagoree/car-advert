<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Model Entity
 *
 * @property int $id
 * @property int $mark_id
 * @property int $caption
 *
 * @property \App\Model\Entity\Mark $mark
 * @property \App\Model\Entity\Car[] $cars
 */
class Model extends Entity
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
        'mark_id' => true,
        'caption' => true,
        'mark' => true,
        'cars' => true
    ];
}
