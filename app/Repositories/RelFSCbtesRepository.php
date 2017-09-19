<?php

namespace App\Repositories;

use App\RelFSCbtes;

class RelFSCbtesRepository extends AbstractRepository
{

    function __construct(RelFSCbtes $model)
    {
        $this->model = $model;
    }

}