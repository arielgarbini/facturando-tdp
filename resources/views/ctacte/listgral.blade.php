@extends('admin')

@section('content')
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12>
			<div class="panel panel-default">
				<div class="panel-heading">Cuenta Corriente
				</div>
				<div class="panel-body">
					
					@if (Session::has('message'))
					<div class="alert alert-info">{{ Session::get('message') }}</div>
					@endif
				    <label for="kwd_search">Cliente: </label> <input type="text" class="form-control" id="kwd_search" value=""/>
					<table class="search-table table table-hover" id="my-table">
						<thead>
							<tr>

								<th>Razón Social</th>
								<th>Saldo</th>
								<th>Acción</th>
								</tr>
						</thead>
						<tbody>
							<?php 

							$saldo = 0;
							?>
							@foreach($invoices as $invoice)
							<tr>
								<th>{{ $invoice->company_name  }}</th>
								<td>{{ '$ '.number_format($invoice->sumaSaldo,2) }}</td>
								<td><a href= "/ctacteCompany/{{$invoice->companies_id}}" class="btn btn-info" >Ver detalle</a></td>
                                                        <?php 

							$saldo = $saldo + $invoice->sumaSaldo;
							
							?>
							</tr>
							@endforeach
                                                        <tr>	
                                                        <td></td>
                                                        <td><b>{{'$ '.number_format($saldo,2)}}</b></td>
                                                        <td></td>
                                                        </tr>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
	</div>
</div>
<script src="{{ asset('/js/buscador.js') }}"></script>

<script>

$(document).ready(function(){
  $('table.search-table').tableSearch();
});

</script>

@endsection
