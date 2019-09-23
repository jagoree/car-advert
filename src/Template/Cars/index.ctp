<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Cars[]|\Cake\Collection\CollectionInterface $tasks
 */
use Cake\I18n\Number;

?>
<div class="col-md-12">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item active">Список авто</li>
      </ol>
    </nav>
</div>
<div class="col-md-12 col-sm-12">
    <h3>Автомобили с пробегом</h3>

    <table class="table table-hover table-responsive-sm">
        <thead class="thead-light">
            <tr>
                <th>Фото</th>
                <th>Марка, модель</th>
                <th class="sortable"><?= $this->Paginator->sort('price', 'Цена') ?></th>
                <th>Пробег</th>
                <th class="sortable"><?= $this->Paginator->sort('created', 'Дата добавления', ['class' => 'desc']) ?></th>
                <th>&nbsp;</th>
            </tr>
        </thead>
        <tbody>
            <?php
            foreach ($cars as $car):
                $image = null;
                $caption = implode(' ', [$car->get('model')['mark']['caption'], $car->get('model')['caption']]);
                if ($car->images[0]->get('thumb-uploaded')['uri']) {
                    $image = $this->Html->image($car->images[0]->get('thumb-uploaded')['uri'], ['alt' => h($caption)]);
                }
                ?>
                <tr>
                    <td><?= $image ?></td>
                    <td>
                        <?= $this->Html->link($caption, ['action' => 'view', $car->id]) ?>
                    </td>
                    <td><?= Number::format($car->get('price')) ?></td>
                    <td><?= Number::format($car->get('mileage')) ?></td>
                    <td><?= h($car->created->format('d.m.Y H:i')) ?></td>
                    <td>
                        <?= $this->Form->postLink('Удалить', ['action' => 'delete', $car->id], ['class' => 'btn btn-danger']) ?>
                    </td>
                </tr>
    <?php endforeach; ?>
        </tbody>
    </table>
    <div class="text-center m-3">
        <?= $this->Html->link('Добавить', ['_name' => 'add_car'], ['class' => 'btn btn-primary']) ?>
    </div>
<?= $this->element('paginator') ?>
</div>