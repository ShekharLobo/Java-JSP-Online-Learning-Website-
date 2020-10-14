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
    if(session.getAttribute("tea_channel")==null || session.getAttribute("tea_channel")==""){
    	response.sendRedirect("TeacherLogin.html");
    }
    else{
    	//String id=(String)session.getAttribute("id");
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

<form action="EditProfileT" method="post" enctype="multipart/form-data">
<table border="0">
				
				<tr>
					<td>Portrait Photo: </td>
					<td><img src="<%=session.getAttribute("tea_pic") %>" height=50 width=50><br><input type="file" name=" tea_pic" size="50"/></td>
				</tr>
				<tr>
					<td>First Name: </td>
					<td><input type="text" value="<%=session.getAttribute("tea_fname") %>" name="tea_fname" size="50"/></td>
				</tr>
				<tr>
					<td>Middle Name: </td>
					<td><input type="text" value="<%=session.getAttribute("tea_mname") %>" name="tea_mname" size="50"/></td>
				</tr>
				<tr>
					<td>Last Name: </td>
					<td><input type="text" value="<%=session.getAttribute("tea_lname") %>" name="tea_lname" size="50"/></td>
				</tr>
				<tr>
					<td>Email: </td>
					<td><input type="email" value="<%=session.getAttribute("tea_email") %>" name="tea_email" size="50"/></td>
				</tr>
				<tr>
					<td>Contact: </td>
					<td><input type="text" value="<%=session.getAttribute("tea_con") %>" name="tea_con" size="50"/></td>
				</tr>
				<tr>
					<td>Date of Birth: </td>
					<td><input type="date" value="<%=session.getAttribute("tea_dob") %>" name="tea_dob" size="50"/></td>
				</tr>
				<tr>
					<td>Course: </td>
					<td><input type="text" name="tea_course" value="<%=session.getAttribute("tea_course") %>" size="50"/></td>
				</tr>
				<tr>
					<td>Profession: </td>
					<td><input type="text" value="<%=session.getAttribute("tea_work") %>" name="tea_work" size="50"/></td>
				</tr>
				<tr>
					<td>Office/Company: </td>
					<td><input type="text" value="<%=session.getAttribute("tea_work_off") %>" name="tea_work_off" size="50"/></td>
				</tr>
				<tr>
					<td>Designation: </td>
					<td><input type="text" value="<%=session.getAttribute("tea_work_post") %>" name="tea_work_post" size="50"/></td>
				</tr>
				<tr>
					<td><input type="hidden" value="<%=session.getAttribute("tea_pic") %>" name="tea_path" size="50"/> </td>
					<td><input type="hidden" value="<%=session.getAttribute("tea_id") %>" name="tea_id" size="50"/></td>
					<td><input type="hidden" value="<%=session.getAttribute("tea_password") %>" name="tea_password" size="50"/></td>
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