<?php

namespace App\Repositories;

use App\Moneda;

class MonedaRepository extends AbstractRepository
{

    function __construct(Moneda $model)
    {
        $this->model = $model;
    }

}