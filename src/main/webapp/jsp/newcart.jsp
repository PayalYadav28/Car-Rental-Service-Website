<%@page import="com.example.demo.bean.User"%>
<%@page import="com.example.demo.bean.Mycart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    	User user1=(User)session.getAttribute("user");
    	if(user1==null){
    		response.sendRedirect("login");
    	}
    
    %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/cart.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<link href="css/newcart.css" rel="stylesheet">
</head>
<body>
    <div class="card">
        <div class="row" id="sec1">
            <div class="col-md-8 cart">
                <div class="title">
                    <div class="row">
                        <div class="col"><h4><b>Shopping Cart</b></h4></div>
                        <div class="col align-self-center text-right text-muted">3 items</div>
                    </div>
                </div>    
                <div  style="height: 303px;" class="row border-top border-bottom">
                    <div id="sec2" class="row main align-items-center">
                        <div class="col-2"><img id="carimg" src="images/car_6.jpg"></div>
                        
                        <div class="col">
                            <div  id="name"class="row text-muted">Shirt</div>
                            
                        </div>
                        
                        <div id="price" class="col">&euro; 44.00 <span class="close">&#10005;</span></div>
                        <button style="    display: inline-block;
    margin-right: 41px;
    margin-left: 8px;
    margin-top: 21px;
    background-color: black;
    color: white;
    width: 231px;
    height: 38px;">Rent Now</button>
                    </div>
                </div>
                <div class="row">
                    <div class="row main align-items-center">
                        <div class="col-2"><img class="img-fluid" src="https://i.imgur.com/ba3tvGm.jpg"></div>
                        <div class="col">
                            <div class="row text-muted">Shirt</div>
                            <div class="row">Cotton T-shirt</div>
                        </div>
                        <div class="col">
                            <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
                        </div>
                        <div class="col">&euro; 44.00 <span class="close">&#10005;</span></div>
                    </div>
                </div>
                <div class="row border-top border-bottom">
                    <div class="row main align-items-center">
                        <div class="col-2"><img class="img-fluid" src="https://i.imgur.com/pHQ3xT3.jpg"></div>
                        <div class="col">
                            <div class="row text-muted">Shirt</div>
                            <div class="row">Cotton T-shirt</div>
                        </div>
                        <div class="col">
                            <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
                        </div>
                        <div class="col">&euro; 44.00 <span class="close">&#10005;</span></div>
                    </div>
                </div>
                <div class="back-to-shop"><a href="#">&leftarrow;</a><span class="text-muted">Back to shop</span></div>
            </div>
             <%List<Mycart> cart1=(List)session.getAttribute("cart");
          int count=0;int sum=0;
          for(Mycart my:cart1){
        	  if(my.getUid()==user1.getId()){
        		  sum=sum+Integer.parseInt(my.getPrice());
        		  count++;
        	  }
          }
        	 
          %>
          
            <div class="col-md-4 summary">
                <div><h5><b>Summary</b></h5></div>
                <hr>
                <div class="row">
                    <div class="col" style="padding-left:0;">ITEMS 3</div>
                    <div class="col text-right">&euro; 132.00</div>
                </div>
                <form>
                    <p>SHIPPING</p>
                    <select><option class="text-muted">Standard-Delivery- &euro;5.00</option></select>
                    <p>GIVE CODE</p>
                    <input id="code" placeholder="Enter your code">
                </form>
                <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                    <div class="col">TOTAL PRICE</div>
                    <div class="col text-right">&euro; 137.00</div>
                </div>
                <button class="btn">CHECKOUT</button>
            </div>
        </div>
        
    </div>
</body>
</html>