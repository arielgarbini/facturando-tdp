<?php

namespace App\Repositories;

use App\Costo;

class CostoRepository extends AbstractRepository
{

    function __construct(Costo $model)
    {
        $this->model = $model;
    }

}