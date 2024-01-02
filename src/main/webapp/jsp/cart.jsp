<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
<%@page import="com.example.demo.bean.User"%>
<%@page import="com.example.demo.bean.Mycart"%>
<%
    	User user1=(User)session.getAttribute("user");
    	if(user1==null){
    		
    		response.sendRedirect("login");
    		session.setAttribute("error","Please Login!");
    	}
    
    %>

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
    <link rel="stylesheet" href="css/newcart.css">
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
       <div  class="hero inner-page" style="background-image: url('images/hero_1_a.jpg');width: 1557px;    height: 108vh !important;"></div>
         <%List<Mycart> cart1=(List)session.getAttribute("cart");
          int count=0;int sum=0;
          for(Mycart my:cart1){
        	  if(my.getUid()==u.getId()){
        		  sum=sum+Integer.parseInt(my.getPrice());
        		  count++;
        	  }
          }
        	 
          %>
    <div class="newsec1" id="carscard" class="card">
        <div class="newsec2" class="row" id="sec1" style="width: 1800px">
            <div class="col-md-8 cart">
                <div class="title">
                    <div class="row">
                        <div class="col"><h4><b>CAR FOR RENT</b></h4></div>
                        <div class="col"><h4><b>TOTAL PRICE Rs.<%=sum %></b></h4></div>
                        <div class="col"><h4><b>ITEMS <%=count %></b></h4></div>
                        
                    </div>
                </div> 
                  <%
   if(user1!=null){
   List<Mycart> cart=(List)session.getAttribute("cart");
   	for(Mycart c:cart){%>   
               <div style="height: 303px;" class="row border-top border-bottom">
                    <div id="sec2" class="row main align-items-center">
                        <div class="col-2"><img style="width: 230px;height: 212px;margin-left: 32px;margin-top: 18px;" id="carimg" src="<%=c.getImage()%>"></div>
                        <div class="col">
                            <div  id="name"class="row text-muted"><%=c.getName() %></div>
                            
                        </div>
                        
                        <div style="margin-left: 69px;" id="price" class="col">Rs. <%=c.getPrice() %></span></div>
                        <button style="    display: inline-block;
    margin-right: 41px;
    margin-left: 8px;
    margin-top: 21px;
    background-color: black;
    color: white;
    width: 231px;
    height: 38px;" id="rentbtn"><a style="color: white;" href="reservation?id=<%=c.getId()%>&name=<%=c.getName()%>&price=<%=c.getPrice()%>&image=<%=c.getImage()%>&rid=<%=c.getUid()%>">Rent Now</a></button><span style="margin-top: -181px;margin-right: -6px;" class="close"><a href="delete?id=<%=c.getId()%>">&#10005;</a>
                    </div>
                </div>
                  <%}
   	}
   %>
                
                <div class="back-to-shop"><a href="#">&leftarrow;</a><span class="text-muted">Back to Cars-List</span></div>
            </div>
          
         
          
          
                    	
                    	
                  
               
            </div>
        </div>
        
    </div>
      
   
</body>
</html>