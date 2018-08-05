<%-- 
    Document   : index admin registro de productos
    Created on : 28-Julio-2018, 10:24:59
    Author     : Juan Luis Goldaracena Izquierdo
--%>

<%@page import="JavaBeans.SubCategoria"%>
<%@page import="JavaBeans.CategoriaSuperior"%>
<%@page import="dao.MarcaDao"%>
<%@page import="JavaBeans.Marca"%>
<%@page import="dao.CategoriaDao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>Gestión de productos</title>
    
    <%@include file="../../WEB-INF/css.jsp" %>
    
</head><!--/head-->

<body>
	
    <%@include file="header.jsp" %>
    
        <section>
		<div class="container">
			<div class="row">
                            <div class="col-sm-3">
                                <%@include file="aside.jsp" %> 
                            </div>
                            
                            <div class="col-sm-9 padding-right">
<!--                        <div class="col-sm-10 clearfix">-->
                                <h2 class="title text-center">
                                    <p style='color:#F44336'>
                                        Gestionar Productos
                                    </p>
                                </h2>	
                                ${mensaje}  	
                                <form action="ProductoController" enctype="multipart/form-data" method="post">
                                    <div class="form-one">
                                        <br><br>
                                        Nombre<br>
                                        <input type="text" name="nombre" placeholder="Nombre producto" value="" required />
                                        <br><br>
                                        <hr>
                                        <br>
                                        Precio (EUR)<br>
                                        <input type="number" name="precio" placeholder="Precio" value="0" min="0" />
                                        <br><br>
                                        Precio Promo (EUR)<br>
                                        <input type="number" name="precionuevo" placeholder="Precio" value="0" min="0" />
                                        <br><br><br>
                                        Precio (LIB)<br>
                                        <input type="number" name="preciolib" placeholder="Precio" value="0" min="0" />
                                        <br><br>
                                        Precio Promo (LIB)<br>
                                        <input type="number" name="precionuevolib" placeholder="Precio" value="0" min="0" />
                                        <br><br><br>
                                        Precio (USD)<br>
                                        <input type="number" name="preciousd" placeholder="Precio" value="0" min="0" />
                                        <br><br>
                                        Precio Promo (USD)<br>
                                        <input type="number" name="precionuevousd" placeholder="Precio" value="0" min="0" />
                                        <br><br>
                                        <hr>
                                        <br>
                                        Stock<br>
                                        <input type="number" name="cantidad" placeholder="Cantidad" value="1" min="1" />
                                        <br><br>
                                        <br><br>
                                        Marca<br>
                                            <select name="marca">
                                                <option>Seleccione una marca</option>
                                                <% for(Marca m:MarcaDao.listarTodoDeMarcas()){ %>
                                                <option value="<%= m.getCodigo() %>"><%= m.getNombre() %></option>
                                                <% } %>
                                            </select>
                                        <br><br>
                                        <div>
                                        <br><br><hr>
                                        <h5>
                                            <p style='color:green'>
                                                Tenga en cuenta que las categorías superiores no contienen 
                                                productos sino subcategorías específicas del tipo de 
                                                producto definido en la categoría superior
                                            </p>
                                        </h5>   
                                        <br>
                                        Categorías Superiores<br>
                                            <select name="categoriasup">
                                                <option>Seleccione una categoría</option>
                                                <%for(CategoriaSuperior c:CategoriaDao.listarCategoriaSuperior()) {%>
                                                <option value="<%= c.getCodigo() %>"><%= c.getNombre() %></option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <br><br>
                                        <div>
                                        Subcategorías<br>
                                            <select name="subcategoria">
                                                <option>Seleccione una subcategoría</option>
                                                <%for(SubCategoria c:CategoriaDao.listarTodasSubCategorias()) {%>
                                                <option value="<%= c.getCodigo() %>"><%= c.getNombre() %></option>
                                                <% } %>
                                            </select>
                                        </div>
                                            <br><hr><br><br>
                                        Descripción del Producto<br>
                                        <textarea name="descripcion" rows="4" cols="20" placeholder="Descripción" required></textarea>
                                        <br><br><br>
                                        Nuevo <input type="checkbox" name="nuevo" value="ON" checked="checked" />
                                        Recomendado <input type="checkbox" name="recomendado" value="ON" />
                                        Visible <input type="checkbox" name="visible" value="ON" checked="checked" />
                                        <br><br>
                                        <h5>
                                            <p style='color:green'>
                                                Si añade un producto como Recomendado este aparecerá en la 
                                                página de productos de inicio en cuanto el usuario acceda
                                            </p>
                                        </h5>   
                                        <hr><br>
                                        Seleccione una imagen<br><br>
                                        <input type="file" name="imagen" value="Seleccionar una imagen" required />
                                        <br><hr>
                                        <br><br>
                                        <input class="btn btn-success" name="accion" type="submit" value="Registrar" />
                                        <input class="btn btn-default" name="accion" type="submit" value="Consultar" />
                                        <input class="btn btn-warning" name="accion" type="submit" value="Actualizar" />
                                        <input class="btn btn-danger" name="accion" type="submit" value="Borrar" />
                                        <br><br>
                                        <br><br>
                                    </div>
                                </form>
                            </div>                    
			</div>
		</div>
	</section>
                                    <%@include file="../../WEB-INF/footer.jsp" %>
                                    <%@include file="../../WEB-INF/js.jsp" %>
</body>
</html>
