<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Favorite</title>
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
try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    PreparedStatement ps = con.prepareStatement("select * from channels order by flike desc limit 10 ");
    ResultSet rs = ps.executeQuery();
%>
    <br><br><br><br><br>
    <center>
    <h3>Most Liked</h3>
<table border="1" style="width:80%">
<thread>
<tr align="center">
<th>Video</th>
<th>Name</th>
<th>Likes</th>
<th>Uploaded on</th>
</tr>
</thread>
    <%
    while(rs.next()){
%>
	    	<tr align="center">
	    	<td><video width="100" height="100" controls> <source src="<%=rs.getString("fpath") %>" type="video/mp4" ></video></td>
	    	<td><form action="http://localhost:8080/project/File/Player.jsp"><input type="hidden" value=<%=rs.getString("fid") %> name="fid"><button type="submit" class="btn btn-link"><%=rs.getString("fname") %></button> </form></td>
	    	<td><%=rs.getString("flike") %></td>
	    	<td><%=rs.getTimestamp("uploadtime") %></td>
	    	</tr>

<%    	
    }
} //end try
catch(Exception e){
	out.println(e);
	
}// end catch

    %>
</table>
</center>
<%} %>
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