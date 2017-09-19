<?php

namespace App\Repositories;

use App\RelRemitosFacturas;

class RelRemitosFacturasRepository extends AbstractRepository
{

    function __construct(RelRemitosFacturas $model)
    {
        $this->model = $model;
    }

}