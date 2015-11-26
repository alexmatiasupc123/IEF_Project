<%-- 
    Document   : listapersonas
    Created on : 18/09/2015, 05:48:43 PM
    Author     : Alex
--%>

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
            
              <!-- Bootstrap Datepicker CSS -->
            <link href="assets/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css"/>
        
        
         <%@include file="validarSesion.jsp" %>
         
         
         <%
                String codigo=(String)request.getAttribute("codigo");
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
					<i class="fa fa-users"></i>&nbsp Administración de Usuarios
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
										<h5 class="blog-title"><i class="fa fa-user-plus"></i>&nbsp Registrar Usuario </h5>
									</div>
									<div class="blog-body">
                                                                            <form class="form-horizontal" role="form" method="post" action="ServletUsuario" onsubmit="return validarFechaMenorActual(document.getElementById('inputFecha').value);">
										  
                                                                                                                                                                     <!-- Nombres del Cliente -->
                                                                                                                                                                    <div class="form-group">
										    <label for="inputNombre" class="col-sm-2 control-label">Nombres del Cliente</label>
										    <div class="col-sm-4">
										      <input type="text" class="form-control" name="nombres" id="inputNombre" placeholder="Nombres" required>
										    </div>
										  </div>
                                                                                                                                                                   <!-- Apellidos del Cliente -->
                                                                                                                                                                    <div class="form-group">
										    <label for="inputApellido" class="col-sm-2 control-label">Apellidos del Cliente</label>
										    <div class="col-sm-4">
										      <input type="text" class="form-control" name="apellidos" id="inputApellido" placeholder="Apellidos" required>
										    </div>
										  </div>
                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                   <!-- DNI del Cliente -->
                                                                                                                                                                <div class="form-group">
										    <label for="dni" class="col-sm-2 control-label">DNI del Cliente</label>
										    <div class="col-sm-4">
										      <input type="number" class="form-control" min="10000000" max="99999999" name="dni" id="dniCheck" placeholder="DNI" onkeypress="ValidaSoloNumeros()" required>
										    </div>
										  </div>                                                                                                                                                                   
                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                    <!-- Télefono del Cliente -->                                                                                    
                                                                                                                                                                   <div class="form-group">
										    <label for="telCheck" class="col-sm-2 control-label">Teléfono</label>
										    <div class="col-sm-4">
										      <input type="number" class="form-control" min="1000000" max="999999999" name="telefono" id="telCheck" placeholder="Teléfono" onkeypress="ValidaSoloNumeros()" required>
										    </div>
										  </div>                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                  <!-- Correo del Cliente -->
                                                                                                                                                                  <div class="form-group">
										    <label for="inputEmail" class="col-sm-2 control-label">Correo</label>
										    <div class="col-sm-4">
                                                                                                                                                                     <input type="email" class="form-control" name="email" id="inputEmail" placeholder="Correo" required>
										    </div>
										  </div>
                                                                                                                                                                  
                                                                                                                                                                    <!-- FechaNacimiento del Cliente -->
                                                                                                                                                                <div class="form-group">
                                                                                                                                                                    <label  for="inputFecha" class="col-sm-2 control-label">Fecha de nacimiento</label>
                                                                                                                                                                    <div class="col-sm-4">
                                                                                                                                                                        <div class='input-group date' id='datetimepicker4'>
                                                                                                                                                                            <input id="inputFecha" type="text" value="" class="form-control" placeholder="Fecha de nacimiento" onkeydown="return false" name="fechanacimiento" onload="vaciar()" required/>
                                                                                                                                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                                                                                                                                            </span>
                                                                                                                                                                        </div>
                                                                                                                                                                    </div>
                                                                                                                                                                </div>
                                                                                                                                                                  
                                                                                                                                                                  <!-- Monto de Apertura -->                                                                                    
                                                                                                                                                                   <div class="form-group">
										    <label for="inputMonto" class="col-sm-2 control-label">Monto de Apertura</label>
										    <div class="col-sm-4">
                                                                                        <input required="required" type="number" class="form-control" name="monto" min="30" max="99999" name="telefono" id="inputMonto" placeholder="Monto de apertura">
										    </div>
										  </div>
                                                                                                                                                                  
                                                                                                                                                                  <!-- Codigo Usuario -->
                                                                                                                                                                    <div class="form-group">
										    <label for="inputUsuario" class="col-sm-2 control-label">Usuario</label>
										    <div class="col-sm-4">
                                                                                                                                                                    <input style="background-color: lavender;" type="text" class="form-control" name="usuario" id="inputUsuario" value="<%=codigo%>" readonly >
                                                                                                                                                                    <input type="hidden" name="accion" value="insert" >
										    </div>
										  </div>
                                                                                                                                                                    
                                                                                                                                                                  <!-- Contraseña -->
                                                                                                                                                                <div class="form-group">
										    <label for="inputPassword" class="col-sm-2 control-label">Contraseña</label>
										    <div class="col-sm-4">
                                                                                        <input required="required" type="text" class="form-control" name="clave" id="inputPassword" placeholder="Contraseña">
										    </div>
										  </div>                                                                                                                                                      
                                                                                                                                                                   
                                                                                                                                                                   
        
                                                                                                                                                                  
                                                                                                                                                                 
										  <!-- Boton Registrar -->
                                                                                                                                                                   <div class="form-group">
                                                                                                                                                                        <label for="inputEmail3" class="col-sm-2 control-label">&nbsp</label>
                                                                                                                                                                       <div class="col-sm-10">
                                                                                                                                                                   <button type="submit" class="btn btn-success"><i class="fa fa-user-plus"></i>&nbsp Registrar</button>
                                                                                                                                                                        </div>
                                                                                                                                                                   </div>
                                                                                                                                                                     
                                                                                                                                                                    <div class="row">&nbsp;</div>
                                                                                                                                                                    <div class="row">&nbsp;</div>
                                                                                                                                                                     <div class="row">&nbsp;</div>
                                                                                                                                                                    <div class="row">&nbsp;</div>
                                                                                                                                                                    
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
                
                <script type="text/javascript">
                    
                    
                    
  function ValidaSoloNumeros() {
 if ((event.keyCode < 48) || (event.keyCode > 57)) 
  event.returnValue = false;
}
                    
                </script>
                
                
		 <script src="assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>

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
                
                
                <script type="text/javascript">                      
                    
  function ValidaSoloNumeros() {
 if ((event.keyCode < 48) || (event.keyCode > 57)) 
  event.returnValue = false;
}
                    
                </script>
		<script src="assets/js/flot/jquery.flot.stack.min.js"></script>
		<script src="assets/js/flot/jquery.flot.orderBar.min.js"></script>
		<script src="assets/js/flot/jquery.flot.pie.min.js"></script>

		<!-- JVector Map -->
		<script src="assets/js/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
		<script src="assets/js/jvectormap/jquery-jvectormap-usa.js"></script>

		<!-- Custom Index -->
		<script src="assets/js/custom.js"></script>
		<script src="assets/js/custom-index.js"></script>
                     <script src="assets/js/moment-with-locales.js" type="text/javascript"></script>
                     <script src="assets/js/bootstrap-datetimepicker.js" type="text/javascript"></script>
                                        
                     
                      <script type="text/javascript">
                          
                                  
    $(function () {
							
                $('#datetimepicker4').datetimepicker(
                {
                        format: 'DD/MM/YYYY',					
                        locale: 'es'    
                         

                }).val('');       
                
                              
                    
                
            });       
        </script>
        <script type="text/javascript">
            
            function validarFechaMenorActual(date){
      var x=new Date();
      var fecha = date.split("/"); //lo convierte a string[]
      x.setFullYear(fecha[2],fecha[1]-1,fecha[0]);
      var today = new Date();
      today.setFullYear(1997,12,31);
      if (x >= today)
      {
          alert('Solo se permiten usuarios con el mínimo de 18 años de edad ');
            return false;  
        }
      else
      {
            return true;
        }
       
}
            
        </script>
        
                
        
    </body>
</html>
