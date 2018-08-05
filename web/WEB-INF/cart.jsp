<%-- 
    Document   : cart
    Created on : 28-Julio-2018, 10:24:59
    Author     : Juan Luis Goldaracena Izquierdo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>Carrito |  e-Commerce JAVA EE con pagos Online</title>
    
    <%@include file="../WEB-INF/css.jsp" %>
    
</head><!--/head-->

<body>
	
    <%@include file="../WEB-INF/header.jsp" %>

<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Carrito</a></li>
				  <li class="active">Lista de productos</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Producto</td>
							<td class="description"></td>
							<td class="price">Precio</td>
							<td class="quantity">Cantidad</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
                                            <c:forEach items="${sessionScope.cart}" var="pro">
                                                <c:set  var="total" value="${total+pro.p.precio*pro.cantidad}"/>
						<tr>
							<td class="cart_product">
                                                            <a href=""><img src="foto/${pro.p.img}" width="110px" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">${pro.p.nombre}</a></h4>
								<p>ID Referencia Web: ${pro.p.webid}</p>
							</td>
							<td class="cart_price">
								<p>${pro.p.precio}</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="${pro.cantidad}" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p id="precio_1" class="cart_total_price">
                                                                    <fmt:setLocale value="en_US"/>
                                                                    <fmt:formatNumber value="${pro.p.precio*pro.cantidad}" type="currency"/>
                                                                    
                                                                </p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href="?action=delete&id=${pro.p.webid}"><i class="fa fa-times"></i></a>
							</td>
						</tr>
                                            </c:forEach>
						
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>¿Qué te gustaría hacer ahora?</h3>
				<p>Te gustaría pagar o seguir comprando?</p>
			</div>
			<div class="row">
				
				<div class="col-sm-10">
					<div class="total_area">
						<ul>
							<li>Sub Total <span>${total}</span></li>
							<li>Tax/IVA(21%) <span>${total*0.21}</span></li>
                                                        <li><h3>Total <span>${total+(total*0.21)}</span></h3></li>
						</ul>
                                            <a class="btn btn-default update" href="Inicio">Seguir comprando</a>
                                            <a class="btn btn-default check_out" href="checkout.jsp">Realizar pago</a>
					</div>
				</div>
			</div>
		</div>
	</section>
                                    <%@include file="../WEB-INF/footer.jsp" %>
                                    <%@include file="../WEB-INF/js.jsp" %>
	

</body>
</html>
