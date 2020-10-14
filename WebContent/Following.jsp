<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Student Home Page</title>

<style>
.mySlides {display:none;}
</style>
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

	<center>
	<h3>Following</h3>
<table border="1" style="width:75%">
<thread>
<tr align="center">
<th>Profile Pic</th>
<th>Name</th>
<th>Rank</th>
<th>Followers</th>
<th>Course</th>
<th>Profession</th>
<th>Channel</th>
<th>Chat</th>
</tr>
</thread>
	<%
	try{
		String id=(String)session.getAttribute("id");
		Class.forName("com.mysql.jdbc.Driver");       //jdbc connection
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");	//mysql username and password
	    PreparedStatement stmt = con.prepareStatement("select tea_id from follower where stu_id="+id+" and follow=true");	//check details
	    ResultSet rs = stmt.executeQuery();
	    while(rs.next()){
			String tea_id=rs.getString("tea_id");
	    	PreparedStatement stmt1 = con.prepareStatement("select tea_pic,tea_fname,tea_mname,tea_lname,tea_course,tea_work,tea_channel from TeacherLogin where tea_id="+rs.getString("tea_id"));	//check details
		    ResultSet rs1 = stmt1.executeQuery();
		    while(rs1.next()){
	    	%>
<tr align="center">
<td><img src="<%=rs1.getString("tea_pic") %>" height=100 width=100></td>		
<td><%=rs1.getString("tea_fname") %> <%=rs1.getString("tea_mname") %> <%=rs1.getString("tea_lname") %></td>
<%
   	PreparedStatement stmt2 = con.prepareStatement("select avg(rate) from rate where tea_id="+rs.getString("tea_id"));	//check details
    ResultSet rs2 = stmt2.executeQuery();
    while(rs2.next()){
%>
<td><%=rs2.getFloat(1) %></td>
<%} %>
<%
    	PreparedStatement stmt3 = con.prepareStatement("select count(*) from follower where tea_id="+rs.getString("tea_id")+" and follow=true");	//check details
	    ResultSet rs3 = stmt3.executeQuery();
	    while(rs3.next()){
%>
<td><%=rs3.getInt(1) %></td>
<%} %>

<td><%=rs1.getString("tea_course") %></td>
<td><%=rs1.getString("tea_work") %></td>
<td><%=rs1.getString("tea_channel") %></td>
<td>
<form action="ChatBoxS.jsp">
<input type="hidden" value=<%=id %> name="id">
<input type="hidden" value=<%=rs.getString("tea_id") %> name="tea_id">
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