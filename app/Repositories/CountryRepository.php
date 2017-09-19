<?php

namespace App\Repositories;

use App\Country;

class CountryRepository extends AbstractRepository
{

    function __construct(Country $model)
    {
        $this->model = $model;
    }

}