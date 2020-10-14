<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>My Followers</title>
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
<li><a href="Followers.jsp">My Followers</a></li>
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
<br><br><br>
	<center>
	<h3>Following</h3>
<table border="1" style="width:75%">
<thread>
<tr align="center">
<th>Profile Pic</th>
<th>Name</th>
<th>Chat</th>
</tr>
</thread>

	<%
	try{
		String tea_id=(String)session.getAttribute("tea_id");
		Class.forName("com.mysql.jdbc.Driver");       //jdbc connection
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");	//mysql username and password
	    PreparedStatement stmt = con.prepareStatement("select stu_id from follower where tea_id="+tea_id+" and follow=true");	//check details
	    ResultSet rs = stmt.executeQuery();
	    while(rs.next()){
			String stu_id=rs.getString("stu_id");
	    	PreparedStatement stmt1 = con.prepareStatement("select stu_pic,stu_fname,stu_mname,stu_lname from StudentLogin where stu_id="+rs.getString("stu_id"));	//check details
		    ResultSet rs1 = stmt1.executeQuery();
		    while(rs1.next()){
	    	%>
<tr align="center">
<td><img src="<%=rs1.getString("stu_pic") %>" height=100 width=100></td>		
<td><%=rs1.getString("stu_fname") %> <%=rs1.getString("stu_mname") %> <%=rs1.getString("stu_lname") %></td>
<td>
<form action="ChatBoxT.jsp">
<input type="hidden" value=<%=stu_id %> name="stu_id">
<input type="hidden" value=<%=tea_id %> name="tea_id">
<button type="submit" class="btn btn-link">Chat</button>
</form>
</td>
</tr>
<%
}	//rs1 end
	    }	//rs end
}	//end try
catch(Exception e){out.println(e);}
    }	//end else
%>
</table>

<div id="google_translate_element"></div>

<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>


</body>
</html>