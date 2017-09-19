<?php

namespace App\Repositories;

use App\Parametros;

class ParametrosRepository extends AbstractRepository
{

    function __construct(Parametros $model)
    {
        $this->model = $model;
    }

}