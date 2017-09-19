<?php

namespace App\Repositories;

use App\InvoiceHead;

class InvoiceHeadRepository extends AbstractRepository
{

    function __construct(InvoiceHead $model)
    {
        $this->model = $model;
    }

}