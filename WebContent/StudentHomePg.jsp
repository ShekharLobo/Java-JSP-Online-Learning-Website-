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
    <br><br>
    
<div>
  <img class="mySlides" src="C:\Users\acer\eclipse-workspace\project\Images\images.jpg" height=400 width=600>
  <img class="mySlides" src="C:\Users\acer\eclipse-workspace\project\Images\images(1).jpg" height=400 width=700>
  <img class="mySlides" src="C:\Users\acer\eclipse-workspace\project\Images\images(2).jpg" height=400 width=700>
  <img class="mySlides" src="C:\Users\acer\eclipse-workspace\project\Images\images(3).jpg" height=400 width=700>
  <img class="mySlides" src="C:\Users\acer\eclipse-workspace\project\Images\images(4).jpg" height=400 width=700>
  <img class="mySlides" src="C:\Users\acer\eclipse-workspace\project\Images\images(5).jpg" height=400 width=700>
  <img class="mySlides" src="C:\Users\acer\eclipse-workspace\project\Images\images(6).jpg" height=400 width=700>  
</div>

<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 3000); // Change image every 2 seconds
}
</script>

<%
try{
	String stucourse=(String)session.getAttribute("course");
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    PreparedStatement ps = con.prepareStatement("select * from channels");
    ResultSet rs1 = ps.executeQuery();

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
    

 } //end try
}catch(Exception e){
	out.println(e);
	
}// end catch

    %>
</table>
</center>
<%
}
%>
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