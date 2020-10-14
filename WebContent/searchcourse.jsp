
<%@page contentType="text/html" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Search Courses</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <img src="logo2.png" height=60 width=54> <h5>From Dumbs To Pros</h5> 
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
&emsp;
<link rel="alternate stylesheet" href="style.css">
<ul>
<li><a>More</a>
	<ul>
		<li><a href="Home.html">Home</a></li>
		<li><a href="feature.html">Features</a></li>
		<li><a href="aboutus.html">About</a></li>
	</ul>
</li>
<li><a>Who are you?</a>
	<ul>
		<li><a href="Student.html">Student</a></li>
		<li><a href="Teacher.html">Teacher</a></li>
	</ul>
</li>
</ul>
&emsp;&emsp;
</link>
    <form class="form-inline my-2 my-lg-0" action="searchcourse.jsp">
      <input class="form-control mr-sm-2" type="text" name="searchtxt" placeholder="Search for courses">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <h5>Student login:</h5> &emsp;
<a href="StudentLogin.html"><button type="button" class="btn btn-outline-info">Log In</button></a>&nbsp;
<a href="StudentRegPg.html"><button type="button" class="btn btn-info">Sign Up</button></a>    
</nav>

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Course</th>
      <th scope="col">By</th>
    </tr>
  </thead>

<%
try{
	String searchtxt=request.getParameter("searchtxt");
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    PreparedStatement stmt = con.prepareStatement("select tea_course, tea_fname,tea_mname,tea_lname from TeacherLogin where tea_course LIKE '%"+searchtxt+"%'");
    ResultSet rs = stmt.executeQuery();
    ResultSetMetaData metadata=rs.getMetaData();
    while(rs.next()){
    	%>
    	<tr>
    	<td><%=rs.getString("tea_course") %></td>
    	<td><%=rs.getString("tea_fname") %> <%=rs.getString("tea_mname") %> <%=rs.getString("tea_lname") %>
		</td></tr>
    <%
    }//end while
   
} //end try
catch(Exception e){
	out.println(e);
	
}// end catch

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