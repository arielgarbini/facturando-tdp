<?php

namespace App\Repositories;

use App\Stock;

class StockRepository extends AbstractRepository
{

    function __construct(Stock $model)
    {
        $this->model = $model;
    }

}