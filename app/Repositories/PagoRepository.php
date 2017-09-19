<?php

namespace App\Repositories;

use App\Pago;

class PagoRepository extends AbstractRepository
{

    function __construct(Pago $model)
    {
        $this->model = $model;
    }

}