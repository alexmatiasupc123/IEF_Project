<%-- 
    Document   : index
    Created on : 17/09/2015, 01:52:42 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
         <link rel="icon" type="text/x-icon" href="assets/img/person.ico"/>       
        
        
         
        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" media="screen">

        <!-- Animate CSS -->
        <link href="assets/css/animate.css" rel="stylesheet" media="screen">

        <!-- Main CSS -->
        <link href="assets/css/main.css" rel="stylesheet" media="screen">

        <!-- Main CSS -->
        <link href="assets/css/login.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="assets/fonts/font-awesome.min.css" rel="stylesheet">
        
        <%
            
            String mensaje=(String)request.getAttribute("mensaje");
                        
            %>
                      
        <title>IEF Project :D</title>
    </head>
    <body>
        
        <!--
        <div class="container">
            <div class="text-center">  <h1>Hola amiguitos JPA :D</h1> </div>
            
        <a href="servletPersona"> Listar Personas </a>
        </div>
        -->
        
        
        <!-- Container Fluid starts -->
		<div class="container-fluid">
			<div class="row">
                            
                            <div class="row">&nbsp;</div>
                             <div class="row">&nbsp;</div>
                              <div class="row">&nbsp;</div>
                               <div class="row">&nbsp;</div>
                                 <div class="row">&nbsp;</div>
                                
				<div class="col-md-push-4 col-md-4 col-sm-push-3 col-sm-6 col-sx-12">
					
					<!-- Header end -->
					<div class="login-container">                                                                                                                                                                           
						<div class="login-wrapper animated flipInY">
                                                                                                
                                                                                                <% if(mensaje!=null){ %>
                                                                                                 <div class="alert alert-danger">Datos incorrectos</div>
                                                                                                <%}%>                         
                                                    
                                                    
							<div id="login" class="show">
								<div class="login-header">
									<h4>Ingresa a tu Cuenta</h4>
								</div>
								<form action="ServletUsuario" method="post">
									<div class="form-group has-feedback">
										<label class="control-label" for="txtUsuario" >Usuario</label>
										<input name="txtUsuario" type="text" class="form-control" id="txtUsuario" placeholder="Usuario" autofocus>
										<i class="fa fa-user text-info form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="control-label" for="txtClave">Contraseña</label>
										<input name="txtClave" type="password" class="form-control" id="txtClave" placeholder="Contraseña" >
										<i class="fa fa-key text-danger form-control-feedback"></i>
									</div>
									<input type="submit" value="Entrar" class="btn btn-danger btn-lg btn-block">
								</form>
								<a href="#forgot-pwd" class="underline text-info">Se te olvidó tu contraseña?</a>								
							</div>								

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Container Fluid ends -->
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.min.js"></script>

		<script type="text/javascript">
			(function($) {
				// constants
				var SHOW_CLASS = 'show',
					HIDE_CLASS = 'hide',
					ACTIVE_CLASS = 'active';
				
				$('a').on('click', function(e){
					e.preventDefault();
					var a = $(this),
					href = a.attr('href');
				
					$('.active').removeClass(ACTIVE_CLASS);
					a.addClass(ACTIVE_CLASS);

					$('.show')
					.removeClass(SHOW_CLASS)
					.addClass(HIDE_CLASS)
					.hide();
					
					$(href)
					.removeClass(HIDE_CLASS)
					.addClass(SHOW_CLASS)
					.hide()
					.fadeIn(550);
				});
			})(jQuery);
		</script>
        
        
    </body>
    
    
</html>
