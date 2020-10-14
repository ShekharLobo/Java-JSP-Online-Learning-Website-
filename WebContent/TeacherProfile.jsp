<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Teacher Profile</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#"><%=session.getAttribute("fname") %> <%=session.getAttribute("lname") %></a>
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
<li><a href="LogoutS.jsp">Logout</a></li>
</ul>
</link>

    <form class="form-inline my-2 my-lg-0" action="SearchTxt.jsp" >
      <input class="form-control mr-sm-2" type="text" placeholder="Search" name="searchtxt">
	  <input type="submit" value="Search" >
    </form>
  </div>
</nav>

<%
if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){
	response.sendRedirect("StudentLogin.html");
}
else{
	String tea_id=(String)session.getAttribute("tea_id");
	String channel=(String)session.getAttribute("tea_channel");
	
	%>
	<center>
	<h3><%=channel %></h3>
<table border="1" style="width:75%">
<thread>
<tr>
<th>File</th>
<th>Name</th>
<th>Type</th>
</tr>
</thread>
	<%
	try{
		Class.forName("com.mysql.jdbc.Driver");       //jdbc connection
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");	//mysql username and password
	    PreparedStatement stmt = con.prepareStatement("select * from channels where tea_id="+tea_id);	//check details
	    ResultSet rs = stmt.executeQuery();
	    ResultSetMetaData metadata=rs.getMetaData();
	    while(rs.next()){

	    	%>
	    	<tr>
	    	<td><video width="100" height="100" controls> <source src="<%=rs.getString("fpath") %>" type="video/mp4" ></video></td>
	    	<td><form action="http://localhost:8080/project/File/Player.jsp"><input type="hidden" value=<%=rs.getString("fid") %> name="fid"><button type="submit" class="btn btn-link"><%=rs.getString("fname") %></button> </form></td>
	    	<td><%=rs.getString("ftype") %></td>
	    	</tr>
	    	
	  <%
	    } //end while
	}
	catch(Exception e){
		out.println(e);
		
	}// end catch
}
%>
</center>
</table>
</body>
</html>