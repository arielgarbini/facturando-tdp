<?php

namespace App\Repositories;

use App\CajaEspecial;

class CajaEspecialRepository extends AbstractRepository
{

    function __construct(CajaEspecial $model)
    {
        $this->model = $model;
    }

}