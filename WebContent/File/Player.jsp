<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="javax.servlet.http.Cookie"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://localhost:8080/project/bootstrap.css">
<meta charset="ISO-8859-1">
<title>Player</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#"><%=session.getAttribute("fname") %> <%=session.getAttribute("lname") %></a>
<link rel="alternate stylesheet" href="http://localhost:8080/project/style.css">
<ul>
<li><a href="http://localhost:8080/project/StudentHomePg.jsp">Home</a></li>
<li><a>Profile</a>
	<ul>
		<li><a href="http://localhost:8080/project/StudentHome.jsp"> View Profile</a></li>
		<li><a href="http://localhost:8080/project/EditProfile.jsp">Edit Profile</a></li>
	</ul>
</li>
<li><a>Populars</a>
<ul>
<li><a href="http://localhost:8080/project/MostViewed.jsp">Trending</a></li>
<li><a href="http://localhost:8080/project/MostLiked.jsp">Most Liked</a></li>
</ul>
</li>
<li><a href="http://localhost:8080/project/LogoutS.jsp">Logout</a></li>
</ul>
</link>

    <form class="form-inline my-2 my-lg-0" action="http://localhost:8080/project/SearchTxt.jsp" >
      <input class="form-control mr-sm-2" type="text" placeholder="Search" name="searchtxt">
	  <input type="submit" value="Search" >
    </form>
  </div>
</nav>
<%
if(session.getAttribute("uname")==null || session.getAttribute("uname")=="" ){
	response.sendRedirect("http://localhost:8080/project/Home.html");
}
else{
	String id=(String)session.getAttribute("id");
//	String teaid=(String)session.getAttribute("tea_id");
	String channel=(String)session.getAttribute("tea_channel");
	String fid=request.getParameter("fid");
//	String fid=(String)session.getAttribute("fid");
  
  try{	  
	    int fview=0;	  
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
		PreparedStatement stmt2=con.prepareStatement("select * from channels where fid="+fid);
		ResultSet rs1=stmt2.executeQuery();
		if(rs1.next()){
		String fname=rs1.getString("fname");
		String view=rs1.getString("fview");	
		String fpath=rs1.getString("fpath");
		Integer like=rs1.getInt("flike");
		String tea_id=rs1.getString("tea_id");
		PreparedStatement ps2=con.prepareStatement("select tea_fname,tea_mname,tea_lname,tea_channel from TeacherLogin where tea_id="+tea_id);
		ResultSet rs6=ps2.executeQuery();
		if(rs6.next()){
//		String fname=rs6.getString("fname");
		
%>
<br><br><br>
<center>
<table>
<tr align="center">
	<th colspan='3'><h4><%=fname %></h4></th>
</tr>
<tr>
<th colspan='2'><h5>By: <%=rs6.getString("tea_fname") %> <%=rs6.getString("tea_mname") %> <%=rs6.getString("tea_lname") %></h5></th>
<th><h5>Channel:<form action="http://localhost:8080/project/ViewChannel.jsp"><input type="hidden" value=<%=fid %> name="fid"><input type="hidden" value=<%=id %> name="stu_id"><button type="submit" class="btn btn-link"><%=rs6.getString("tea_channel") %></button> </form> </h5></th>
</tr>
<%
}
%>
<tr>
	<td colspan='3'>
	<a href="<%=fpath %>">
 		<video width="900" height="500" controls>
  		<source src="<%=fname %>" >
  		</video>
  		</a>
  	</td>
</tr>
<%	
	    //if view in channels is null
	    if(view==null){
	    	PreparedStatement ps=con.prepareStatement("update channels set fview=1 where fid="+fid);    	//channel view becomes 1
	    	ps.executeUpdate();
  	PreparedStatement ps1=con.prepareStatement("insert into ViewsLikes (viewed,stu_id,fid) values (?,?,?)");    	//insert value in viewslikes
	    	ps1.setBoolean(1, true);
	    	ps1.setString(2,id);
	    	ps1.setString(3, fid);
	    	ps1.executeUpdate();
	    	}
	    else{
	    	  PreparedStatement stmt = con.prepareStatement("select * from ViewsLikes where stu_id="+id+" and fid="+fid);	//check details
	          ResultSet rs=stmt.executeQuery();
			if(rs.next()==false){
	  	    
	  	    //increment views	
	  	    PreparedStatement ps=con.prepareStatement("update channels set fview=fview+1 where fid="+fid);    	
	   	    ps.executeUpdate();

	   	    //insert data into viewslikes
	   	    PreparedStatement ps1=con.prepareStatement("insert into ViewsLikes (viewed,stu_id,fid) values (?,?,?)");    	//insert value in viewslikes
	    	ps1.setBoolean(1, true);
	    	ps1.setString(2,id);
	    	ps1.setString(3, fid);
	    	ps1.executeUpdate();
	  	    }	//end if 
  }  //end else
  %>
<tr>
<td>
<form action="http://localhost:8080/project/Like" method="post">
<input type="hidden" value=<%=fid %> name="fid"> 
<input type="hidden" value=<%=id %> name="id"> 
<input type="hidden" value=<%=like %> name="flike"> 
<button type="submit" class="btn btn-outline-secondary"><img src="file:///C:/Users/acer/eclipse-workspace/project/WebContent/like.jpg" height=30 width=30> </button></form>
</td>
<td>
<form action="http://localhost:8080/project/Dislike" method="post">
<input type="hidden" value=<%=fid %> name="fid"> 
<input type="hidden" value=<%=id %> name="id"> 
<input type="hidden" value=<%=like %> name="flike"> 
<button type="submit" class="btn btn-outline-secondary"><img src="file:///C:/Users/acer/eclipse-workspace/project/WebContent/dislike.jpg" height=30 width=30></button></form>
</td>
<td>
<%=like %> Likes <br><br><%=view %> Views
</td>
</tr>
<tr>
<td colspan='3'>
    <div class="form-group">
      <label for="exampleTextarea">Comments:</label>
      <textarea class="form-control" rows="7" readonly="">
<%
		PreparedStatement stmt3=con.prepareStatement("select comment, stu_id,commenttime from comments where fid="+fid);
		ResultSet rs2=stmt3.executeQuery();
		while(rs2.next()){
		String stu_id=rs2.getString("stu_id");
		PreparedStatement stmt4=con.prepareStatement("select stu_fname,stu_mname,stu_lname from StudentLogin where stu_id="+stu_id);
		ResultSet rs3=stmt4.executeQuery();
		while(rs3.next()){
			
%>
      <%=rs3.getString("stu_fname") %> <%=rs3.getString("stu_mname") %> <%=rs3.getString("stu_lname") %> :
      <%=rs2.getString("comment") %>
      <%=rs2.getTimestamp("commenttime") %>
    <%
    }
    }
    %>
      </textarea>
    </div>
    <form action="http://localhost:8080/project/comment" method=post>
    <div class="form-group">
<input type="hidden" value=<%=fid %> name="fid"> 
<input type="hidden" value=<%=id %> name="id"> 
      <textarea class="form-control" id="comment" name="comment" rows="3"></textarea>
    </div>
</td>
</tr>
<tr>
<td></td>
<td></td>
<td align="right">
    <button type="submit" class="btn btn-primary btn-sm">Send</button>
    </form>
</td>
<tr>
</table>


<%
		  }	//end if next
  }	//end try
  catch(Exception e)
  {out.println(e);}
}	//end else
%>
</center>
<br><br><br>

<br><br><br>

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