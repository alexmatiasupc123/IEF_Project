<!-- Left sidebar starts -->

                                <% 
                                        String nombre=session.getAttribute("nombre").toString();
                                    %>
                                    
		<aside id="sidebar">

			<!-- Current User Starts -->
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
						<a href="invoice.html">
							<i class="fa fa-file-pdf-o text-warning"></i>
						</a>
					</li>
					<li>
						<a href="components.html">
							<i class="fa fa-sliders text-info"></i>
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

			<!-- Menu start -->
			<div id='menu'>
				<ul>
					<li class="highlight">
						<a href='index-2.html'>
							<i class="fa fa-desktop"></i>
							<span>Dashboard</span>
							<span class="current-page"></span>
						</a>
					</li>
					<li>
						<a href='timeline.html'>
							<i class="fa fa-sliders"></i> 
							<span>Timeline</span>
						</a>
					</li>
					<li>
						<a href='blog.html'>
							<i class="fa fa-pencil"></i> 
							<span>Blog</span>
						</a>
					</li>
					<li>
						<a href='graphs.html'>
							<i class="fa fa-flask"></i> 
							<span>Graphs</span>
						</a>
					</li>
					<li>
						<a href='calendar.html'>
							<i class="fa fa-calendar"></i> 
							<span>Calendar</span>
						</a>
					</li>
					<li>
						<a href='gallery.html'>
							<i class="fa fa-image"></i> 
							<span>Gallery</span>
						</a>
					</li>
					<li>
						<a href='maps.html'>
							<i class="fa fa-globe"></i> 
							<span>Vector Maps</span>
						</a>
					</li>
					<li class='has-sub'>
						<a href='#'>
							<i class="fa fa-flask"></i> 
							<span>Bonus Pages</span>
						</a>
						<ul>
							<li>
								<a href='invoice.html'>
									<span>Invoice</span>
								</a>
							</li>
							<li>
								<a href='profile.html'>
									<span>Profile</span>
								</a>
							</li>
							<li>
								<a href="pricing.html">
									<span>Pricing</span>
								</a>
							</li>
							<li>
								<a href='login.html'>
									<span>Login</span>
								</a>
							</li>
							<li>
								<a href='error.html'>
									<span>404</span>
								</a>
							</li>
							<li>
								<a href='basic-template.html'>
									<span>Basic Template</span>
								</a>
							</li>
						</ul>
					</li>
					<li class='has-sub'>
						<a href='#'>
							<i class="fa fa-tasks"></i>
							<span>UI Elements</span>
						</a>
						<ul>
							<li>
								<a href='buttons.html'>
									<span>Buttons</span>
								</a>
							</li>
							<li>
								<a href='panels.html'>
									<span>Panels</span>
								</a>
							</li>
							<li>
								<a href='icons.html'>
									<span>Icons</span>
								</a>
							</li>
							<li>
								<a href='grid.html'>
									<span>Grid</span>
								</a>
							</li>
							<li>
								<a href='components.html'>
									<span>Components</span>
								</a>
							</li>
							<li>
								<a href='notifications.html'>
									<span>Notifications</span>
								</a>
							</li>
						</ul>
					</li>
					<li class='has-sub'>
						<a href='#'>
							<i class="fa fa-columns"></i>
							<span>Forms</span>
						</a>
						<ul>
							<li>
								<a href='form-elements.html'>
									<span>Form Elements</span>
								</a>
							</li>
							<li>
								<a href='form-layouts.html'>
									<span>Form Layouts</span>
								</a>
							</li>
							<li>
								<a href='editor.html'>
									<span>Editor</span>
								</a>
							</li>
						</ul>
					</li>
					<li class='has-sub'>
						<a href='#'>
							<i class="fa fa-bars"></i> 
							<span>Tables</span>
						</a>
						<ul>
							<li>
								<a href='tables.html'>
									<span>Normal Tables</span>
								</a>
							</li>
							<li>
								<a href='datatables.html'>
									<span>Data Tables</span>
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- Menu End -->

			<!-- Freebies Starts -->
			<div class="freebies">
				
				<!-- Sidebar Extras -->      
				<div class="sidebar-addons">
					<ul class="views">
						<li>
							<i class="fa fa-circle-o text-success"></i>
							<div class="details">
								<p>Signups</p>
							</div>
							<span class="label label-success">8</span>
						</li>
						<li>
							<i class="fa fa-circle-o text-info"></i>
							<div class="details">
								<p>Users Online</p>
							</div>
							<span class="label label-info">7</span>
						</li> 
						<li>
							<i class="fa fa-circle-o text-danger"></i>
							<div class="details">
								<p>Images Uploaded</p>
							</div>
							<span class="label label-danger">4</span>
						</li>         
					</ul>
				</div>

			</div>
			<!-- Freebies Starts -->

		</aside>
		<!-- Left sidebar ends -->