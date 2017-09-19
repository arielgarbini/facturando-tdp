<?php

namespace App\Repositories;

use App\Cliente;

class ClienteRepository extends AbstractRepository
{

    function __construct(Cliente $model)
    {
        $this->model = $model;
    }

}