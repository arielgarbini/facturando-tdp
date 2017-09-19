<?php

namespace App\Repositories;

use App\Pedido;

class PedidoRepository extends AbstractRepository
{

    function __construct(Pedido $model)
    {
        $this->model = $model;
    }

}