<!-- Left sidebar starts -->

                                <% 
                                        String nombre=session.getAttribute("nombre").toString();
                                        String rol=session.getAttribute("rol").toString();
                                        
                                        String accion="principal";
                                        String recibir=(String)request.getAttribute("accion");
                                        
                                        if(recibir!=null)
                                            accion=recibir;
                                    %>
                                    
		<aside id="sidebar">

			<!-- Current User Starts - DATOS DEL USUARIO LOGUEADO-->
			<div class="current-user">
				<div class="user-avatar animated rubberBand">
					<img src="assets/img/user4.jpg" alt="Current User">
					<span class="busy"></span>
				</div>
				<div class="user-name">Hola Sr. <%= nombre %> :)</div>
				<ul class="user-links">
					<li>
						<a href="profile.html">
							<i class="fa fa-user text-success"></i>
						</a>
					</li>					
					<li>
						<a href="ServletUsuario?accion=salir">
							<i class="fa fa-sign-out text-danger"></i>
						</a>
					</li>
				</ul>
			</div>
			<!-- Current User Ends -->

			<!-- Menu start SIDEBAR-->
			<div id='menu'>
				<ul>
                                   
					<li     <% if(accion.equals("principal")){ %> class="highlight"  <%}%> >
                                           
						<a href="ServletUsuario?accion=principal">
							<i class="fa fa-dashboard"></i>
							<span>Dashboard</span>
                                                                                                                
                                                                                                                <% if(accion.equals("principal")){ %>
							<span class="current-page"></span>
                                                                                                                <%}%>
						</a>
					</li>
                                        
                                                                      <%if(rol.equals("CLI")){ %>
					<li     <% if(accion.equals("estado")){ %> class="highlight"  <%}%> >
						<a href="ServletUsuario?accion=estado">
							<i class="fa fa-university"></i> 
							<span>Estado de Cuenta</span>
                                                                                                                <% if(accion.equals("estado")){ %>
							<span class="current-page"></span>
                                                                                                                <%}%>
						</a>
					</li>
					<li     <% if(accion.equals("ingresar")){ %> class="highlight"  <%}%> >
						<a href="ServletUsuario?accion=ingresar">
							<i class="fa fa-plus-square"></i> 
							<span>Ingresar Monto</span>
                                                        
                                                                                                                <% if(accion.equals("ingresar")){ %>
							<span class="current-page"></span>
                                                                                                                <%}%>
						</a>
					</li>
					<li     <% if(accion.equals("retirar")){ %> class="highlight"  <%}%> >
						<a href="ServletUsuario?accion=retirar">
							<i class="fa fa-minus-square"></i>  
							<span>Retirar Monto</span>
                                                                                                                <% if(accion.equals("retirar")){ %>
							<span class="current-page"></span>
                                                                                                                <%}%>
						</a>
					</li>
                                                                                
                                                                      <%}else{ %>
                                                                
					<li     <% if(accion.equals("adminu")){ %> class="highlight"  <%}%> >
						<a href="ServletUsuario?accion=adminu">
							<i class="fa fa-users"></i> 
							<span>Admin. Usuarios</span>
                                                                                                                <% if(accion.equals("adminu")){ %>
							<span class="current-page"></span>
                                                                                                                <%}%>
						</a>
					</li>
					<li     <% if(accion.equals("adminc")){ %> class="highlight"  <%}%> >
						<a href="ServletUsuario?accion=adminc">
							<i class="fa fa-credit-card"></i> 
							<span>Admin. Cuentas</span>
                                                                                                                <% if(accion.equals("adminc")){ %>
							<span class="current-page"></span>
                                                                                                                <%}%>
						</a>
					</li>
                                                                            <% } %>
                                                                                    
                                                                                    <li <% if(accion.equals("nosotros")){ %> class="highlight"  <%}%> >         
                                                                                                                <a href="ServletUsuario?accion=nosotros">
							<i class="fa fa-info-circle"></i> 
							<span>Acerca de Nosotros</span></a>
                                                                                                               <% if(accion.equals("nosotros")){ %>
							<span class="current-page"></span>
                                                                                                                <%}%>
                                                                                    </li>
                                                                            
                                                                                   <li>         
                                                                                                                <a href="ServletUsuario?accion=salir">
							<i class="fa fa-sign-out"></i> 
							<span>Cerrar sesión</span></a>
                                                                                    </li>
                                        
					
				</ul>
			</div>
			<!-- Menu End -->

			

		</aside>
		<!-- Left sidebar ends -->