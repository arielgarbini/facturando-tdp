<?php namespace app\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Http\Response;
use Request;
use Session;
use Auth;
use App\Repositories\ProductRepository;

class CostoController extends Controller {

	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */

	private $productRepository;

	public function __construct(ProductRepository $productRepository)
	{
	    $this->productRepository = $productRepository;
		$this->middleware('auth');
	}


        public function getCosto()
	{
                $products = \app\Product::all();

		return view('costo.list')->with('products',$products);

	}

	

}
