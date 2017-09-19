<?php

namespace App\Repositories;

use App\ConceptosCaja;

class ConceptosCajaRepository extends AbstractRepository
{

    function __construct(ConceptosCaja $model)
    {
        $this->model = $model;
    }

}