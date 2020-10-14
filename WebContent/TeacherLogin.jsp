
<%@page contentType="text/html" import="java.sql.*"
import="java.security.MessageDigest"
import="java.security.NoSuchAlgorithmException"
%>
<html><body>
<%
        String uname=request.getParameter("txtName");
        String pass = request.getParameter("txtPass");
        String generatedPassword = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(pass.getBytes());
            //Get the hash's bytes
            byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedPassword = sb.toString();
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }      
      
      
               try{
            	   
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    PreparedStatement stmt = con.prepareStatement("select * from TeacherLogin where tea_channel=? and tea_password=?");
    stmt.setString(1, uname);  
    stmt.setString(2, generatedPassword);
    
    ResultSet rs1 = stmt.executeQuery();
    if(rs1.next() ){
       String userdbId=rs1.getString("tea_id");
  	   String userdbPic=rs1.getString("tea_pic"); 	   
  	   String userdbFname=rs1.getString("tea_fname"); 	   
 	   String userdbMname=rs1.getString("tea_mname");
 	   String userdbLname=rs1.getString("tea_lname");
 	   String userdbEmail=rs1.getString("tea_email");
 	   String userdbCon=rs1.getString("tea_con");
 	   String userdbDob=rs1.getString("tea_dob");
 	   String userdbCourse=rs1.getString("tea_course");
 	   String userdbWork=rs1.getString("tea_work");
 	   String userdbWorkOff=rs1.getString("tea_work_off");
 	   String userdbPost=rs1.getString("tea_work_post");
	   String userdbUname=rs1.getString("tea_channel");	 
 	   String userdbPassword=rs1.getString("tea_password");	 

 if(generatedPassword.equals(userdbPassword)&&uname.equals(userdbUname))
        {
	 session.setAttribute("tea_id",userdbId);
	 session.setAttribute("tea_pic",userdbPic);
	 session.setAttribute("tea_fname",userdbFname);
	 session.setAttribute("tea_mname",userdbMname);
	 session.setAttribute("tea_lname",userdbLname);
	 session.setAttribute("tea_email",userdbEmail);
	 session.setAttribute("tea_con",userdbCon);
	 session.setAttribute("tea_dob",userdbDob);
	 session.setAttribute("tea_course",userdbCourse);
	 session.setAttribute("tea_work",userdbWork);
	 session.setAttribute("tea_work_off",userdbWorkOff);
	 session.setAttribute("tea_work_post",userdbPost);
	 session.setAttribute("tea_channel",userdbUname);
	 session.setAttribute("tea_password",userdbPassword);
	 	 
			response.sendRedirect("TeacherHome.jsp" );
	   
        }	    
	       
        }
        
    else{
    out.println("<h1>User Name not exist !!!!!</h1>");
   
    %>
<jsp:include page="TeacherLogin.html" ></jsp:include>
<%
    }
        	}catch(Exception e){out.println(e);}
   
   %>
</body>