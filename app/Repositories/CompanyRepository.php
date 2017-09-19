<?php

namespace App\Repositories;

use App\Company;

class CompanyRepository extends AbstractRepository
{

    function __construct(Company $model)
    {
        $this->model = $model;
    }

}