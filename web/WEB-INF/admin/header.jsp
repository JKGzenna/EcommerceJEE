<%-- 
    Document   : header de zona admin
    Created on : 28-Julio-2018, 10:24:59
    Author     : Juan Luis Goldaracena Izquierdo
--%>

<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="https://github.com/JKGzenna"><i class="fa fa-github"></i> JKGzenna</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> juanlu360@gmail.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
						</div>

						<div class="btn-group pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                                                    ${sessionScope.nom_moneda} (${sessionScope.moneda})
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="CambiarMonedaAdmin?moneda=EUR">Euros (EUR)</a></li>
									<li><a href="CambiarMonedaAdmin?moneda=LIB">Libras (LIB)</a></li>
									<li><a href="CambiarMonedaAdmin?moneda=USD">Dólares (USD)</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="Admin"><i class="fa fa-lock"></i> Administradores</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Navegación</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
                                            
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
                                                            <li><a href="Admin">Registrar Productos</a></li>
                                                            <li><a href="RegistroDeMarca">Registrar Marcas</a></li>
                                                            <li><a href="RegistroDeCategoria">Registrar Categorías</a></li>
                                                            <li><a href="RegistroDeSubCategoria">Registrar Subcategorías</a></li>
                                                                 
                                                                
							</ul>
						</div>
                                            
					</div>
<!--                                    <div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Buscar..."/>
						</div>
					</div>-->
            	
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->