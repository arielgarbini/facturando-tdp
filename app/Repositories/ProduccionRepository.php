<?php

namespace App\Repositories;

use App\Produccion;

class ProduccionRepository extends AbstractRepository
{

    function __construct(Produccion $model)
    {
        $this->model = $model;
    }

}