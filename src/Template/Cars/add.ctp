<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Car $car
 */
?>
<div class="col-md-12">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="<?= $this->Url->build(['_name' => 'cars']) ?>">Список авто</a></li>
        <li class="breadcrumb-item active" aria-current="page">Добавить автомобиль</li>
      </ol>
    </nav>
</div>
<div class="col-md-12">
    <h3>Добавить авто</h3>
    <?php $this->Form->setConfig('errorClass', 'is-invalid'); ?>
    <?= $this->Form->create($car, ['templates' => 'form', 'type' => 'file']) ?>
    <div class="form-group">
        <?php
        echo $this->Form->control('mark', ['type' => 'select', 'label' => 'Марка *', 'options' => $marks, 'empty' => '--Выберите модель--', 'class' => 'custom-select']);
        $modelOptions = ['type' => 'select', 'label' => 'Модель *', 'options' => [], 'id' => 'model', 'disabled' => true, 'required' => true, 'class' => 'custom-select'];
        if (isset($models)) {
            $modelOptions = array_merge($modelOptions, ['disabled' => false, 'options' => $models]);
        }
        echo $this->Form->control('model_id', $modelOptions);
        echo $this->Form->control('price', ['label' => 'Цена *', 'required' => true, 'type' => 'text']);
        echo $this->Form->control('mileage', ['label' => 'Пробег', 'type' => 'text']);
        echo $this->Form->control('phone', ['label' => 'Телефон *', 'required' => true]);
        echo $this->Form->control('_images[]', ['label' => ['text' => 'Изображения (максимум 3)', 'class' => 'custom-file-label', 'data-browse' => 'Обзор'], 'type' => 'file', 'multiple' => true, 'accept' => 'image/jpeg,image/png', 'class' => 'custom-file-input', 'templates' => [
            'formGroup' => '{{input}}{{label}}',
            'inputContainer' => '<div class="custom-file">{{content}}</div>',
        ]]);
        if ($options->count()) {
            echo $this->Html->tag('h5', 'Дополнительное оборудование:', ['class' => 'my-3']);
            echo $this->Form->control('options._ids', ['options' => $options, 'type' => 'select', 'multiple' => 'checkbox', 'label' => false, 'class' => 'form-check-input', 'templates' => [
                'inputContainer' => '<div class="form-group checkboxes">{{content}}</div>',
                'checkboxWrapper' => '<div class="form-check form-check-inline">{{label}}</div>',
            ]]);
        }
        ?>
        <p class="small">Поля, отмеченные символом <mark>*</mark>, обязательны для заполнения.</p>
        <?php
        echo $this->Form->button('Добавить', ['class' => 'btn btn-primary']);
        echo $this->Html->link('К списку', ['action' => 'index'], ['class' => 'btn btn-info ml-3']);
        ?>
    </div>
    <?= $this->Form->end() ?>
</div>
