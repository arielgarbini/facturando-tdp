<?php

namespace App\Repositories;

use App\Concepto;

class ConceptoRepository extends AbstractRepository
{

    function __construct(Concepto $model)
    {
        $this->model = $model;
    }

}