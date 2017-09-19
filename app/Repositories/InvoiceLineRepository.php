<?php

namespace App\Repositories;

use App\InvoiceLine;

class InvoiceLineRepository extends AbstractRepository
{

    function __construct(InvoiceLine $model)
    {
        $this->model = $model;
    }

}