<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Car $car
 */
use Cake\I18n\Number;
?>
<div class="col-md-12">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="<?= $this->Url->build(['_name' => 'cars']) ?>">Список авто</a></li>
        <li class="breadcrumb-item active" aria-current="page"><?= $car->get('model')['mark']->get('caption') ?> <?= $car->get('model')['caption'] ?></li>
      </ol>
    </nav>
</div>
<h1 class="ml-3"><?= $car->get('model')['mark']->get('caption') ?> <?= $car->get('model')['caption'] ?></h1>
<div class="col-md-8">
    <?php if ($car->get('images')[0]->get('image-uploaded') !== null) { ?>
    <img src="<?= $car->get('images')[0]->get('image-uploaded')['uri'] ?>" class="full-image">
    <?php } ?>
    <div class="thumbs text-center">
        <?php foreach ($car->get('images') as $i => $image) {
            if (!$image->get('image-uploaded')) {
                continue;
            }
            ?>
        <img src="<?= $image->get('thumb-uploaded')['uri'] ?>" data-src="<?= $image->get('image-uploaded')['uri'] ?>" class="img-thumbnail<?php if (!$i) { ?> active<?php } ?>">
        <?php } ?>
    </div>
</div>
<div class="col-md-4">
    <p>Цена: <strong><?= Number::currency($car->get('price'), null, ['precision' => 0]) ?></strong></p>
    <p>Пробег: <strong><?= Number::format($car->get('mileage')) ?> км</strong></p>
    <p>Телефон: <strong><?= $car->get('phone') ?></strong></p>
    <?php if ($car->get('options')) { ?>
    <p>Дополнительные опции:</p>
    <ul class="list-unstyled">
        <?php foreach ($car->get('options') as $option) {
            echo $this->Html->tag('li', $option->get('caption'));
        } ?>
    </ul>
    <?php } ?>
    <a href="<?= $this->Url->build(['_name' => 'cars']) ?>" class="btn btn-secondary">К списку автомобилей</a>
</div>