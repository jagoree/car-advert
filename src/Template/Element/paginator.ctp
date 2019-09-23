<nav>
    <ul class="pagination justify-content-center">
        <?= $this->Paginator->first('Первая') ?>
        <?= $this->Paginator->prev('Предыдущая') ?>
        <?= $this->Paginator->numbers() ?>
        <?= $this->Paginator->next('Следующая') ?>
        <?= $this->Paginator->last('Последняя') ?>
    </ul>
    <p><?= $this->Paginator->counter(['format' => __('Страница {{page}} из {{pages}}')]) ?></p>
</nav>