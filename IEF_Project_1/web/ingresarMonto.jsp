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
        
            <%
                        List<Cuenta> lista=(List)request.getAttribute("listaCuentas");
                %>
                
                 <%!
                    public String textoNumCuenta(String nro)
                    {
                        return nro.substring(0,3)+"-"+nro.substring(3,11)+"-0-"+nro.substring(12,14);
                    }
                    
              %>
                
         <%@include file="validarSesion.jsp" %>
      
       
    </head>   
    <body>
        
            <%@include file="header.jsp" %>

            <%@include file="sidebar.jsp" %>

		<!-- Dashboard Wrapper starts -->
		<div class="dashboard-wrapper">

			<!-- Top Bar starts -->
			<div class="top-bar">
				<div class="page-title">
					<i class="fa fa-plus-square"></i>&nbsp Ingresar Monto
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
						
						<!-- Row Starts -->
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="blog">
									<div class="blog-header">
										<h5 class="blog-title"><i class="fa fa-plus-square"></i>&nbsp Ingrese el monto a depositar</h5>
									</div>
									<div class="blog-body">
										<form class="form-horizontal" role="form" method="post" action="ServletCuenta">
										  <div class="form-group">
										    <label for="inputDeposito" class="col-sm-2 control-label">Monto de depósito</label>
										    <div class="col-sm-4">
										      <input type="number" min="0" step="0.5" class="form-control" id="inputDeposito" name="montoS" placeholder="S/.">
										    </div>
										  </div>
                                                                                                                                                                   <div class="form-group">
                                                                                                                                                                       <label  for="inputCuenta" class="col-sm-2 control-label">Nro de Cuenta</label>
                                                                                                                                                                           <div class="col-sm-4">
                                                                                                                                                                            <select class="form-control" id="inputCuenta" name="cuentaid">
											<option value="" disabled selected>Seleccione una cuenta</option>
											<% for(int i=0;i<lista.size();i++){%>
                                                                                                                                                                                <option value="<%= lista.get(i).getCuentaId()%>"><%= textoNumCuenta(lista.get(i).getNroCuenta()) %></option>
                                                                                                                                                                                <% } %>
                                                                                                                                                                            </select>
                                                                                                                                                                          </div>
										</div>
                                                                                    
										  <div class="form-group">
										    <label for="inputMotivo" class="col-sm-2 control-label">Motivo</label>
										    <div class="col-sm-4">
                                                                                                                                                                    <textarea class="form-control" rows="5" name="motivo" id="inputMotivo" placeholder="Detalle o descripción "></textarea>
                                                                                                                                                                    
										    </div>
										  </div>
                                                                                                                                                                   <div class="form-group">
                                                                                                                                                                        <label for="inputEmail3" class="col-sm-2 control-label">&nbsp</label>
                                                                                                                                                                       <div class="col-sm-10">
                                                                                                                                                                   <button type="submit" class="btn btn-success"><i class="fa fa-usd"></i> Ingresar</button>
                                                                                                                                                                        </div>
                                                                                                                                                                   </div>
                                                                                                                                                                     
                                                                                                                                                                    
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- Row Ends -->
												

					</div>
					<!-- Spacer ends -->  
				</div>
				<!-- Container fluid ends -->
                                
                                                   
                                                
			
                                                                                                  
                                                <%@include file="footer.jsp" %>
			
                </div>
		<!-- Dashboard Wrapper ends -->

                
                
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="assets/js/jquery.js"></script>

		<!-- jQuery UI JS -->
		<script src="assets/js/jquery-ui-v1.10.3.js"></script>

		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- Sparkline graphs -->
		<script src="assets/js/sparkline.js"></script>

		<!-- jquery ScrollUp JS -->
		<script src="assets/js/scrollup/jquery.scrollUp.js"></script>

		<!-- Notifications JS -->
		<script src="assets/js/alertify/alertify.js"></script>
		<script src="assets/js/alertify/alertify-custom.js"></script>

		<!-- Flot Charts -->
		<script src="assets/js/flot/jquery.flot.js"></script>
		<script src="assets/js/flot/jquery.flot.tooltip.min.js"></script>
		<script src="assets/js/flot/jquery.flot.resize.min.js"></script>
		<script src="assets/js/flot/jquery.flot.stack.min.js"></script>
		<script src="assets/js/flot/jquery.flot.orderBar.min.js"></script>
		<script src="assets/js/flot/jquery.flot.pie.min.js"></script>

		<!-- JVector Map -->
		<script src="assets/js/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
		<script src="assets/js/jvectormap/jquery-jvectormap-usa.js"></script>

		<!-- Custom Index -->
		<script src="assets/js/custom.js"></script>
		<script src="assets/js/custom-index.js"></script>
        
        
                
        
    </body>
</html>
