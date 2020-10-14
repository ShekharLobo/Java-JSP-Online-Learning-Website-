<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>View Channel</title>
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
<br><br>
<%
try{
	String fid=request.getParameter("fid");
	int stu_id=Integer.parseInt(request.getParameter("stu_id"));
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    PreparedStatement ps1=con.prepareStatement("select tea_id from channels where fid="+fid);
    ResultSet rs1=ps1.executeQuery();
    while(rs1.next()){
    int tea_id=rs1.getInt("tea_id");
    PreparedStatement ps2 = con.prepareStatement("select tea_fname,tea_mname,tea_lname,tea_pic,tea_course,tea_work,tea_work_off,tea_work_post from TeacherLogin where tea_id="+tea_id);
    ResultSet rs2 = ps2.executeQuery();
    ResultSetMetaData metadata=rs2.getMetaData();
    while(rs2.next()){
    PreparedStatement ps3 = con.prepareStatement("select AVG(rate) from rate where tea_id="+tea_id);
    ResultSet rs3 = ps3.executeQuery();
    while(rs3.next()){
    %>	
<center>
    <div class="card text-white bg-info mb-3" style="max-width: 20rem;">
  <div class="card-body">
    <h4 class="card-title"><%=rs2.getString("tea_fname") %> <%=rs2.getString("tea_mname") %> <%=rs2.getString("tea_lname") %></h4>
 	<img style="height: 200px; width: 100; display: block;" src="<%=rs2.getString("tea_pic") %>" alt="Card image">
     <p class="card-text">
	 Course: <strong><%=rs2.getString("tea_course") %></strong><br>
     Current Profession: <strong><%=rs2.getString("tea_work") %></strong><br>
     Designation: <strong><%=rs2.getString("tea_work_post") %></strong><br>
     Work Address: <strong><%=rs2.getString("tea_work_off") %></strong>   <br>       
     </p>
	 Rank:<br>
    <strong><%=rs3.getFloat(1) %></strong>
  </div>
</div>
<%} %>
     Rate:<br>
	<form action="rate" method="post">
	0 <input type="range" name="rate" min="0" max="10"> 10
	<input type="hidden" value=<%=stu_id %> name="stu_id">
	<input type="hidden" value=<%=tea_id %> name="tea_id">
	<input type="hidden" value=<%=fid %> name="fid"><br>
	<button type="submit" class="btn btn-success">Rate</button>			
	</form>
<br>
Follow:<br>
	<form action="follow" method="post">
	<input type="hidden" value=<%=stu_id %> name="stu_id">
	<input type="hidden" value=<%=tea_id %> name="tea_id">
	<input type="hidden" value=<%=fid %> name="fid"><br>
	<input type="radio" value="1" name="follow">Follow &emsp;
	<input type="radio" value="0" name="follow">Unfollow<br>
	<button type="submit" class="btn btn-success">Submit</button>			
	</form>
<br>

<table border="1" style="width:80%">
<thread>
<tr align="center">
<th>File</th>
<th>Name</th>
<th>Type</th>
<th>Likes</th>
<th>Views</th>
<th>Uploaded on</th>
</tr>
</thread>

    
    <%
    }
    PreparedStatement stmt = con.prepareStatement("select fid,fpath,fname,ftype,fview,flike,uploadtime from channels where tea_id="+tea_id);
    ResultSet rs = stmt.executeQuery();
    while(rs.next()){
    	%>
    	<tr align="center">
    	<td>
    	<a href="Player.jsp?fid=<%=rs.getString("fid")%>">
    	<video width="100" height="100" controls>
  <source src="<%=rs.getString("fpath") %>" type="video/mp4">
  </video></a>
</td>
<td><%=rs.getString("fname") %></td>
    	<td><%=rs.getString("ftype") %></td>
    	<td><%=rs.getString("flike") %></td>
    	<td><%=rs.getString("fview") %></td>
    	<td><%=rs.getTimestamp("uploadtime") %></td>
    	</tr>
    	
    	    <%
    } //end while
}
}
catch(Exception e){out.println(e);}
%>
</table>
<%
}
%>
</center>
<br><br><br><br><br><br>

</body>
<footer class="navbar navbar-expand-lg navbar-dark bg-dark">
<img src="logo2.png" height=60 width=54> From Dumbs To Pros 
&emsp;&emsp;&emsp;
Copyright &copy; 2019 Lobo Technologies. All Rights Reserved.
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
<a href="terms.html">Terms</a>&emsp;
<a href="privacypolicy.html">Privacy Policy and Cookie Policy</a>&emsp;
<a href="intellectualproperty.html">Intellectual Policy</a>
</footer>
</html>
