
<%@page import="com.example.demo.controller.CarController"%>
<%@page import="java.util.List"%>
<%@page import="com.example.demo.bean.User"%>
<%@page import="com.example.demo.bean.Mycart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%
    	User user1=(User)session.getAttribute("user");
    	if(user1==null){
    		response.sendRedirect("login");
    	}
    
    %>
 

 
<!doctype html>
<html lang="en">

  <head>
    <title>CarRental &mdash; Free Website Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
     <link rel="stylesheet" href="css/rent.css">
      <link rel="stylesheet" href="css/index.css">
     

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
                  <li><a href="blog" class="nav-link">Blog</a></li>
                  <li><a href="about" class="nav-link">About</a></li>
                
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

      
      <div class="hero inner-page" style="background-image: url('images/hero_1_a.jpg');">
        
        <div class="container">
          <div class="row align-items-end ">
            <div class="col-lg-5">

              <div class="intro">
                <h1><strong>Rent Your Car</strong></h1>
                <div class="custom-breadcrumbs"><a href="index">Home</a> <span class="mx-2">/</span> <strong>Contact</strong></div>
              </div>

            </div>
          </div>
        </div>
      </div>

    

    <div class="site-section bg-light" id="contact-section">
   
   
   <%
   if(user1!=null){
   List<Mycart> cart=(List)session.getAttribute("cart");
   	for(Mycart c:cart){%>
   		
      <div style="background-color: white;height: 64px;width: 100%;"></div>
      <div class="container">
        <div class="row justify-content-center text-center">
        <div class="col-7 text-center mb-5 mt-3">
          
        </div>
      </div>
     
     
    	  
     
      
        <div  style="    margin-top: -14px;" class="row">
          <div style="margin-top: 12px;" class="col-lg-8 mb-5" >
         
        	  

          
           <form  action="new" style="    margin-left: -50px;
    margin-top: 20px;
">				<input type="hidden" name="id" value="<%=c.getId()%>">
                <div>
                  <input type="text" name="name" value="<%=c.getName() %>" style="    font-size: 35px;
    font-weight: bold;
    width: 300px;
    border: none;">
                </div>
                <div>
                 <input type="text" name="price" value="<%=c.getPrice() %>" style="font-size: 35px;
    font-weight: bold;
    width: 300px;
    display: inline-block;
    float: left;
    margin-top: -64px;
    margin-left: 379px;
    border: none;">
                </div>
                <div>
                	<input  style="border: none;
    margin-top: 28px;" type="text" name="description" value="<%=c.getDescription()%>">
                </div>
                <div style="margin-top: 29px">
                  <label style="    font-size: 23px;
    font-weight: 300;
">Pick Up Date</label>
                  <input name="pickup"style="     height: 45px;
    border: none;
    margin-left: 8px;
    padding: 30px;
" type=date step=7 min=2014-09-08> 
                  
                </div>
                <div style="    margin-top: -60px;
    margin-left: 360px;">
                  <label style="font-size: 20px;
    font-weight: 300;
">Drop Off Date</label>
                  <input  name="dropoff"style="    height: 45px;
    border: none;
    margin-left: 13px;
    padding: 30px" type=date step=7 min=2014-09-08 > 
                  
                </div>
                
                <div style="margin-top: 26px;">
                	<input name="from" style="    height: 45px;
    border: none;
    padding: 27px;" type="text" placeholder="From">
                </div>
                 <div style="    margin-top: -54px;
    margin-left: 254px;">
                	<input name="to" style="    height: 45px;
    border: none;
    padding: 27px;
" type="text" placeholder="To">
                </div>
                <input type="hidden" name="nid" value="<%=c.getUid()%>">
                 <div class="form-group row">
                <div style="margin-top: 49px;" class="col-md-6 mr-auto">
                  <input style="    width: 287px;
    border-radius: 10px;"  type="submit" id="login"class="btn btn-block btn-primary text-white py-3 px-5" value="Proceed">
                </div>
              </div>

              
              
            </form>
             <button style=" background-color: red;
    width: 278px;
    text-decoration: none;
    border: none;
    border-radius: 10px;
    height: 58px;
    margin-top: -74px;
    display: inline-block;
    float: left;
    margin-left: 276px;"><a style="color: white;" href="delete?id=<%=c.getId()%>">Cancel</a></button>
            
          </div>
          <div class="col-lg-4 ml-auto">
            <img style="margin-top: 19px;" src="<%=c.getImage()%>">
</div>
        </div>
      </div>
      
       <%}
   	}
   %>
    </div>
 
  <footer class="site-footer">
        <div class="container">
          <div class="row">
            <div class="col-lg-3">
              <h2 class="footer-heading mb-4">About Us</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
              <ul class="list-unstyled social">
                <li><a href="#"><span class="icon-facebook"></span></a></li>
                <li><a href="#"><span class="icon-instagram"></span></a></li>
                <li><a href="#"><span class="icon-twitter"></span></a></li>
                <li><a href="#"><span class="icon-linkedin"></span></a></li>
              </ul>
            </div>
            <div class="col-lg-8 ml-auto">
              <div class="row">
                <div class="col-lg-3">
                  <h2 class="footer-heading mb-4">Quick Links</h2>
                  <ul class="list-unstyled">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Testimonials</a></li>
                    <li><a href="#">Terms of Service</a></li>
                    <li><a href="#">Privacy</a></li>
                    <li><a href="#">Contact Us</a></li>
                  </ul>
                </div>
                <div class="col-lg-3">
                  <h2 class="footer-heading mb-4">Resources</h2>
                  <ul class="list-unstyled">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Testimonials</a></li>
                    <li><a href="#">Terms of Service</a></li>
                    <li><a href="#">Privacy</a></li>
                    <li><a href="#">Contact Us</a></li>
                  </ul>
                </div>
                <div class="col-lg-3">
                  <h2 class="footer-heading mb-4">Support</h2>
                  <ul class="list-unstyled">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Testimonials</a></li>
                    <li><a href="#">Terms of Service</a></li>
                    <li><a href="#">Privacy</a></li>
                    <li><a href="#">Contact Us</a></li>
                  </ul>
                </div>
                <div class="col-lg-3">
                  <h2 class="footer-heading mb-4">Company</h2>
                  <ul class="list-unstyled">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Testimonials</a></li>
                    <li><a href="#">Terms of Service</a></li>
                    <li><a href="#">Privacy</a></li>
                    <li><a href="#">Contact Us</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="row pt-5 mt-5 text-center">
            <div class="col-md-12">
              <div class="border-top pt-5">
                <p>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              </p>
              </div>
            </div>

          </div>
        </div>
      </footer>

    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/jquery.fancybox.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/bootstrap-datepicker.min.js"></script>
    <script src="js/aos.js"></script>

    <script src="js/main.js"></script>

  </body>

</html>

