<%-- 
    Document   : index admin registro de categorias superiores
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
                                        Registrar Categorías Superiores
                                    </p>
                                </h2>	
                                <%=(request.getAttribute("mensajecatsup")!=null?request.getAttribute("mensajecatsup"):"")%>  	
                                    <form action="RegistroDeCategoriaController" method="post" class="form-horizontal">
                                        <br><br>
                                        <div class="form-group">
                                        <label class="col-sm-3 control-label no-paddding-right">
                                            Nombre de la Categoría
                                        </label>
                                        <div class="col-sm-4">
                                            <input type="text" name="nombre" value="" placeholder="Escriba un nombre"/>
                                        </div> 
                                        </div>
                                        <br>
                                        Visible <input type="checkbox" name="visible" value="ON" checked="checked" />
                                        <div class="col-sm-4">
                                        <button name="Registrar" class="btn btn-success" type="submit" value="Registrar">
                                            <i class="fa fa-save"></i>
                                            Registrar  
                                        </button>
                                        <button name="Eliminar" class="btn btn-danger" type="submit" value="Eliminar">
                                            <i class="fa fa-eraser"></i>
                                            Eliminar
                                        </button>
                                        <br><br>
                                        <br><br>
                                    </div>
                                </form> 
                            </div>
                            <div class="col-sm-6">
                                <h5>
                                    <p style='color:green'>
                                        Tenga en cuenta que las categorías superiores no 
                                        contienen productos sino subcategorías específicas 
                                        del tipo de producto definido en la categoría superior
                                    </p>
                                </h5>
                            </div>
			</div>
		</div>
	</section>
                                    <%@include file="../../WEB-INF/footer.jsp" %>
                                    <%@include file="../../WEB-INF/js.jsp" %>
</body>
</html>
