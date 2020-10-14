<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
    if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){
    	response.sendRedirect("Home.html");
    }
    else{
    	String uname=session.getAttribute("uname").toString();
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>LogOut</title>
</head>
<body>
<h1>Are you sure you wanna Logout....?</h1>
<%
response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate"); 
response.setHeader("Progma","no-cache");
response.setDateHeader("Expires",0);
%>
<a href= "signoutS.jsp"><button type="button" class="btn btn-primary">YES</button></a>&nbsp;
<a href="StudentHomePg.jsp"><button type="button" class="btn btn-secondary">NO</button>
</body>
</html>