<?php

namespace App\Repositories;

use App\TaxType;

class TaxTypeRepository extends AbstractRepository
{

    function __construct(TaxType $model)
    {
        $this->model = $model;
    }

}