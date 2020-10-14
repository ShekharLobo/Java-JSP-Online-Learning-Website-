<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>My Chat Box</title>
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
    <div class="form-group">
      <label for="exampleTextarea">Chats:</label>
      <textarea rows="20" cols="120" readonly="">
<%
try{
	String id=request.getParameter("id");
	String tea_id=request.getParameter("tea_id");
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    PreparedStatement ps1=con.prepareStatement("select * from follower where stu_id="+id+" and tea_id="+tea_id+" and follow=true");
    ResultSet rs1=ps1.executeQuery();
    while(rs1.next()){
    PreparedStatement ps2 = con.prepareStatement("select tea_fname,tea_mname,tea_lname from TeacherLogin where tea_id="+tea_id);
    ResultSet rs2 = ps2.executeQuery();
    while(rs2.next()){
    PreparedStatement ps3 = con.prepareStatement("select chat,chattime,stu,tea from chatbox where tea_id="+tea_id+" and stu_id="+id);
    ResultSet rs3 = ps3.executeQuery();
    while(rs3.next()){
		if(rs3.getBoolean("tea")==true){
    	%>
    	<%=rs2.getString("tea_fname") %> <%=rs2.getString("tea_mname") %> <%=rs2.getString("tea_lname") %>:	
    	<%=rs3.getString("chat") %>
    	<%=rs3.getTimestamp("chattime") %>
    	<%
    	}	//end if of tea
		else{
    	%>
    	You:
    	&emsp;<%=rs3.getString("chat") %>
    	&emsp;<%=rs3.getTimestamp("chattime") %>
    	<%
    	}	//end else
    }	// end rs3
    }	//end rs2
    	}// end rs1
%>
      </textarea>
    </div>
    <form action="chatbox" method=post>
    <div class="form-group">
<input type="hidden" value=<%=tea_id %> name="tea_id"> 
<input type="hidden" value=<%=id %> name="id"> 
<input type="hidden" value="stu" name="person">
      <textarea class="form-control" id="chat" name="chat" rows="3" cols="120" placeholder="Enter your messages here"></textarea>
    </div>
        <button type="submit" class="btn btn-primary btn-sm">Send</button>
    </form>
    
<%
}	//end try
catch(Exception e){out.println(e);}
}	//end else
    	%>

</body>
</html>