<?php

namespace App\Repositories;

use App\TipoCbteProv;

class TipoCbteProvRepository extends AbstractRepository
{

    function __construct(TipoCbteProv $model)
    {
        $this->model = $model;
    }

}