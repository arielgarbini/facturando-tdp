<?php

namespace App\Repositories;

use App\Lengua;

class LenguaRepository extends AbstractRepository
{

    function __construct(Lengua $model)
    {
        $this->model = $model;
    }

}