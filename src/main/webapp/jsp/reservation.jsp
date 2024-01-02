<%@page import="com.example.demo.bean.Reservation"%>
<%@page import="java.util.List"%>
<%@page import="com.example.demo.bean.Mycart"%>
<%@page import="com.example.demo.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700;900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="css/aos.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="css/style.css">
      
      <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/reservation.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body>

    <div class="site-wrap" id="home-section">

      <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>



      <header class="site-navbar site-navbar-target" role="banner">

        <div class="container">
          <div class="row align-items-center position-relative">

            <div class="col-3">
              <div class="site-logo">
                <a href="index"><strong>CarRental</strong></a>
              </div>
            </div>

            <div class="col-9  text-right">
              
              <span class="d-inline-block d-lg-none"><a href="#" class=" site-menu-toggle js-menu-toggle py-5 "><span class="icon-menu h3 text-black"></span></a></span>

              <nav class="site-navigation text-right ml-auto d-none d-lg-block" role="navigation">
                <ul class="site-menu main-menu js-clone-nav ml-auto ">
                  <li><a href="index" class="nav-link">Home</a></li>
                  <li><a href="listing" class="nav-link">Listing</a></li>
                  <li><a href="testimonials" class="nav-link">Testimonials</a></li>
                 
                  <li><a href="about" class="nav-link">About</a></li>
                 <li><a href="cart" class="nav-link">My Cart</a></li>
                
     		     <%User u=(User)session.getAttribute("user");
                 if(u!=null){%>
                	 <li><a href="#" id="loginbtn"><%=u.getFname()%></a></li>
                	  <li><a href="login" id="loginbtn">Logout</a></li>
                	 
                 <%}else{%>
                	 <li><a href="login" id="loginbtn">Login</a></li>
                 <%}
                 %>
  		     	
                 
                  
                </ul>
              </nav>
            </div>

            
          </div>
        </div>

      </header>
       <div  class="hero inner-page" style="background-image: url('images/hero_1_a.jpg');width: 1557px;    height: 108vh !important;"></div>
        
    <div class="card">
        <div class="row" id="sec1">
            <div style="border-radius: 11px;" class="col-md-8 cart">
               <h1 style="    margin-left: 227px;">Rent My Car</h1>
               
               
               <form action="reserve">
              
               	<input id="in1" name="id" type="hidden" value="<%=session.getAttribute("id")%>"> 
               
            	<input id="in1" name="name" type="hidden" value="<%=session.getAttribute("name")%>"> 
            	
                <input id="in1"  name="price" type="hidden" value="<%=session.getAttribute("price")%>"> 
               <input id="in1" name="image" type="hidden" value="<%=session.getAttribute("image")%>">
              
               	<label id="pickl" >Pick-Up Location</label>
               	<input id="in1"name="pick_up_location" type="text"> 
               	<label id="drop1">Drop-Off Location</label>
               	<input id="in1"name="drop_off_location" type="text"> 
               	<label id="pick2" >Pick-Up date</label>
               	<input id="in1"  name="pick_up_date" type="date">
               	<label id="drop2">Drop-Off date</label>
               	<input id="in1"  name="drop_off_date"type="date">
               	<label id="pick3">Pick-Up Time</label>
               	<input id="ti"  name="picktime"type="time">
               	
               	<button style="margin-top: 27px;margin-left: 234px;background-color: lightblue;width: 223px;height: 44px;" id="myButton"type="submit" >Checkout</button>
              
               </form>
               
             </div>
		</div>
		<div style="height: 400px;width: 500px;margin-left: 702px;margin-top: -499px;" class="getcar">
               	<img style="height: 400px;width: 399px;border: 18px solid white;" id="getcarimg" src="<%=session.getAttribute("image")%>">
               </div>
	</div>
	

               
            </div>
                
       
    
</body>
</html>