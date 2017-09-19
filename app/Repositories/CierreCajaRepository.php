<?php

namespace App\Repositories;

use App\CierreCaja;

class CierreCajaRepository extends AbstractRepository
{

    function __construct(CierreCaja $model)
    {
        $this->model = $model;
    }

}