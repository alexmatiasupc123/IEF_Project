<%-- 
    Document   : listapersonas
    Created on : 18/09/2015, 05:48:43 PM
    Author     : Alex
--%>

<%@page import="upc.edu.entitys.Cuenta"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido :)</title>        
        <link rel="icon" type="text/x-icon" href="assets/img/person.ico"/>       
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
            <link href="assets/css/bootstrap.css" rel="stylesheet" media="screen">
            <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
            <link href="assets/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>           
             <link href="assets/css/responsive.bootstrap.min.css" rel="stylesheet" type="text/css"/>
           
            
            <!-- Animate CSS -->
            <link href="assets/css/animate.css" rel="stylesheet" media="screen">
            <!-- Alertify CSS -->
            <link href="assets/css/alertify/alertify.core.css" rel="stylesheet">
            <link href="assets/css/alertify/alertify.default.css" rel="stylesheet">
            <!-- Main CSS -->
            <link href="assets/css/main.css" rel="stylesheet" media="screen">
            <!-- Datepicker CSS -->
            <link rel="stylesheet" type="text/css" href="assets/css/datepicker.css">
            <!-- Font Awesome -->
            <link href="assets/fonts/font-awesome.min.css" rel="stylesheet">
        
        
         <%@include file="validarSesion.jsp" %>
         
         <%
                    List<Cuenta> lista=(List)request.getAttribute("listaCuentas");
                    String mensajeConfirmacion=(String)request.getAttribute("mensajeConfirmacion");                                      
         %>      
         
         <%!
                    public String textoNumCuenta(String nro)
                    {
                        return nro.substring(0,3)+"-"+nro.substring(3,11)+"-0-"+nro.substring(12,14);
                    }
                    
              %>
       
    </head>   
    <body>
        
            <%@include file="header.jsp" %>

            <%@include file="sidebar.jsp" %>

		<!-- Dashboard Wrapper starts -->
		<div class="dashboard-wrapper">

			<!-- Top Bar starts -->
			<div class="top-bar">
				<div class="page-title">
					<i class="fa fa-credit-card"></i>&nbsp Administración de Cuentas
				</div>
				<ul class="stats hidden-xs">
					<li>
						
						<div class="stats-details">
							<h4>$<span id="today_income">580</span> <i class="fa fa-chevron-up up"></i></h4>
							<h5>Today's Income</h5>
						</div>
					</li>
					<li>
						
						<div class="stats-details">
							<h4>$<span id="today_expenses">235</span> <i class="fa fa-chevron-down down"></i></h4>
							<h5>Today's Expenses</h5>
						</div>
					</li>
				</ul>
			</div>
			<!-- Top Bar ends -->

			

				<!-- Container fluid Starts -->
				<div class="container-fluid">
                                    
                                                                                <!-- Spacer starts -->
					<div class="spacer">
						
                                                            <div class="row">   
                                                                                                            <%if(mensajeConfirmacion!=null){ %>
                                                                                                                <div class="alert alert-success">
												<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
												<strong>Bien Hecho!</strong> <%= mensajeConfirmacion %>.
							</div>
                                                                                                                <% }%>
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="blog">
									<div class="blog-header">
										<h5 class="blog-title"><i class="fa fa-credit-card"></i>&nbsp Administre las cuentas</h5>
									</div>
									<div class="blog-body">
										<div class="table-responsive">
											<div  class="table-responsive example_alt_pagination clearfix">
												<table id="data-table" class="table table-condensed table-striped table-hover table-bordered pull-left dt-responsive nowrap dtr-inline collapsed" width="100%">    
													<thead>
														<tr>
															<th style="width:3%">
                                                                                                                                                                                                                                                        &nbsp;
															</th>
															<th style="width:12%">N° de Cuenta</th>
															<th style="width:10%">Código de Usuario</th>
                                                                                                                                                                                                                                                <th style="width:15%">DNI</th>
															<th style="width:32%">Nombre y Apellido</th>
															<th style="width:15%">Opciones</th>
															
														</tr>
													</thead>
													<tbody>
                                                                                                                                                                                                                            <%if(lista!=null){ for(int i=0;i<lista.size();i++){ %>
                                                                                                                                                                                                                            <tr>
                                                                                                                                                                                                        <td class="center-align-text" ><%= i+1 %> </td>
                                                                                                                                                                                                        <td><%= textoNumCuenta(lista.get(i).getNroCuenta())%> </td>
                                                                                                                                                                                                        <td><%= lista.get(i).getUsuarioId().getCodigo() %> </td>
                                                                                                                                                                                                        <td><%= lista.get(i).getUsuarioId().getDni() %> </td>
                                                                                                                                                                                                        <td><%= lista.get(i).getUsuarioId().getNombre()+" "+lista.get(i).getUsuarioId().getApellido() %> </td>
                                                                                                                                                                                                        <td class="center-align-text"><a class="btn btn-danger" href="ServletUsuario?crud=disable&accion=adminc&id=<%=lista.get(i).getCuentaId()%>"><i class="fa fa-trash-o"></i>&nbsp Inhabilitar</a> </td>
                                                                                                                                                                                                                        </tr>
                                                                                                       
                                                                                                                                                                                                                                
                                                                                                                                                                                                                               <% } } %>
														
													</tbody>
                                                                                                                                                                                                        <div class="row">
                                                                                                                                                                                                            &nbsp;
                                                                                                                                                                                                        </div>
												</table>
                                                                                                                                                                                                   <a class="btn btn-success" href="ServletUsuario?crud=insert&accion=adminc"><i class="fa fa-credit-card"></i>&nbsp Registrar Nueva Cuenta</a>
                                                                                                                                                                                                        
                                                                                                                                                                                                        
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Row Ends -->

                                                                        
                                        </div>
                                                    <!-- Spacer starts -->
				</div>
				<!-- Container fluid ends -->
                                
                                                   
                                                
			
                                                                                                  
                                                <%@include file="footer.jsp" %>
			
                </div>
		                
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="assets/js/jquery.js"></script>

		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- Sparkline graphs -->
		<script src="assets/js/sparkline.js"></script>                
                                
		<!-- Data tables -->
		 <script src="assets/js/jquery.dataTables.js" type="text/javascript"></script>
                                
                                <!-- jquery ScrollUp JS -->
		<script src="assets/js/scrollup/jquery.scrollUp.js"></script>
		
		<!-- Custom Index -->
		<script src="assets/js/custom.js"></script>
		<script src="assets/js/custom-datatables.js"></script>
                
                <script src="assets/js/dataTables.bootstrap.js" type="text/javascript"></script>
                <script src="assets/js/dataTables.responsive.min.js" type="text/javascript"></script>
                 
                
               
                
                	


		
        
        
                
        
    </body>
</html>
