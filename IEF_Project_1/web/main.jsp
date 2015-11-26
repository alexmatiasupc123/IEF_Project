

<%@page import="upc.edu.entitys.Cuenta"%>

<% String nombreCompleto=(String)session.getAttribute("nombre"); %>
                                        
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido, Sr. <%= nombreCompleto %> </title>        
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
                    String mensajeConfirmacion=(String)request.getAttribute("mensajeConfirmacion");            
                Object cost=session.getAttribute("costo");
                Object  tas=session.getAttribute("tdcto");
                Object ro=session.getAttribute("rol");
                Object va=request.getAttribute("vanRes");
                
                String costo="";
                String rolex="";
                  double tasa=0;
                double tasaA=0;
                double van=0;
                  String tasaS="";
                if(cost!=null)
                    costo=cost.toString();
                if(tas!=null)
                {
                    tasa=Double.parseDouble(tas.toString())*100;
                    tasaA=Math.pow((1+tasa/100),360)-1;
                    tasaS=(tasaA*100+"").substring(0, 4);
                }
                if(ro!=null)
                    rolex=ro.toString();
                if(va!=null)
                    van=Double.parseDouble(va.toString());
            %>
            
            <%
                        List<Cuenta> listaCuentas=(List)request.getAttribute("listaCuentas");
                         
                %>
                
                 <%!
                    public String textoNumCuenta(String nro)
                    {
                        return nro.substring(0,3)+"-"+nro.substring(3,11)+"-0-"+nro.substring(12,14);
                    }
                    
              %>
      
       
    </head>   
    <body>
        
                <%@include file="validarSesion.jsp" %>
            <%@include file="header.jsp" %>

            <%@include file="sidebar.jsp" %>

		<!-- Dashboard Wrapper starts -->
		<div class="dashboard-wrapper">

			<!-- Top Bar starts -->
			<div class="top-bar">
				<div class="page-title">
					<i class="fa fa-dashboard"></i>&nbsp Dashboard
				</div>
				
			</div>
			<!-- Top Bar ends -->

			

				<!-- Container fluid Starts -->
				<div class="container-fluid">
                                                                                
                                                                              
					<!-- Current Stats Start -->
					<div class="current-stats">
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
								<div class="danger-bg center-align-text">
									<div class="spacer-xs">
										<i class="fa fa-usd fa-2x"></i>
										<small class="text-white">Comision</small>
										<h3 class="no-margin no-padding">S/. <%= costo %></h3>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
								<div class="success-bg center-align-text">
									<div class="spacer-xs">
										<i class="fa fa-calculator fa-2x"></i>
										<small class="text-white">TED</small>
										<h3 class="no-margin no-padding text-white"><%= tasa %> %</h3>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
								<div class="info-bg center-align-text">
									<div class="spacer-xs">
										<i class="fa fa-calculator fa-2x"></i>
										<small class="text-white">TREA</small>
										<h3 class="no-margin no-padding"><%= tasaS %> %</h3>
									</div>
								</div>
							</div>
							
						</div>
					</div>
					<!-- Current Stats End -->
                                                                      
                                        <% if(rolex.equals("CLI")){ %>
					<!-- Spacer starts -->
					<div class="spacer">
						
                                                                                    <div class="row">
                                                    
                                                                                                            <%if(mensajeConfirmacion!=null){ %>
                                                                                                                <div class="alert alert-success">
												<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
												<strong>Bien Hecho!</strong> <%= mensajeConfirmacion %>.
							</div>
                                                                                                                <% }%>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="blog">
									<div class="blog-header">
										<h5 class="blog-title"><i class="fa fa-plus-usd"></i>&nbsp Calcular VAN</h5>
									</div>
									<div class="blog-body">
										<form class="form-horizontal" role="form" method="post" action="ServletCuenta">
										  <div class="form-group">
										    <label for="inputDeposito" class="col-sm-2 control-label">Período (días) </label>
										    <div class="col-sm-4">
										      <input type="number" min="7" step="1" class="form-control" id="inputDeposito" name="dias" placeholder="Dias" required>
                                                                                                                                                                        <input type="hidden" value="van" name="van"/>
										    </div>
										  </div>
                                                                                                                                                             <div class="form-group">
                                                                                                                                                                       <label  for="inputCuenta" class="col-sm-2 control-label">Nro de Cuenta</label>
                                                                                                                                                                           <div class="col-sm-4">
                                                                                                                                                                            <select class="form-control" id="inputCuenta" name="cuentaid" required>
											<option value="" disabled selected>Seleccione una cuenta</option>
											<% for(int i=0;i<listaCuentas.size();i++){%>
                                                                                                                                                                                <option value="<%= listaCuentas.get(i).getCuentaId()%>"><%= textoNumCuenta(listaCuentas.get(i).getNroCuenta()) %></option>
                                                                                                                                                                                <% } %>
                                                                                                                                                                            </select>
                                                                                                                                                                          </div>
										</div>
                                                                                    
										 
                                                                                                                                                                   <div class="form-group">
                                                                                                                                                                        <label for="inputEmail3" class="col-sm-2 control-label">&nbsp</label>
                                                                                                                                                                       <div class="col-sm-10">
                                                                                                                                                                   <button type="submit" class="btn btn-success"><i class="fa fa-usd"></i> Calcular</button>
                                                                                                                                                                        </div>
                                                                                                                                                                   </div>
                                                                                                                                                                     
                                                                                                                                                                   
										</form>
                                                                                                                                                                            
                                                                                                                                                                            <% if(va!=null){ %>
                                                                                                                                                                            <h2>VAN: </h2><h3><%= van %></h3>
                                                                                                                                                                            <% } %>
									</div>
								</div>
							</div>
						</div>
						<!-- Row Ends -->

					</div>
					<!-- Spacer ends -->
                                        <% }else{ %>
                                        
                                        <div clas="row">&nbsp;</div>
                                        <div clas="row">&nbsp;</div>
                                        <div clas="row">&nbsp;</div>
                                        <div clas="row">&nbsp;</div>
                                        <div clas="row">&nbsp;</div>
                                        
                                        <% } %>
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
