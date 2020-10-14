<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Edit Profile Information</title>
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

<form action="EditProfile" method="post" enctype="multipart/form-data">
<table border="0">
				
				<tr>
					<td>Portrait Photo: </td>
					<td><img src="<%=session.getAttribute("pic") %>" height=50 width=50><br><input type="file" name=" stu_pic" size="50"/></td>
				</tr>
				<tr>
					<td>First Name: </td>
					<td><input type="text" value="<%=session.getAttribute("fname") %>" name="stu_fname" size="50"/></td>
				</tr>
				<tr>
					<td>Middle Name: </td>
					<td><input type="text" value="<%=session.getAttribute("mname") %>" name="stu_mname" size="50"/></td>
				</tr>
				<tr>
					<td>Last Name: </td>
					<td><input type="text" value="<%=session.getAttribute("lname") %>" name="stu_lname" size="50"/></td>
				</tr>
				<tr>
					<td>Email: </td>
					<td><input type="email" value="<%=session.getAttribute("email") %>" name="stu_email" size="50"/></td>
				</tr>
				<tr>
					<td>Contact: </td>
					<td><input type="text" value="<%=session.getAttribute("con") %>" name="stu_con" size="50"/></td>
				</tr>
				<tr>
					<td>Date of Birth: </td>
					<td><input type="date" value="<%=session.getAttribute("dob") %>" name="stu_dob" size="50"/></td>
				</tr>
				<tr>
					<td>Course: </td>
					<td><input type="text" name="stu_course" value="<%=session.getAttribute("course") %>" size="50"/></td>
				</tr>
				<tr>
					<td>Work: </td>
					<td><input type="text" value="<%=session.getAttribute("work") %>" name="stu_work" size="50"/></td>
				</tr>
				<tr>
					<td><input type="hidden" value="<%=session.getAttribute("pic") %>" name="stu_pic" size="50"/> </td>
					<td><input type="hidden" value="<%=session.getAttribute("id") %>" name="stu_id" size="50"/></td>
					<td><input type="hidden" value="<%=session.getAttribute("password") %>" name="stu_password" size="50"/></td>
				</tr>
				<tr>
				<td colspan="2">
				<b>Change Password?</b>
				</td>
				</tr>
				<tr>
				<td>Enter Old Password</td>
				<td><input type="password" name="pword" size=50/></td>
				</tr>
				<tr>
				<td>Enter New Password</td>
				<td><input type="password" name="npword" size=50/></td>
				</tr>
				<tr>
				<td>Confirm New Password</td>
				<td><input type="password" name="cnpword" size=50/></td>
				</tr>
	
				<tr>
					<td><input type="reset" class="btn btn-primary" ></td>
					<td><input type="submit" class="btn btn-primary" value="Submit"></td>
					</tr>
						</table>
		
</form>
<%} %>

<div id="google_translate_element"></div>

<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>

</body>
</html>