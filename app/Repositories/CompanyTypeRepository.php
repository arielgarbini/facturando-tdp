<?php

namespace App\Repositories;

use App\CompanyType;

class CompanyTypeRepository extends AbstractRepository
{

    function __construct(CompanyType $model)
    {
        $this->model = $model;
    }

}