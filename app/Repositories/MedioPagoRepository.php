<?php

namespace App\Repositories;

use App\MedioPago;

class MedioPagoRepository extends AbstractRepository
{

    function __construct(MedioPago $model)
    {
        $this->model = $model;
    }

}