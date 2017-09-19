@extends('admin')

@section('content')
<div class="container-fluid">
	<div class="row">
		@if($invoices!=null)
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">Consultar Cuenta Corriente
				</div>
				<div class="panel-body">
					
					@if (Session::has('message'))
					<div class="alert alert-info">{{ Session::get('message') }}</div>
					@endif
				
					<table class="table table-hover">
						<thead>
							<tr>

								<th>Razón Social</th>
								<th>Saldo</th>
								</tr>
						</thead>
						<tbody>
							<?php 

							$saldo = 0;
							?>
							@foreach($invoices as $invoice)
								@if($invoice->sumaSaldo > 1 || $invoice->sumaSaldo < -1)
							
							<tr>
								<td>{{ $invoice->company_name  }}</td>
								<td>{{ '$ '.number_format($invoice->sumaSaldo,2) }}</td>
							</tr>
							<?php 
							$saldo = $saldo + $invoice->sumaSaldo;
							?>
							@endif
							@endforeach
							<tr>
								<td></td>
								<th>{{ '$ '.number_format($saldo,2)  }}</th>
							</tr>
						</tbody>
					</table>
					@else
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-default">
				<div class="panel-heading">Consultar Cuenta Corriente
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" method="POST" action="/listarCtaCte">
						<div class="list-group">
							<div class="list-group-item">
								<legend>Seleccione Período</legend>
								<div class="form-group">
									<label class="col-md-4 control-label">Desde</label>
									<div class="col-md-4">
										<input type="date" class="form-control" name="desde" value="{{ old('desde') }}" required>
									</div>
								</div>							
								<div class="form-group">
									<label class="col-md-4 control-label">Hasta</label>
									<div class="col-md-4">
										<input type="date" class="form-control" name="hasta" value="{{ old('hasta') }}"  required>
									</div>
								</div>	

								<div class="form-group">
							<div class="col-md-4 col-md-offset-4"><br/>
								<button type="submit" class="btn btn-primary">
									Consultar!
								</button>
							</div>
						</div>

							</form>
							@endif
				</div>
			</div>
		</div>
	</div>
</div>
@endsection
