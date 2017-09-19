<?php namespace app\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Request;
use Session;
use Response;
use Auth;
use File;
use App\Repositories\PedidoRepository;


class PedidosController extends Controller{

    private $pedidoRepository;

	public function __construct(PedidoRepository $pedidoRepository)
	{
	    $this->pedidoRepository = $pedidoRepository;
		$this->middleware('auth');
	}

	public function getListarPedidos(){
	
	        $pedidos = \app\Pedido::where('current_state','=','5')->orWhere('current_state','=','16')->orWhere('current_state','=','12')->orderBy('id_order','DESC')->paginate(10);

	        return view('pedidos.list')->with('pedidos',$pedidos);
		
		}
		
	
	
	
}