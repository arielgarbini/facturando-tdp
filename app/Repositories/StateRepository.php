<?php

namespace App\Repositories;

use App\State;

class StateRepository extends AbstractRepository
{

    function __construct(State $model)
    {
        $this->model = $model;
    }

}