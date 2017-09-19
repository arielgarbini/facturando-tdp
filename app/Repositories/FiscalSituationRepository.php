<?php

namespace App\Repositories;

use App\FiscalSituation;

class FiscalSituationRepository extends AbstractRepository
{

    function __construct(FiscalSituation $model)
    {
        $this->model = $model;
    }

}