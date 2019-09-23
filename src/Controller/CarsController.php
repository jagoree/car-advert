<?php
namespace App\Controller;

use App\Controller\AppController;
use Cake\ORM\TableRegistry;

/**
 * Cars Controller
 *
 * @property \App\Model\Table\CarsTable $Cars
 *
 * @method \App\Model\Entity\Car[]|\Cake\Datasource\ResultSetInterface paginate($object = null, array $settings = [])
 */
class CarsController extends AppController
{
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null
     */
    public function index()
    {
        $this->paginate = [
            'contain' => ['Models.Marks', 'Images'],
            'order' => ['created' => 'DESC'],
            'limit' => 5
        ];
        $cars = $this->paginate($this->Cars);
        $this->set(compact('cars'));
    }

    /**
     * View method
     *
     * @param string|null $id Car id.
     * @return \Cake\Http\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $car = $this->Cars->get($id, [
            'contain' => ['Models.Marks', 'Options', 'Images']
        ]);

        $this->set('car', $car);
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $car = $this->Cars->newEntity();
        if ($this->request->is('post')) {
            $car->setAccess('_images', true);
            $car = $this->Cars->patchEntity($car, $this->request->getData());
            if ($this->Cars->save($car)) {
                $this->Flash->success('Автомобиль добавлен');

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error('При добавлении произошла ошибка');
            if ($mark_id = $this->getRequest()->getData('mark')) {
                $this->set('models', $this->Cars->Models->find('list')->where(['mark_id' => $mark_id])->all());
            }
        }
        $marks = TableRegistry::getTableLocator()->get('Marks')->find('list')->order(['caption' => 'ASC']);
        $options = $this->Cars->Options->find('list')->order(['caption' => 'ASC'])->all();
        $this->set(compact('car', 'marks', 'options'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Car id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $car = $this->Cars->get($id, ['contain' => ['Images' => ['fields' => ['id', 'car_id']]]]);
        if ($this->Cars->delete($car)) {
            $this->Flash->success('Автомобиль удален');
        } else {
            $this->Flash->error('При удалении произошла ошибка');
        }

        return $this->redirect(['action' => 'index']);
    }
}
