<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
    if(session.getAttribute("tea_channel")==null || session.getAttribute("tea_channel")=="" ){
    	response.sendRedirect("TeacherLogin.html");
    }
    else{
    	String uname=session.getAttribute("tea_channel").toString();
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
if (session.getAttribute("tea_channel")!=null){
	session.removeAttribute("tea_channel");
	request.getSession(false);
	session.setAttribute("tea_channel", null);
	session.invalidate();
	response.sendRedirect("TeacherLogin.html");
}
%>

</body>
</html>