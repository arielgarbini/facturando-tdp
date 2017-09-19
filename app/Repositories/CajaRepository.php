<?php

namespace App\Repositories;

use App\Caja;

class CajaRepository extends AbstractRepository
{

    function __construct(Caja $model)
    {
        $this->model = $model;
    }

}