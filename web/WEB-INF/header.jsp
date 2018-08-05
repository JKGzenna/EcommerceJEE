<%-- 
    Document   : header publico
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
									<li><a href="CambiarMoneda?moneda=EUR">Euros (EUR)</a></li>
									<li><a href="CambiarMoneda?moneda=LIB">Libras (LIB)</a></li>
									<li><a href="CambiarMoneda?moneda=USD">Dólares (USD)</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-user"></i> Mi cuenta</a></li>
								<li><a href="Cart"><i class="fa fa-shopping-cart"></i> Ver carrito</a></li>
								<li><a href="http://localhost:8080/EcommerceJEE/checkout.jsp"><i class="fa fa-crosshairs"></i> Finalizar compra</a></li>
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
								<li><a href="Inicio" class="active">Inicio</a></li>
                                                                <li><a href="#">Productos</a></li>
                                                                <li><a href="#">Productos Recomendados</a></li> 
                                                                <li><a href="#">Productos en Promoción</a></li>
                                                                <li class="dropdown"><a href="#">Mi Compra<i class="fa fa-angle-down"></i></a>
                                                                    <ul role="menu" class="sub-menu">
                                                                        <li><a href="http://localhost:8080/EcommerceJEE/checkout.jsp">Finalizar compra</a></li> 
                                                                        <li><a href="Cart">Ver carrito</a></li> 
                                                                        <li><a href="#">Iniciar sesión</a></li> 
                                                                    </ul>
                                                                </li>
                                                                <li><a href="#">Contacto</a></li>
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