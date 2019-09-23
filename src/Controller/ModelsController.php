<?php
namespace App\Controller;

use App\Controller\AppController;
use Cake\Http\Exception\NotFoundException;

/**
 * Marks Controller
 *
 * @property \App\Model\Table\MarksTable $Marks
 *
 * @method \App\Model\Entity\Mark[]|\Cake\Datasource\ResultSetInterface paginate($object = null, array $settings = [])
 */
class ModelsController extends AppController
{
    /**
     * Get models by mark_id
     *
     * @param int $id
     * @return \Cake\Http\Response|null
     * @throws NotFoundException
     */
    public function getModels($id = null)
    {
        if (!$id or !$this->getRequest()->isAll(['get']))
        {
            throw new NotFoundException();
        }
        $list = $this->Models
                ->find('list')
                ->where(['mark_id' => $id])
                ->order(['caption' => 'ASC']);
        $this->set([
            'list' => $list,
            '_serialize' => ['list']
        ]);
    }
}
