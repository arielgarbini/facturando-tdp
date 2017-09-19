<?php

namespace App\Repositories;

use App\ConceptosCajaEspecial;

class ConceptosCajaEspecialRepository extends AbstractRepository
{

    function __construct(ConceptosCajaEspecial $model)
    {
        $this->model = $model;
    }

}