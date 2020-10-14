<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Teacher Home Page</title>
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

<%
String email=(String)session.getAttribute("tea_email");
String contact=(String)session.getAttribute("tea_con");
String pword=(String)session.getAttribute("tea_password");
%>
<center>

<table style="width:50%" border="1">
<tr>
<td>Profile Pic</td>
<td><img src="<%=session.getAttribute("tea_pic") %>"  width="100" height="100"></img></td>
</tr>

<tr>
<td>First Name</td>
<td><%=session.getAttribute("tea_fname") %></td>
</tr>

<tr>
<td>Middle Name</td>
<td><%=session.getAttribute("tea_mname") %></td>
</tr>

<tr>
<td>Last Name</td>
<td><%=session.getAttribute("tea_lname") %></td>
</tr>

<tr>
<td>Email_ID</td>
<td><%=email %></td>
</tr>

<tr>
<td>Contact Number</td>
<td><%=contact %></td>
</tr>

<tr>
<td>Date of Birth</td>
<td><%=session.getAttribute("tea_dob") %></td>
</tr>

<tr>
<td>Profession</td>
<td><%=session.getAttribute("tea_work") %></td>
</tr>

<tr>
<td>Office/Company</td>
<td><%=session.getAttribute("tea_work_off") %></td>
</tr>

<tr>
<td>Designation</td>
<td><%=session.getAttribute("tea_work_post") %></td>
</tr>

<tr>
<td>Channel</td>
<td><%=session.getAttribute("tea_channel") %></td>
</tr>

<tr>
<td>Ranked</td>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    PreparedStatement ps = con.prepareStatement("select avg(rate) from rate where tea_id="+session.getAttribute("tea_id"));
    ResultSet rs = ps.executeQuery();
    while(rs.next()){
%>
<td><%=rs.getFloat(1) %></td>
<%}
%> 
</tr>
<tr>
<td>Followers</td>
<%
    PreparedStatement ps1 = con.prepareStatement("select count(*) from follower where tea_id="+session.getAttribute("tea_id")+" and follow=true");
    ResultSet rs1 = ps1.executeQuery();
    while(rs1.next()){
%>
<td><%=rs1.getInt(1) %></td>
</tr>
<%
    }
}catch(Exception e){
	out.println(e);
	}%>


</table>


</center>
<%
 }
%>
<br><br><br><br><br><br>
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
