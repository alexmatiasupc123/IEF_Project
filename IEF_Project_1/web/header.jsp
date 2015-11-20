

<header>
    
     <%@include file="validarSesion.jsp" %>
			<!-- Logo starts -->
			<div class="logo">
				<a href="main.jsp">
					<img src="assets/img/logo_wat3.png" alt="logo">
					<span class="menu-toggle hidden-xs">
						<i class="fa fa-bars"></i>
					</span>
				</a>
			</div>
			<!-- Logo ends -->

			                       
                        

			<!-- Mini right nav starts -->
			<div class="pull-right">
				<ul id="mini-nav" class="clearfix">
					
					<li class="list-box user-profile hidden-xs">
						<a class="user-avtar animated rubberBand">
                                                    <img src="<%= (String)session.getAttribute("imagen_url") %>" alt="user avatar">
						</a>
					</li>
				</ul>
			</div>
			<!-- Mini right nav ends -->
		</header>
		<!-- Header ends -->