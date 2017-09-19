<?php

namespace App\Repositories;

use App\Linea;

class LineaRepository extends AbstractRepository
{

    function __construct(Linea $model)
    {
        $this->model = $model;
    }

}