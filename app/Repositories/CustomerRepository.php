<?php

namespace App\Repositories;

use App\Customer;

class CustomerRepository extends AbstractRepository
{

    function __construct(Customer $model)
    {
        $this->model = $model;
    }

}