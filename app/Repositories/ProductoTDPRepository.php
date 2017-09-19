<?php

namespace App\Repositories;

use App\ProductoTDP;

class ProductoTDPRepository extends AbstractRepository
{

    function __construct(ProductoTDP $model)
    {
        $this->model = $model;
    }

}