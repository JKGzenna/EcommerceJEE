<%-- 
    Document   : index publico
    Created on : 28-Julio-2018, 10:24:59
    Author     : Juan Luis Goldaracena Izquierdo
--%>

<%@page import="dao.ProductoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="JavaBeans.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>Inicio | e-Commerce JAVA EE con pagos Online</title>
    
    <%@include file="../WEB-INF/css.jsp" %>
    
</head><!--/head-->

<body>
	
    <%@include file="../WEB-INF/header.jsp" %>
	
    <%@include file="../WEB-INF/slider.jsp" %>  
        
    <%@include file="../WEB-INF/confianza.jsp" %>  
    
        <section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
                                    <%@include file="../WEB-INF/aside.jsp" %> 
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Productos</h2>
                                                <%! ArrayList<Producto> datos;%>
                                                <%
                                                if(Integer.parseInt(session.getAttribute("category").toString())>0){
                                                    datos=ProductoDao.listarPorSubCategoria(session.getAttribute("moneda").toString(),Integer.parseInt(session.getAttribute("category").toString()));
                                                }else if(Integer.parseInt(session.getAttribute("brand").toString())>0){
                                                    datos=ProductoDao.listarProductosPorMarca(session.getAttribute("moneda").toString(),Integer.parseInt(session.getAttribute("brand").toString()));
                                                }else{
                                                    datos=ProductoDao.listarProductosRecomendados(session.getAttribute("moneda").toString());
                                                }
                                                %>
                                                <c:forEach var="p" items="<%= datos %>">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="foto/${p.img}" alt="" />
                                                                                        <h2 <c:if test="${p.stock==0}"> class="gris" </c:if>>
                                                                                             <c:choose>
                                                                                                 <c:when test="${p.precionuevo!=0}">
                                                                                                    ${sessionScope.moneda} ${p.precionuevo} <strike class="gris">${p.precio}</strike>
                                                                                                 </c:when>
                                                                                                 <c:otherwise>
                                                                                                 ${sessionScope.moneda} ${p.precio}
                                                                                                 </c:otherwise>
                                                                                             </c:choose>
                                                                                            
                                                                                        </h2>
											<p>${p.nombre}</p>
											<span class="btn btn-default add-to-cart <c:if test="${p.stock==0}"> disabled </c:if>"><i class="fa fa-shopping-cart"></i>Agregar al carrito</span>
										</div>
										<div class="product-overlay <c:if test="${p.stock==0}"> grisfondo </c:if>">
											<div class="overlay-content">
												<h2>${sessionScope.moneda} ${p.precio}</h2>
												<p>${p.nombre}</p>
												<a href="Cart?id=${p.webid}&action=order" class="btn btn-default add-to-cart <c:if test="${p.stock==0}"> disabled </c:if>"><i class="fa fa-shopping-cart"></i>Agregar al carrito</a>
											</div>
										</div>
                                                                                                <c:choose>
                                                                                                    <c:when test="${p.precionuevo!=0}">
                                                                                                            <img src="images/home/sale.png" class="new" alt="producto en promoción"/>
                                                                                                    </c:when>
                                                                                                    <c:otherwise>
                                                                                                        <c:if test="${p.nuevo}">
                                                                                                            <img src="images/home/new.png" class="new" alt="producto nuevo"/>
                                                                                                        </c:if>
                                                                                                    </c:otherwise>
                                                                                                </c:choose>
                                                                                
                                                                </div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href=""><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></a></li>
                                                                                <li><a href="#" <c:if test="${p.stock==0}"> class="gris" </c:if>>
                                                                                    <c:choose>
                                                                                        <c:when test="${p.stock>0}">
                                                                                            <i class="fa fa-check-circle"></i>(<c:out value="${p.stock}"/>) Disponible
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <i class="fa fa-lock"></i>(<c:out value="${p.stock}"/>) Agotado
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                    </a>
                                                                                </li>
                                                                        </ul>
								</div>
							</div>
						</div>
                                                </c:forEach>
					</div><!--features_items-->
				</div>
			</div>
		</div>
	</section>
	
                                    <%@include file="../WEB-INF/footer.jsp" %>
                                    <%@include file="../WEB-INF/js.jsp" %>
</body>
</html>
