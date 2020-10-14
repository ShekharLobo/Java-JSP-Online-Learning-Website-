<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
    if(session.getAttribute("uname")==null || session.getAttribute("uname")=="" ){
    	response.sendRedirect("Home.html");
    }
    else{
    	String uname=session.getAttribute("uname").toString();
    }
    
    %>
    <%
response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate"); 
response.setHeader("Progma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Signout</title>
</head>
<body>
<%
if ((session.getAttribute("uname")!=null)||(session.getAttribute("password")!=null)||(session.getAttribute("fn")!=null)){
	session.removeAttribute("uname");
	session.removeAttribute("password");
	session.removeAttribute("fn");
	request.getSession(false);
	session.setAttribute("uname", null);
	session.setAttribute("password", null);
	session.setAttribute("fn", null);
	session.invalidate();
	response.sendRedirect("StudentLogin.html");
}
%>

</body>
</html>