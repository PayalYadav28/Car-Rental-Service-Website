<%@page import="com.example.demo.bean.Booking"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Car Rent</title>
</head>
<body>
<%List<Booking> book=(List)session.getAttribute("book"); 
for(Booking b:book){%>

<h1><%=b.getName() %></h1>
	
<%}
%>
</body>
</html>