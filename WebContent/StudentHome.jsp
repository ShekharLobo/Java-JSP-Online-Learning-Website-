<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Student Home Page</title>
</head>
<body>
<%
if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){
	response.sendRedirect("StudentLogin.html");
}
else{
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
<li><a href="MostLiked.jsp">Most Liked</a></li>
<li><a href="Following.jsp">Following</a></li>
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


<%
String email=(String)session.getAttribute("email");
String con=(String)session.getAttribute("con");
%>
<center>
<br><br><br>
<h3>View Profile</h3>
<table class="table table-hover" style="width:50%" border="1">
<tr>
<td>Profile Pic</td>
<td><img src="<%=session.getAttribute("pic") %>"  width=50 height=50></img></td>
</tr>

<tr>
<td>ID</td>
<td><%=session.getAttribute("id") %></td>
</tr>

<tr>
<td>First Name</td>
<td><%=session.getAttribute("fname") %></td>
</tr>

<tr>
<td>Middle Name</td>
<td><%=session.getAttribute("mname") %></td>
</tr>

<tr>
<td>Last Name</td>
<td><%=session.getAttribute("lname") %></td>
</tr>

<tr>
<td>Email_ID</td>
<td><%=email %></td>
</tr>

<tr>
<td>Contact Number</td>
<td><%=con %></td>
</tr>

<tr>
<td>Date of Birth</td>
<td><%=session.getAttribute("dob") %></td>
</tr>

<tr>
<td> Course</td>
<td><%=session.getAttribute("course") %></td>
</tr>

<tr>
<td>Profession</td>
<td><%=session.getAttribute("work") %></td>
</tr>
</table>
</center>
<%
}
%>
<br><br><br><br><br><br>

<div id="google_translate_element"></div>

<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>

<footer class="navbar navbar-expand-lg navbar-dark bg-dark">
<img src="logo2.png" height=60 width=54> From Dumbs To Pros 
&emsp;&emsp;&emsp;
Copyright &copy; 2019 Lobo Technologies. All Rights Reserved.
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
<a href="terms.html">Terms</a>&emsp;
<a href="privacypolicy.html">Privacy Policy and Cookie Policy</a>&emsp;
<a href="intellectualproperty.html">Intellectual Policy</a>
</footer>
</body>
</html>