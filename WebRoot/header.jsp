<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="entity.User" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Header</title>
		<!-- JqueryUI -->
		<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
		<!-- Bootstrap -->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<!-- Awesome font icons -->
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" media="screen">
		<!-- Owlcoursel -->
		<link rel="stylesheet" type="text/css" href="css/owl-coursel/owl.carousel.css">
		<link rel="stylesheet" type="text/css" href="css/owl-coursel/owl.transitions.css">
		<!-- Magnific-popup -->
		<link rel="stylesheet" type="text/css" href="css/magnific-popup/magnific-popup.css">
		<!-- Magnific-popup -->
		<link rel="stylesheet" type="text/css" href="css/magnific-popup/magnific-popup.css">
		<!-- Style -->
		<link rel="stylesheet" type="text/css" href="css/style.css" media="screen">
		<!-- Fw -->
		<link rel="stylesheet" type="text/css" href="css/fw.css" media="screen">
  </head>
  
  <body>

		<div class="preloader">
			<i class="fa fa-spinner"></i>
		</div>
		<header>
			<div class="container">
				<div class="row top-header">
					<div class="col-sm-3 text-left">
						<a href="#" class="logo">
							<img src="images/logo.png" alt="logo">
						</a>
					</div>
					<div class="col-sm-9">
						<ul class="top-link pull-right">
							
							<li class="dropdown hidden-xs">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" id="dropdownMenu1" aria-haspopup="true" aria-expanded="false">
								<% 
								//User u=(User)session.getAttribute("user");
								if(session.getAttribute("user")!=null){
			                     	%>
								${sessionScope.user.uname}<span class="caret"></span></a>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
									<li><a href="exitUser">Log out</a></li>
								</ul>
							</li>
								<% 
								}else{
								
								%> My Account<span class="caret"></span></a>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
									<li><a href="login.jsp">Login</a></li>
									<li><a href="register.jsp">Register</a></li>
									<li><a href="exitUser">Log out</a></li>
								</ul>
							</li>
							<% 
								}
							%>
							<li class="pull-right">
								<div class="cart dropdown">
									<a href="#" class="cart-item dropdown-toggle" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						               <i class="fa fa-cart-plus"></i>
									</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
								
								<li>
								<% 
								//User u=(User)session.getAttribute("user");
								if(session.getAttribute("user")!=null){
			                     	%>
									<p>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="servlet/CartServlet?action=show" class="btn ht-btn bg-6">Check Cart</a>
									</p>
									<% 
								}else{
								
								%>
								<p>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="login.jsp" class="btn ht-btn bg-6">Check Cart</a>
									</p>
								<% 
								}
							%>
								</li>
							</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="bg-mn color-inher">
					<div class="row m-0">
						<div class="col-sm-1 col-md-1 col-lg-2 p-0">
							<div class="dropdown category-bar">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
									<i class="fa fa-bars"></i><span>Others</span>
						</a>
						<ul class="dropdown-menu display-block hidden-xs">
							<li><a href="Product?category=fruit wine"><span><img src="images/guoj.jpg" width="50" alt="image"></span>Fruit Wine</a></li>
							<li><a href="Product?category=fruit jam"><span><img src="images/gj.jpg" width="50" alt="image"></span>Fruit Jam</a></li>
						</ul>
							</div>
						</div>
						<div class="col-sm-8 col-md-8 col-lg-7 p-0">
							<div class="main-menu">
								<nav class="navbar navbar-default menu">
									<div class="navbar-header">
										<button type="button" class="navbar-toggle collapsed m-r-xs-15" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
											<span class="sr-only">Toggle navigation</span>
											<span class="icon-bar"></span>
											<span class="icon-bar"></span>
											<span class="icon-bar"></span>
										</button>
									</div>
									<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
										<ul class="nav navbar-nav"> 
											<li><a href="index.jsp">Home</a></li>
									        <li><a href="Product?category=vegetables">Vegetables</a></li>
							                <li><a href="Product?category=fruit">Fruit</a></li>
							                <li><a href="Product?category=nut">Nut</a></li>
									        <li><a href="about.jsp">About</a></li>
										</ul>
									</div>
								</nav>
							</div>
						</div>
  
 <div class="col-sm-3 col-md-3 col-lg-3 p-0">
							<div class="search-box m-l-xs-15 m-r-xs-15">
								<input type="text" class="form-item" placeholder="Search...">
								<button type="submit" class="fa fa-search"></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header> 
  </body>
</html>
