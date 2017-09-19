<?php

namespace App\Repositories;

use App\Category;

class CategoryRepository extends AbstractRepository
{

    function __construct(Category $model)
    {
        $this->model = $model;
    }

}