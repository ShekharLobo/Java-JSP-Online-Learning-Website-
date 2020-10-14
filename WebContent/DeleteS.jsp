<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Delete Account</title>
</head>
<body>
<% 
    if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){
    	response.sendRedirect("StudentLogin.html");
    }
    else{
    	String id=(String)session.getAttribute("id");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#"><img src="<%=session.getAttribute("pic") %>" height=50 width=50></img> <%=session.getAttribute("fname") %> <%=session.getAttribute("lname") %></a>
<link rel="alternate stylesheet" href="style.css">
<ul>
<li><a href="StudentHomePg.jsp">Home</a></li>
<li><a>Profile</a>
	<ul>
		<li><a href="StudentHome.jsp"> View Profile</a></li>
		<li><a href="EditProfile.jsp">Edit Profile</a></li>
	</ul>
</li>
<li><a>Populars</a>
<ul>
<li><a href="MostViewed.jsp">Trending</a></li>
<li><a href="MostViewed.jsp">Most Liked</a></li>
</ul>
</li>
<li><a>Account</a>
	<ul>
		<li><a href="LogoutS.jsp">Logout</a></li>
		<li><a href="DeleteS.jsp">Delete Account</a></li>
	</ul>
</li>
</ul>
</link>

    <form class="form-inline my-2 my-lg-0" action="SearchTxt.jsp" >
      <input class="form-control mr-sm-2" type="text" placeholder="Search" name="searchtxt">
	  <input type="submit" value="Search" >
    </form>
  </div>
</nav>
<%=session.getAttribute("id") %>

<br><br><br>
<form action="DeleteAcc" method="post" enctype="multipart/form-data">
<center>
<h2>Delete Account</h2>
<p>Are you sure you want to delete your account from "FDTP", <%=session.getAttribute("fname") %> ?</p>
<p> <strong>Note:</strong></p>
<p>Account once deleted cannot be <em>regained</em>.</p>
<p>You will have to register again if you want to join us again.</p>
<br>
Hit 'YES' if you're Positive.... if not then 'NO' wouldn't do much harm.
<br><br>
<input type="submit"  class="btn btn-outline-warning" value="YES">
</form>
<a href="StudentHomePg.jsp"><button type="button" class="btn btn-outline-success">NO</button></a>
</center>
<%} %>

<div id="google_translate_element"></div>

<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>

</body></html>