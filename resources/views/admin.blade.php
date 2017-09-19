<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FACTURANDO!</title>

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <link rel="stylesheet" href="{{ asset('/adminlte/bootstrap/css/bootstrap.min.css') }}">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

    <link rel="stylesheet" href="{{ asset('/adminlte/css/AdminLTE.min.css') }}">

    <link rel="stylesheet" href="{{ asset('/adminlte/css/skins/skin-blue.min.css') }}">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a href="/" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>A</b>TS</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Toallasd</b></span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- Messages: style can be found in dropdown.less-->
                    <!-- /.messages-menu -->

                    <!-- Notifications Menu -->

                    <!-- Tasks Menu -->

                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                            <img src="{{ asset('/adminlte/img/avatar-default.png') }}" class="user-image" alt="User Image">
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs">{{Auth::user()->name}} {{Auth::user()->lastname}}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- The user image in the menu -->
                            <li class="user-header">
                                <img src="{{ asset('/adminlte/img/avatar-default.png') }}" class="img-circle" alt="User Image">

                                <p>
                                    {{Auth::user()->name}} {{Auth::user()->lastname}} - {{Auth::user()->roles->rol}}
                                </p>
                            </li>
                            <!-- Menu Body -->
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="{{ url('/profile/'.Auth::user()->id) }}" class="btn btn-default btn-flat">Perfil</a>
                                </div>
                                <div class="pull-right">
                                    <a href="{{ url('/auth/logout') }}" class="btn btn-default btn-flat">Salir</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Control Sidebar Toggle Button -->

                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

            <!-- Sidebar user panel (optional) -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="{{ asset('/adminlte/img/avatar-default.png') }}" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>{{Auth::user()->name}} {{Auth::user()->lastname}}</p>
                    <!-- Status -->
                    <a href="#"><i class="fa fa-circle text-success"></i> {{Auth::user()->roles->rol}}</a>
                </div>
            </div>

            <!-- search form (Optional) -->
            <!--<form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                </div>
            </form>-->
            <!-- /.search form -->

            <!-- Sidebar Menu -->
            <ul class="sidebar-menu">
                <li class="header">Menu</li>
                <!-- Optionally, you can add icons to the links -->

                @if (!Auth::guest())
                    @if(Auth::user()->email=='tpcontrolpro2@gmail.com' || Auth::user()->email=='tpcontroladm4@gmail.com')
                        <li class="{{ Request::is('viewProd*') ? 'active open' : ''  }}"><a href="viewProd"><i class="fa fa-link"></i> <span>Producción</span></a></li>
                    @endif
                    @if(Auth::user()->roles_id==5)
                        <li class="{{ Request::is('stock*') ? 'active open' : ''  }}"><a href="stock"><i class="fa fa-link"></i> <span>Stock</span></a></li>
                    @endif
                    @if(Auth::user()->roles_id!=4 && Auth::user()->roles_id!=5)
                        <li class="{{ (Request::is('home*') || Request::is('/')) ? 'active open' : ''  }}"><a href="{{ url('/') }}"><i class="fa fa-link"></i> <span>Home</span></a></li>

                        <li class="{{ (Request::is('listarPedidos*') || Request::is('listarFacturas*') || Request::is('listarRemitos*') || Request::is('notaDebito*') || Request::is('notaCredito*') || Request::is('verRemito*') || Request::is('crearND*') || Request::is('crearNC*')) ? 'active open' : ''  }} treeview">

                            <a href="#"><i class="fa fa-link"></i> <span>Ventas</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                            </a>
                            <ul class="treeview-menu">
                                <li class="{{ Request::is('listarPedidos*') ? 'active open' : ''  }}"><a href="/listarPedidos">Pedidos</a></li>
                                
                                @if(Auth::user()->roles_id!=3)
                                    <li class="{{ Request::is('listarFacturas*') ? 'active open' : ''  }}"><a href="/listarFacturas">Facturación</a></li>

                                    <li class="{{ (Request::is('listarRemitos*') || Request::is('verRemito*')) ? 'active open' : ''  }}"><a href="/listarRemitos">Remito</a></li>

                                    <li class="{{ (Request::is('notaDebito*') || Request::is('crearND*')) ? 'active open' : ''  }}"><a href="/notaDebito">Nota de Debito</a></li>

                                    <li class="{{ (Request::is('notaCredito*') || Request::is('crearNC*')) ? 'active open' : ''  }}"><a href="/notaCredito">Nota de Credito</a></li>
                                @endif
                            </ul>
                        </li>
                    @endif

                    <li class="{{ (Request::is('caja*') || Request::is('cierre*') || Request::is('conceptosCaja*') || Request::is('movimiento*') || Request::is('cerrarCaja*')) ? 'active open' : ''  }} treeview">

                        <a href="#"><i class="fa fa-link"></i> <span>Caja</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="{{ (Request::is('caja*') || Request::is('movimiento*') || Request::is('cerrarCaja*')) ? 'active open' : ''  }}"><a href="/caja">Diaria</a></li>
                            <li class="{{ Request::is('cierre*') ? 'active open' : ''  }}"><a href="/cierre">Cierres</a></li>
                            <li class="{{ Request::is('conceptosCaja*') ? 'active open' : ''  }}"><a href="/conceptosCaja">Conceptos</a></li>
                        </ul>
                    </li>

                    @if(Auth::user()->roles_id!=3)
                        <li class="{{ Request::is('stock*') ? 'active open' : ''  }}"><a href="/stock"><i class="fa fa-link"></i> <span>Stock</span></a></li>
                    @endif  

                    @if(Auth::user()->roles_id==1)
                        <li class="{{ Request::is('viewProd*') ? 'active open' : ''  }}"><a href="/viewProd"><i class="fa fa-link"></i> <span>Producción</span></a></li>
                        <li class="{{ Request::is('costo*') ? 'active open' : ''  }}"><a href="/costo"><i class="fa fa-link"></i> <span>Costos</span></a></li>

                        <li class="{{ (Request::is('cajaEspecial*') || Request::is('cierreEspecial*') || Request::is('conceptosCajaEspecial*')) ? 'active open' : ''  }} treeview">

                            <a href="#"><i class="fa fa-link"></i> <span>Caja Privada</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                            </a>
                            <ul class="treeview-menu">
                                <li class="{{ Request::is('cajaEspecial*') ? 'active open' : ''  }}"><a href="/cajaEspecial">Diaria</a></li>
                                <li class="{{ Request::is('cierreEspecial*') ? 'active open' : ''  }}"><a href="/cierreEspecial">Cierres</a></li>
                                <li class="{{ Request::is('conceptosCajaEspecial*') ? 'active open' : ''  }}"><a href="/conceptosCajaEspecial">Conceptos</a></li>
                            </ul>
                        </li>
                    @endif 

                    <li class="{{ (Request::is('ctacte*') || Request::is('asignarCorredor*')) ? 'active open' : ''  }} treeview">

                        <a href="#"><i class="fa fa-link"></i> <span>Clientes</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="{{ Request::is('ctacte*') ? 'active open' : ''  }}"><a href="/ctacte">Cuentas Corrientes</a></li>
                            
                            @if(Auth::user()->roles_id!=3)
                                <li class="{{ Request::is('asignarCorredor*') ? 'active open' : ''  }}"><a href="/asignarCorredor">Asignar Corredor</a></li>
                            @endif
                        </ul>
                    </li>        

                    @if(Auth::user()->roles_id!=3)  
                        <li class="{{ (Request::is('proveedores*') || Request::is('compras*') || Request::is('#*')) ? 'active open' : ''  }} treeview">

                            <a href="#"><i class="fa fa-link"></i> <span>Proveedores</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                            </a>
                            <ul class="treeview-menu">
                                <li class="{{ Request::is('proveedores*') ? 'active open' : ''  }}"><a href="/proveedores">Alta y Modificación</a></li>
                                <li class="{{ Request::is('compras*') ? 'active open' : ''  }}"><a href="/compras">Compras</a></li>
                                <li class=""><a href="#">Pagos</a></li>
                            </ul>
                        </li>

                        <li class="{{ (Request::is('ventas*') || Request::is('#*') || Request::is('cuentaCorriente*') || Request::is('ivaVentas*') || Request::is('listadoCtaCte*') || Request::is('reporteCaja*') || Request::is('reporteCajaEspecial*')) ? 'active open' : ''  }} treeview">

                            <a href="#"><i class="fa fa-link"></i> <span>Listados</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                            </a>
                            <ul class="treeview-menu">
                                @if(Auth::user()->roles_id==1)
                                    <li class="{{ Request::is('ventas*') ? 'active open' : ''  }}"><a href="/ventas">Detalle de Ventas</a></li>
                                @endif
                                <li class=""><a href="#">Clientes</a></li>
                                <li class="{{ Request::is('cuentaCorriente*') ? 'active open' : ''  }}"><a href="/cuentaCorriente">Cuentas Corrientes Clientes</a></li>
                                <li class="{{ Request::is('ivaVentas*') ? 'active open' : ''  }}"><a href="/ivaVentas">I.V.A. Ventas</a></li>
                                <li class=""><a href="#">Proveedores</a></li>
                                <li class="{{ Request::is('listadoCtaCte*') ? 'active open' : ''  }}"><a href="/listadoCtaCte">Listado Pago Cta. Cte.</a></li>
                                <li class="{{ Request::is('cuentaCorriente*') ? 'active open' : ''  }}"><a href="/cuentaCorriente">Cuentas Corrientes Clientes</a></li>
                                <li class="{{ Request::is('ivaVentas*') ? 'active open' : ''  }}"><a href="/ivaVentas">I.V.A. Ventas</a></li>
                                <li class="{{ Request::is('reporteCaja*') ? 'active open' : ''  }}"><a href="/reporteCaja">Caja</a></li>
                                <li class="{{ Request::is('reporteCajaEspecial*') ? 'active open' : ''  }}"><a href="/reporteCajaEspecial">Caja Especial</a></li>
                                <li class=""><a href="#">Banco</a></li>
                                <li class=""><a href="#">Cheques de Terceros</a></li>
                                <li class=""><a href="#">Tarjetas</a></li>
                            </ul>
                        </li>

                        <li class="{{ (Request::is('#*') || Request::is('#*') || Request::is('#*')) ? 'active open' : ''  }} treeview">

                            <a href="#"><i class="fa fa-link"></i> <span>Parámetros</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                            </a>
                            <ul class="treeview-menu">
                                <li class=""><a href="#">Empresa</a></li>
                                <li class=""><a href="#">Tipo de Cbtes.</a></li>
                                <li class=""><a href="#">Formas de Pago</a></li>
                                <li class=""><a href="#">Bancos</a></li>
                                <li class=""><a href="#">Conceptos de Caja</a></li>
                            </ul>
                        </li>                               
                        
                    @endif            
                @endif
                <!--
                <li class="active"><a href="#"><i class="fa fa-link"></i> <span>Link</span></a></li>
                <li><a href="#"><i class="fa fa-link"></i> <span>Another Link</span></a></li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>Multilevel</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#">Link in level 2</a></li>
                        <li><a href="#">Link in level 2</a></li>
                    </ul>
                </li>-->
            </ul>
            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            @yield('page-header')
        </section>

        <!-- Main content -->
        <section class="content">
            @yield('content')
            <!-- Your Page Content Here -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">

        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2016 <a href="#">Toallasd</a>.</strong> Todos los derechos reservados.
    </footer>

    <!-- Control Sidebar -->
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.3 -->
<script src="{{ asset('/adminlte/plugins/jQuery/jquery-2.2.3.min.js') }}"></script>
<!-- Bootstrap 3.3.6 -->
<script src="{{ asset('/adminlte/bootstrap/js/bootstrap.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('/adminlte/js/app.min.js') }}"></script>

@yield('scripts')

</body>
</html>