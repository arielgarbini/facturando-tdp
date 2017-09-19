<?php

namespace App\Repositories;

use App\Corredor;

class CorredorRepository extends AbstractRepository
{

    function __construct(Corredor $model)
    {
        $this->model = $model;
    }

}