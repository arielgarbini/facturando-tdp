<?php

namespace App\Repositories;

use App\TipoCbte;

class TipoCbteRepository extends AbstractRepository
{

    function __construct(TipoCbte $model)
    {
        $this->model = $model;
    }

}