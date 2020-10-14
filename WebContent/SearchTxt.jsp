
<%@page contentType="text/html" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Search Items</title>
</head>
<body>
<%
if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){
	response.sendRedirect("StudentLogin.html");
}
else{
%>
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
<li><a href="MostLiked.jsp">Most Liked</a></li>
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

<h3>Teachers/Uploaders</h3>
<table border="1" style="width:100%">
<thread>
<tr align="center">
<th>Profile Pic</th>
<th>Name</th>
<th>Rank</th>
<th>Followers</th>
<th>Course</th>
<th>Profession</th>
<th>Channel</th>
</tr>
</thread>

<%
try{
	String searchtxt=request.getParameter("searchtxt");
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    PreparedStatement stmt = con.prepareStatement("select tea_id,tea_pic,tea_fname,tea_mname,tea_lname,tea_course,tea_work,tea_channel from TeacherLogin where tea_fname LIKE '%"+searchtxt+"%' or tea_mname LIKE '%"+searchtxt+"%' or tea_lname LIKE '%"+searchtxt+"%' or tea_course LIKE '%"+searchtxt+"%' or tea_work LIKE '%"+searchtxt+"%'or tea_channel LIKE '%"+searchtxt+"%'");
    ResultSet rs = stmt.executeQuery();
    ResultSetMetaData metadata=rs.getMetaData();
    while(rs.next()){
    	String userdbId=rs.getString("tea_id");
   	   String userdbPic=rs.getString("tea_pic"); 	   
   	   String userdbFname=rs.getString("tea_fname"); 	   
  	   String userdbMname=rs.getString("tea_mname");
  	   String userdbLname=rs.getString("tea_lname");
  	   String userdbCourse=rs.getString("tea_course");
  	   String userdbWork=rs.getString("tea_work");
  	   String userdbChannel=rs.getString("tea_channel");
  	 session.setAttribute("tea_id",userdbId);
	 session.setAttribute("tea_pic",userdbPic);
	 session.setAttribute("tea_fname",userdbFname);
	 session.setAttribute("tea_mname",userdbMname);
	 session.setAttribute("tea_lname",userdbLname);
	 session.setAttribute("tea_course",userdbCourse);
	 session.setAttribute("tea_work",userdbWork);
	 session.setAttribute("tea_channel",userdbChannel);
    	
    	%>
    	<tr align="center">
    	<td><a href="Player.jsp"><img src="<%=rs.getString("tea_pic") %>" height=100 width=100></a></td>
    	<td><%=rs.getString("tea_fname") %> <%=rs.getString("tea_mname") %> <%=rs.getString("tea_lname") %>
	<%
	    PreparedStatement stmt1 = con.prepareStatement("select avg(rate) from rate where tea_id="+rs.getString("tea_id"));
	    ResultSet rs2 = stmt1.executeQuery();
    	if(rs2.next()){
	%>
		<td><%=rs2.getFloat(1) %></td>
		<%} %>
	<%
	    PreparedStatement stmt2 = con.prepareStatement("select count(*) from follower where tea_id="+rs.getString("tea_id")+" and follow=true");
	    ResultSet rs3 = stmt2.executeQuery();
    	if(rs3.next()){
	%>
		<td><%=rs3.getInt(1) %></td>
		<%} %>
		<td><%=rs.getString("tea_course") %></td>
    	<td><%=rs.getString("tea_work") %></td>
    	<td><a href="TeacherProfile.jsp"><%=rs.getString("tea_channel") %></a></td>
    	</tr>
	<input type="hidden" value="<%=rs.getString("tea_id") %>" name="tea_id">
    	<input type="hidden" value=<%=rs.getString("tea_channel") %> name="tea_channel">
    	    
    <%
    }//end while
    %>
    </table>
<br><br><br><br><br><br><br><br>
<h3>Files</h3>
<table border="1" style="width:100%">
<thread>
<tr>
<th>Name</th>
<th>Views</th>
</tr>
</thread>
<%
PreparedStatement ps = con.prepareStatement("select * from channels where fname LIKE '%"+searchtxt+"%' or ftype LIKE '%"+searchtxt+"%'");
ResultSet rs1 = ps.executeQuery();
ResultSetMetaData metadata1=rs1.getMetaData();
    while(rs1.next()){

   	 String filedbId=rs1.getString("fid");
    	   String filedbPath=rs1.getString("fpath"); 	   
    	   String filedbName=rs1.getString("fname"); 	   
    	   String filedbType=rs1.getString("ftype");
    	   String filedbView=rs1.getString("fview");
    	   String filedbLike=rs1.getString("flike");
       	   
   session.setAttribute("fid",filedbId);
   session.setAttribute("fpath",filedbPath);
   session.setAttribute("filename",filedbName);
   session.setAttribute("ftype",filedbType);
   session.setAttribute("fview",filedbView);
   session.setAttribute("flike",filedbLike);
%>
<tr>
    	<td>
    	<form action="http://localhost:8080/project/File/Player.jsp"><input type="hidden" value=<%=rs1.getString("fid") %> name="fid"><button type="submit" class="btn btn-link"><%=rs1.getString("fname") %></button> </form><br>
	    </td>
		<td><%=rs1.getString("fview") %></td>
    	</tr>

<%    	
    }
} //end try
catch(Exception e){
	out.println(e);
	
}// end catch

    %>
</table>
<%} %>

<div id="google_translate_element"></div>

<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>

</body>
</html>