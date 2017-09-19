<?php

namespace App\Repositories;

use App\CierreCajaEspecial;

class CierreCajaEspecialRepository extends AbstractRepository
{

    function __construct(CierreCajaEspecial $model)
    {
        $this->model = $model;
    }

}