
<%@page contentType="text/html" import="java.sql.*" import="javax.servlet.http.Cookie" %>
<html><body>
<%
        String uname=request.getParameter("txtName");         
        String pass = request.getParameter("txtPass");
               try{
    Class.forName("com.mysql.jdbc.Driver");       //jdbc connection
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");	//mysql username and password
    PreparedStatement stmt = con.prepareStatement("select * from StudentLogin where stu_uname=? and stu_password=?");	//check details
    stmt.setString(1, uname);  
    stmt.setString(2, pass);
    ResultSet rs = stmt.executeQuery();
    if(rs.next()){
       String userdbId=rs.getString("stu_id");
       String userdbPic=rs.getString("stu_pic");
  	   String userdbFname=rs.getString("stu_fname"); 	   
 	   String userdbMname=rs.getString("stu_mname");
 	   String userdbLname=rs.getString("stu_lname");
 	   String userdbEmail=rs.getString("stu_email");
 	   String userdbCon=rs.getString("stu_con");
 	   String userdbDob=rs.getString("stu_dob");
 	   String userdbCourse=rs.getString("stu_course");
 	   String userdbWork=rs.getString("stu_work");
	   String userdbUname=rs.getString("stu_uname");	 
 	   String userdbPassword=rs.getString("stu_password");
 	   
 	   //cookies 
 	   Cookie cookieid=new Cookie("id", userdbId);
           

 if(pass.equals(userdbPassword)&&uname.equals(userdbUname))
        {
	 //create sessions
	 session.setAttribute("id",userdbId);
	 session.setAttribute("pic",userdbPic);
	 session.setAttribute("fname",userdbFname);
	 session.setAttribute("mname",userdbMname);
	 session.setAttribute("lname",userdbLname);
	 session.setAttribute("email",userdbEmail);
	 session.setAttribute("con",userdbCon);
	 session.setAttribute("dob",userdbDob);
	 session.setAttribute("course",userdbCourse);
	 session.setAttribute("work",userdbWork);
	 session.setAttribute("uname",userdbUname);
	 session.setAttribute("password",userdbPassword);
	    //send/forward to next page
	    response.sendRedirect("StudentHomePg.jsp" );
	   
        }	    
	       
        }
        
    else{
    out.println("<h1>Username or Password is incorrect !!!!!</h1>");
    %>
<jsp:include page="StudentLogin.html" ></jsp:include>
<%
    }
        }catch(Exception e){out.println(e);}
   %>
