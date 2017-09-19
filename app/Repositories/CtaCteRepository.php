<?php

namespace App\Repositories;

use App\CtaCte;

class CtaCteRepository extends AbstractRepository
{

    function __construct(CtaCte $model)
    {
        $this->model = $model;
    }

}