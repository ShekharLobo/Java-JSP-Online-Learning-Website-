<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>My Channel Creation</title>
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
<br><br>
<center>
<h3>My Channel</h3>
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
try{
	String id=(String)session.getAttribute("tea_id");
	String fid=(String)session.getAttribute("fid");
	String fname=(String)session.getAttribute("fname");
	String ftype=(String)session.getAttribute("ftype");
	//String channel=fname+lname+id;
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    PreparedStatement stmt = con.prepareStatement("select fpath,fname,ftype,fview,flike,uploadtime from channels where tea_id="+id);
    ResultSet rs = stmt.executeQuery();
    ResultSetMetaData metadata=rs.getMetaData();
    while(rs.next()){
    	String fpath=rs.getString("fpath");
    	//String fname=rs.getString("fname");
    	%>
    	<tr align="center">
    	<td>
<a href="<%=rs.getString("fpath") %>">     	
    	<video width="100" height="100" controls>
  <source src="<%=rs.getString("fpath") %>" type="video/mp4">
  </video></a>
</td>
<td>
<%=rs.getString("fname") %>
</td>
    	<td><%=rs.getString("ftype") %></td>
    	<td><%=rs.getString("flike") %></td>
    	<td><%=rs.getString("fview") %></td>
    	<td><%=rs.getTimestamp("uploadtime") %></td>
    	</tr>
    	
    	    <%
    } //end while
}
catch(Exception e){out.println(e);}
%>
</table>
<%
}
%>
</center>
<br><br><br><br><br><br>

<div id="google_translate_element"></div>

<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>

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
