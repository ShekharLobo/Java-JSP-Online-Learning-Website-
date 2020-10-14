<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Upload File</title>
</head>
<body>
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


<center>
<form action="FileUpload" method ="post" enctype="multipart/form-data" >
<H1>Upload</H1>
<table border="0">
				<tr>
					<td>My Channel: </td>
					<td>
					<b><%=session.getAttribute("tea_channel") %></b>
					<input value="<%=session.getAttribute("tea_id") %> " type="hidden" name="tea_id" size="50"/>
					</td>
				</tr>
				<tr>
					<td>File: </td>
					<td>
  
 <div class="form-group">
    <div class="input-group mb-3">
      <div class="custom-file">
        <input type="file" class="custom-file-input" id="media" name="media">
        <label class="custom-file-label" for="media">Choose file</label>
      </div>
   <input type="submit" value="Upload">
    </div>
  </div>
</table>
</form>
</center>

<div id="google_translate_element"></div>

<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>

</body>
</html>