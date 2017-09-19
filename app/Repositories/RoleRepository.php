<?php

namespace App\Repositories;

use App\Role;

class RoleRepository extends AbstractRepository
{

    function __construct(Role $model)
    {
        $this->model = $model;
    }

}