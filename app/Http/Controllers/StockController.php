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
use App\Repositories\StockRepository;

class StockController extends Controller {

	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */

	private $stockRepository;

	public function __construct(StockRepository $stockRepository)
	{
	    $this->stockRepository = $stockRepository;
		$this->middleware('auth');
	}


        public function getStock()
	{
                $products = \app\Stock::all();

		return view('stock.list')->with('products',$products);

	}

	

}
