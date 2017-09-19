<?php

namespace App\Repositories;

use App\Product;

class ProductRepository extends AbstractRepository
{

    function __construct(Product $model)
    {
        $this->model = $model;
    }

}