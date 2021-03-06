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
					Dashboard
				</div>
				<ul class="stats hidden-xs">
					<li>
						<div class="stats-block hidden-sm hidden-xs">
							<span id="downloads_graph"></span>
						</div>
						<div class="stats-details">
							<h4>$<span id="today_income">580</span> <i class="fa fa-chevron-up up"></i></h4>
							<h5>Today's Income</h5>
						</div>
					</li>
					<li>
						<div class="stats-block hidden-sm hidden-xs">
							<span id="users_online_graph"></span>
						</div>
						<div class="stats-details">
							<h4>$<span id="today_expenses">235</span> <i class="fa fa-chevron-down down"></i></h4>
							<h5>Today's Expenses</h5>
						</div>
					</li>
				</ul>
			</div>
			<!-- Top Bar ends -->

			<!-- Main Container starts -->
			<div class="main-container">

				<!-- Container fluid Starts -->
				<div class="container-fluid">

					<!-- Current Stats Start -->
					<div class="current-stats">
						<div class="row">
							<div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
								<div class="danger-bg center-align-text">
									<div class="spacer-xs">
										<i class="fa fa-github fa-2x"></i>
										<small class="text-white">Github</small>
										<h3 class="no-margin no-padding">9%</h3>
									</div>
								</div>
							</div>
							<div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
								<div class="success-bg center-align-text">
									<div class="spacer-xs">
										<i class="fa fa-foursquare fa-2x"></i>
										<small class="text-white">Foursquare</small>
										<h3 class="no-margin no-padding text-white">45%</h3>
									</div>
								</div>
							</div>
							<div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
								<div class="info-bg center-align-text">
									<div class="spacer-xs">
										<i class="fa fa-facebook fa-2x"></i>
										<small class="text-white">Facebook</small>
										<h3 class="no-margin no-padding">37%</h3>
									</div>
								</div>
							</div>
							<div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
								<div class="brown-bg center-align-text">
									<div class="spacer-xs">
										<i class="fa fa-google-plus fa-2x"></i>
										<small class="text-white">Google Plus</small>
										<h3 class="no-margin no-padding">25%</h3>
									</div>
								</div>
							</div>
							<div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
								<div class="linkedin-bg center-align-text">
									<div class="spacer-xs">
										<i class="fa fa-linkedin fa-2x"></i>
										<small class="text-white">LinkedIn</small>
										<h3 class="no-margin no-padding">19%</h3>
									</div>
								</div>
							</div>
							<div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
								<div class="twitter-bg center-align-text">
									<div class="spacer-xs">
										<i class="fa fa-twitter fa-2x"></i>
										<small class="text-white">Twitter</small>
										<h3 class="no-margin no-padding text-white">12%</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Current Stats End -->

					<!-- Spacer starts -->
					<div class="spacer">
						<!-- Row Start -->
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<!-- Widget starts -->
								<div class="blog">
									<div class="blog-header">
										<h5 class="blog-title">Social Network Analysis</h5>
									</div>
									<div class="blog-body">
										<div class="row">
											<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
												<div id="us-map" class="chart-height-lg"></div>
											</div>
											<div class="visitors-total">
												<h3>88,305</h3>
												<p>Last week total visits</p>
											</div>
											<div class="visit-stats">
												<ul class="clearfix">
													<li>
														<div class="donut animated rubberBand">
															<div id="donut-chart-1" style="width:48px; height: 48px;"></div>
															<span>65%</span>
														</div>
														<h2 class="text-danger">7235</h2>
														<p>Visits</p>
													</li>
													<li>
														<div class="donut animated rubberBand">
															<div id="donut-chart-2" style="width:48px; height: 48px;"></div>
															<span>17%</span>
														</div>
														<h2 class="text-info">3269</h2>
														<p>Male</p>														
													</li>
													<li>
														<div class="donut animated rubberBand">
															<div id="donut-chart-3" style="width:48px; height: 48px;"></div>
															<span>32%</span>
														</div>
														<h2 class="text-success">5972</h2>
														<p>Female</p>														
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<!-- Widget ends -->
							</div>
						</div>
						<!-- Row End -->

						<!-- Row Start -->
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<!-- Widget starts -->
								<div class="blog">
									<div class="blog-header">
										<h5 class="blog-title">Appointments</h5>
									</div>
									<div class="blog-body">
										<!-- Row starts -->
										<div class="row">
											<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
												<div class="bg-primary-light">
													<h3 class="text-danger  no-margin">Today</h3>
													<ul class="appointments">
														<li><i class="fa fa-circle text-danger"></i>Meet Mr. Peter @ 10:30 AM</li>
														<li><i class="fa fa-circle text-warning"></i>Skype call @ 12:00 PM</li>
														<li><i class="fa fa-circle text-success"></i>Send greetings to Sandy</li>
														<li><i class="fa fa-circle text-info"></i>Pickup kids @ 4:00 PM</li>
														<li><i class="fa fa-circle text-fb"></i>Dinner with Maria @ 8:00 PM</li>
													</ul>
												</div>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
												<div id="datepicker"></div>
											</div>
										</div>
										<!-- Row ends -->
									</div>
								</div>
								<!-- Widget ends -->
							</div>
						</div>
						<!-- Row End -->

						<!-- Row Start -->
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<!-- Widget starts -->
								<div class="blog blog-info">
									<div class="blog-header">
										<h5 class="blog-title">Chats</h5>
									</div>
									<div class="blog-body">
										<ul class="chats">
											<li class="in">
												<img class="avatar" alt="" src="assets/img/user2.jpg">
												<div class="message">
													<span class="arrow"></span>
													<a href="#" class="name" data-original-title="" title="">Sandy</a>
													<span class="date-time">
														at May 21st, 2014 12:0<i class="fa fa-clock-o"></i>
													</span>
													<div class="progress-stats clearfix">
														<i class="fa fa-camera-retro pull-left fa-lg text-info"></i>
														<div class="progress">
															<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
															</div>
														</div>
													</div>
													<span class="body body-grey">
														Raw denim heard of them master cleanse.
													</span>
												</div>
											</li>
											<li class="out">
												<img class="avatar" alt="" src="assets/img/user3.jpg">
												<div class="message">
													<span class="arrow"></span>
													<a href="#" class="name" data-original-title="" title="">Peter</a>
													<span class="date-time">
														at May 14th, 2014 09:32<i class="fa fa-clock-o"></i>
													</span>
													<span class="body body-blue">
														Next level veard stumptown, thundercats <i class="fa fa-smile-o fa-lg text-primary"></i>
													</span>
												</div>
											</li>
											<li class="in">
												<img class="avatar" alt="" src="assets/img/user4_.jpg">
												<div class="message">
													<span class="arrow"></span>
													<a href="#" class="name" data-original-title="" title="">Johnson</a>
													<span class="date-time">
														at Apr 28th, 2014 09:47<i class="fa fa-clock-o"></i>
													</span>
													<span class="body body-grey">
														Beard stumptown scenester farm-to-table.
													</span>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<!-- Widget ends -->
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<!-- Widget starts -->
								<div class="blog blog-danger">
									<div class="blog-header">
										<h5 class="blog-title">Clients List</h5>
									</div>
									<div class="blog-body">
										<ul class="clients-list">
											<li class="client clearfix">
												<img src="assets/img/user4_.jpg" class="avatar" alt="Client">
												<div class="client-details">
													<p>
														<span class="name">Peter</span>
														<span class="email">mail.smith@mail.ro</span>
													</p>
													<ul class="icons-nav">
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Delete">
																<i class="fa fa-trash-o"></i>
															</a>
														</li>
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Email">
																<i class="fa fa-envelope-o"></i>
															</a>
														</li>
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Contact">
																<i class="fa fa-phone"></i>
															</a>
														</li>
													</ul>
												</div>
											</li>
											<li class="client clearfix">
												<img src="assets/img/user1.jpg" class="avatar" alt="Client">
												<div class="client-details">
													<p>
														<span class="name">Willims</span>
														<span class="email">id.will@mail.io</span>
													</p>
													<ul class="icons-nav">
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Delete">
																<i class="fa fa-trash-o"></i>
															</a>
														</li>
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Email">
																<i class="fa fa-envelope-o"></i>
															</a>
														</li>
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Contact">
																<i class="fa fa-phone"></i>
															</a>
														</li>
													</ul>
												</div>
											</li>
											<li class="client clearfix">
												<img src="assets/img/user2.jpg" class="avatar" alt="Client">
												<div class="client-details">
													<p>
														<span class="name">Henreque</span>
														<span class="email">henrq@mail.ro</span>
													</p>
													<ul class="icons-nav">
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Delete">
																<i class="fa fa-trash-o"></i>
															</a>
														</li>
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Email">
																<i class="fa fa-envelope-o"></i>
															</a>
														</li>
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Contact">
																<i class="fa fa-phone"></i>
															</a>
														</li>
													</ul>
												</div>
											</li>
											<li class="client clearfix">
												<img src="assets/img/user3.jpg" class="avatar" alt="Client">
												<div class="client-details">
													<p>
														<span class="name">Samson</span>
														<span class="email">sams@mail.com</span>
													</p>
													<ul class="icons-nav">
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Delete">
																<i class="fa fa-trash-o"></i>
															</a>
														</li>
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Email">
																<i class="fa fa-envelope-o"></i>
															</a>
														</li>
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Contact">
																<i class="fa fa-phone"></i>
															</a>
														</li>
													</ul>
												</div>
											</li>
											<li class="client clearfix">
												<img src="assets/img/user4_.jpg" class="avatar" alt="Client">
												<div class="client-details">
													<p>
														<span class="name">Valli</span>
														<span class="email">mail.val@mail.us</span>
													</p>
													<ul class="icons-nav">
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Delete">
																<i class="fa fa-trash-o"></i>
															</a>
														</li>
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Email">
																<i class="fa fa-envelope-o"></i>
															</a>
														</li>
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Contact">
																<i class="fa fa-phone"></i>
															</a>
														</li>
													</ul>
												</div>
											</li>
											<li class="client clearfix">
												<img src="assets/img/user5.jpg" class="avatar" alt="Client">
												<div class="client-details">
													<p>
														<span class="name">Jene</span>
														<span class="email">jason@mail.com</span>
													</p>
													<ul class="icons-nav">
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Delete">
																<i class="fa fa-trash-o"></i>
															</a>
														</li>
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Email">
																<i class="fa fa-envelope-o"></i>
															</a>
														</li>
														<li>
															<a href="#" data-toggle="tooltip" data-placement="left" title="Contact">
																<i class="fa fa-phone"></i>
															</a>
														</li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<!-- Widget ends -->
							</div>
						</div>
						<!-- Row End -->

						<!-- Row Starts -->
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="blog blog-success no-margin">
									<div class="blog-header">
										<h5 class="blog-title">Sales Stats</h5>
									</div>
									<div class="blog-body">
										<div class="table-responsive">
											<table class="table table-condensed table-bordered no-margin">
												<tbody>
													<tr>
														<td>
															<span class="chart" id="spark_1"></span>
														</td>
														<td>
															Wilson
														</td>
														<td>
															19275, Walnut Creek, CA
														</td>
														<td>
															4531
														</td>
														<td>
															<span class="badge badge-info">
																Processing
															</span>
														</td>
														<td rowspan="5" class="center-align-text">
															<div class="chart" id="spark_6"></div>
														</td>
													</tr>
													<tr>
														<td>
															<span class="chart" id="spark_2"></span>
														</td>
														<td>
															Jason
														</td>
														<td>
															18932, Wilsan Gardan Broadway, SU
														</td>
														<td>
															9852
														</td>
														<td>
															<span class="badge badge-success">
																Sent
															</span>
														</td>
													</tr>
													<tr>
														<td>
															<span class="chart" id="spark_3"></span>
														</td>
														<td>
															Robson
														</td>
														<td>
															11217, Church Street, SN
														</td>
														<td>
															1744
														</td>
														<td>
															<span class="badge badge-danger">
																Cancelled
															</span>
														</td>
													</tr>
													<tr>
														<td>
															<span class="chart" id="spark_4"></span>
														</td>
														<td>
															Karan
														</td>
														<td>
															3229, North Broadway, GN
														</td>
														<td>
															4321
														</td>
														<td>
															<span class="badge badge-info">
																Processing
															</span>
														</td>
													</tr>
													<tr>
														<td>
															<span class="chart" id="spark_5"></span>
														</td>
														<td>
															Lasan
														</td>
														<td>
															2318, New Lason Road, BS
														</td>
														<td>
															245
														</td>
														<td>
															<span class="badge badge-success">
																Sent
															</span>
														</td>
													</tr>
												</tbody>
											</table>
										</div>  
									</div>
								</div>
							</div>
						</div>
						<!-- Row Ends -->

					</div>
					<!-- Spacer ends -->

				</div>
				<!-- Container fluid ends -->
                                
                                                   
                                                
			</div>
			<!-- Main Container ends -->

                                                <%@include file="right-sidebar.jsp" %>
                                                   
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
