<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Delete File</title>
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
<form action="DeleteFile" method="post">
<br><br><br>
<center>
<h3>Delete Files</h3>
<p>Select the ones you want to remove or delete from your channel
<table border="1" style="width:50%">
<thread>
<tr align="center">
<th>File</th>
<th>Name</th>
<th>Select</th>
</tr>
</thread>

<%
try{
	String id=(String)session.getAttribute("tea_id");
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    PreparedStatement stmt = con.prepareStatement("select * from channels where tea_id="+id);
    ResultSet rs = stmt.executeQuery();
    ResultSetMetaData metadata=rs.getMetaData();
    while(rs.next()){
%>
    	<tr align="center">
    	<td>   	
    	<video width="100" height="100" controls>
  <source src="<%=rs.getString("fpath") %>" type="video/mp4">
  </video>
</td>
		<td><%=rs.getString("fname") %></td>
    	<td><input type="checkbox" name="file" value=<%=rs.getString("fid") %> > </td>
    	<input type="hidden" name="path" value=<%=rs.getString("fpath") %> >
    	</tr>
    	    <%
    } //end while
%>
<%
}
catch(Exception e){out.println(e);}
%>
    	<input type="reset" class="btn btn-secondary">&nbsp; &nbsp; &nbsp;
    	<input type="submit" class="btn btn-success" value="DELETE SELECTED">
<BR><BR>
<%
}
%>

<div id="google_translate_element"></div>

<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>

</center>
</form>
</body>
</html>