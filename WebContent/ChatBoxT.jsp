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
    <div class="form-group">
      <label for="exampleTextarea">Chats:</label>
      <textarea cols="120" rows="20" readonly="">
<%
try{
	String id=request.getParameter("stu_id");
	String tea_id=request.getParameter("tea_id");
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    PreparedStatement ps1=con.prepareStatement("select * from follower where stu_id="+id+" and tea_id="+tea_id+" and follow=true");
    ResultSet rs1=ps1.executeQuery();
    while(rs1.next()){
    PreparedStatement ps2 = con.prepareStatement("select stu_fname,stu_mname,stu_lname from StudentLogin where stu_id="+id);
    ResultSet rs2 = ps2.executeQuery();
    while(rs2.next()){
    PreparedStatement ps3 = con.prepareStatement("select chat,chattime,stu,tea from chatbox where tea_id="+tea_id+" and stu_id="+id);
    ResultSet rs3 = ps3.executeQuery();
    while(rs3.next()){
		if(rs3.getBoolean("stu")==true){
	    	%>
	    	<%=rs2.getString("stu_fname") %> <%=rs2.getString("stu_mname") %> <%=rs2.getString("stu_lname") %>:	
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
<input type="hidden" value="tea" name="person">
      <textarea class="form-control" id="chat" name="chat" rows="3" cols="120" placeholder="Enter you messages here"></textarea>
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