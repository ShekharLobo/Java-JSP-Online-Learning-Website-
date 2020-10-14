<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Delete Account</title>
</head>
<body>
<%
if(session.getAttribute("tea_channel")==null || session.getAttribute("tea_channel")==""){
	response.sendRedirect("TeacherLogin.html");
}
else{
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#"><img src="<%=session.getAttribute("tea_pic") %>"  height=50 width=50></img><%=session.getAttribute("tea_fname") %> <%=session.getAttribute("tea_lname") %></a>
  <link rel="alternate stylesheet" href="style.css">
<ul>
<li><a href="TeacherHome.jsp">Home</a></li>
<li><a>Profile</a>
	<ul>
		<li><a href="EditProfileT.jsp">Edit Profile</a></li>
	</ul>
</li>
<li><a>My Channel</a>
<ul>
<li><a href="MyChannel.jsp">View Channel</a></li>
<li><a href="FileUpload.jsp">Upload</a></li>
<li><a href="DeleteFile.jsp">Delete File</a>
</ul>
</li>
<li><a>Account</a>
	<ul>
		<li><a href="Logout.jsp">Logout</a></li>
		<li><a href="Delete.jsp">Delete Account</a></li>
	</ul>
</li>
</ul>
</link>
</nav>
<br><br><br><%=session.getAttribute("tea_id") %>
<form action="DeleteAccT" method="post" enctype="multipart/form-data">
<center>
<h2>Delete Account</h2>
<p>Are you sure you want to delete your account from "FDTP", <%=session.getAttribute("tea_fname") %> ?</p>
<p> <strong>Note:</strong></p>
<p>Account once deleted cannot be <em>regained</em>.
Deleting your account will also remove all your uploaded files and videos from our site.</p>
<p>You will have to register again if you want to join us again.
AND also will have to upload your videos all over again.</p>
<br>
Hit 'YES' if you're Positive.... if not then 'NO' wouldn't do much harm.
<br><br>
<input type="submit"  class="btn btn-outline-warning" value="YES">
</form>
<a href="TeacherHome.jsp"><button type="button" class="btn btn-outline-success">NO</button></a>
</center>


<%} %>

<div id="google_translate_element"></div>

<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>
</body>
</html>