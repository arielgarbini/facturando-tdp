<?php

namespace App\Repositories;

use App\FacturaProveedor;

class FacturaProveedorRepository extends AbstractRepository
{

    function __construct(FacturaProveedor $model)
    {
        $this->model = $model;
    }

}