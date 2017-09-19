<?php

namespace App\Repositories;

use App\TipoIVA;

class TipoIVARepository extends AbstractRepository
{

    function __construct(TipoIVA $model)
    {
        $this->model = $model;
    }

}