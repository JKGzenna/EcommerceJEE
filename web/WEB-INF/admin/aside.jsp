<%-- 
    Document   : aside admin que no enlaza a listar productos de categorias ni subcategorias, solo para control del registro
    Created on : 28-Julio-2018, 10:24:59
    Author     : Juan Luis Goldaracena Izquierdo
--%>

<%@page import="JavaBeans.CategoriaSuperior"%>
<%@page import="dao.MarcaDao"%>
<%@page import="dao.CategoriaDao"%>
<%@page import="JavaBeans.SubCategoria"%>
<%@page import="java.util.ArrayList"%>

<div class="left-sidebar">
						<h2>Categorías</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                                <%! 
                                                    ArrayList<CategoriaSuperior> lista=CategoriaDao.listarCategoriaSuperior(); 
                                                    int codigo;
                                                %>             
                                                <% 
                                                    for (int i=0;lista.size()>i;i++){ 
                                                    codigo=lista.get(i).getCodigo();
                                                %>
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <a 
                                                                    <% if(CategoriaDao.esSuperior(codigo)) { %> 
                                                                    data-toggle="collapse" data-parent="#accordian"
                                                                    <% } %>
                                                                    href="#<%= codigo %>">
                                                                    <% if(CategoriaDao.esSuperior(codigo)) { %>
                                                                    <span class="badge pull-right">
                                                                    <i class="fa fa-plus"></i>
                                                                    </span>
                                                                    <% } %>
                                                                    <!-- no incluimos el href ni el controlador para que no nos liste las categorias superiores -->
                                                                    <%= lista.get(i).getNombre()%>  
                                                                </a>
                                                            </h4>
                                                        </div>    
                                                        <div id="<%= codigo %>" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <ul>                
                                                                    <%
                                                                        ArrayList<SubCategoria> listaSub=CategoriaDao.listarSubCategorias(codigo); 
                                                                    %>
                                                                    <% 
                                                                    for (int isub=0;listaSub.size()>isub;isub++){ 
                                                                    codigo=listaSub.get(isub).getCodigo();
                                                                    %>
                                                                    <!-- no incluimos el href ni el controlador para que no nos liste las subcategorias -->
                                                                    <li><a"<%--= codigo --%>"> <%= listaSub.get(isub).getNombre() %> </a></li>
                                                                    <% } %>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <% } %>
						</div><!--/category-products-->
			
                                                <div class="brands_products"><!--brands_products-->
							<h2>Marcas</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
                                                                    <c:forEach var="m" items="<%= MarcaDao.listarTodoDeMarcas() %>">
                                                                        <c:set var="cod" value="${m.codigo}"/>
                                                                        <% int cod=Integer.parseInt(pageContext.getAttribute("cod").toString()); %>
                                                                        <li><a ${m.codigo}"> <span class="pull-right">(<%= MarcaDao.contarMarcas(cod) %>)</span>${m.nombre}</a></li>
                                                                    </c:forEach>
								</ul>
							</div>
						</div><!--/brands_products-->

<!--						<div class="shipping text-center">shipping
							<img src="images/home/shipping.jpg" alt="" />
						</div>/shipping-->
                                                <br>
                                                <br>
					</div>