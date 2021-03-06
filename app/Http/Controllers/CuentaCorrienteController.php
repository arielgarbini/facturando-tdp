<?php namespace app\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Response;
use Session;
use Auth;
use Request;
use App\Repositories\PagoRepository;
use App\Repositories\MedioPagoRepository;
use App\Repositories\CtaCteRepository;
use App\Repositories\InvoiceHeadRepository;


class CuentaCorrienteController extends Controller {

	/*
	|--------------------------------------------------------------------------
	| Home Controller
	|--------------------------------------------------------------------------
	|
	| This controller renders your application's "dashboard" for users that
	| are authenticated. Of course, you are free to change or remove the
	| controller as you wish. It is just here to get your app started!
	|
	*/

	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */

	private $pagoRepository;

    private $medioPagoRepository;

    private $ctaCteRepository;

    private $invoiceHeadRepository;

	public function __construct(PagoRepository $pagoRepository,
                                MedioPagoRepository $medioPagoRepository,
                                CtaCteRepository $ctaCteRepository,
                                InvoiceHeadRepository $invoiceHeadRepository)
	{
	    $this->pagoRepository = $pagoRepository;
        $this->medioPagoRepository = $medioPagoRepository;
        $this->ctaCteRepository = $ctaCteRepository;
        $this->invoiceHeadRepository = $invoiceHeadRepository;
		$this->middleware('auth');
	}

	/**
	 * Show the application dashboard to the user.
	 *
	 * @return Response
	 */

public function listarCteCta(){
	
	     $invoices = \app\InvoiceHead::where('status','=','A')
	     ->where('cbte_tipo','!=',3)
			->select(\DB::raw('SUM(cta_ctes.saldo) as sumaSaldo, invoice_head.company_name, invoice_head.companies_id'))			
			->leftJoin("cta_ctes", "invoice_head_id", "=", "invoice_head.id")
			->groupBy('invoice_head.companies_id')
			->get();
			return view('ctacte.listgral')->with('invoices',$invoices);

}

public function listarCteCtaEmpresa($id = null){

if($id!=null){

$invoices = \app\InvoiceHead::where('status','=','A')
			->select(\DB::raw('cta_ctes.saldo,invoice_head.company_name,invoice_head.imp_total, cta_ctes.id, invoice_head.nro_cbte, invoice_head.cbte_tipo, invoice_head.fecha_facturacion'))					
			->leftJoin("cta_ctes", "invoice_head_id", "=", "invoice_head.id")
			->where('companies_id','=',$id)
                        ->orderBy('fecha_facturacion','DESC')
			->paginate(10);
			
foreach ($invoices as $inv){
    
    $companyName = $inv->company_name;
    break;
}
return view('ctacte.listctacte')->with('invoices',$invoices)->with('companyName',$companyName);	
}else{
	return Redirect::to('ctacte');
}

}

public function verPagos($id = null){
		
		$invoice =\app\CtaCte::find($id)->facturas->nro_cbte;
		$pagos = \app\Pago::where('cta_ctes_id','=',$id)->where('is_active','=',1)->get();

		return view('ctacte.listpagos')->with('pagos',$pagos)->with('invoice',$invoice);

	
}

public function eliminarPago($id = null){
		
		$pago = \app\Pago::find($id);
		$ctacte = \app\CtaCte::find($pago->cta_ctes_id);
		$ctacte->saldo = $ctacte->saldo + $pago->pago;
		$pago->is_active = 0;

		if($pago->save()){
			$ctacte->save();

		Session::flash('message', 'Pago eliminado correctamente!!');
					return Redirect::to('verPagos/'.$pago->cta_ctes_id);
			
			}else{
				
				return Redirect::to('verPagos/'.$pago->cta_ctes_id);
			}

	
}

public function agregarPago($id = null){

	if($id!=null){
		$mpagos = \app\MedioPago::all();
		return view('ctacte.addPago')->with('id',$id)->with('mpagos',$mpagos);		
	}else{
		return Redirect::to('ctacte');
	}

}

public function agregarPagoPost(){

	$id = Input::get('ctacte_id');

	if(Input::get('mpago')=='otro'){
		$rules = array(
			'mpago' => 'required',
			'otro' => 'required',
			'monto' => 'required'
			);

	}else{
		$rules = array(
			'mpago' => 'required',
			'monto' => 'required'
			);

	}
	
	$validator = Validator::make(Input::all(), $rules);

	if ($validator->fails()) {
			return Redirect::to('agregarPago/'.$id)
			->withErrors($validator);
		} else {

			$ctacte = \app\CtaCte::find($id);

			$pago = new \app\Pago;

			$pago->cta_ctes_id = $id;

			if(Input::get('mpago')=='otro'){
				$pago->otro = Input::get('otro');
			 }else{
				$pago->medios_pagos_id = Input::get('mpago');; 					 	
			 }	
			$pago->pago	 = Input::get('monto');
			$pago->users_id = Auth::user()->id;

			if($pago->save()){
					$ctacte->saldo = $ctacte->saldo - $pago->pago;
					 $ctacte->save();
					Session::flash('message', 'Pago ingresado correctamente!!');
					return Redirect::to('ctacteCompany/'.$ctacte->facturas->companies_id);
				}
			}

}



}
