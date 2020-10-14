
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">
<meta charset="ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<% 
    if(session.getAttribute("tea_channel")==null || session.getAttribute("tea_channel")==""){
    	response.sendRedirect("TeacherLogin.html");
    }
    else{
    	//String id=(String)session.getAttribute("id");
%>
<form action="EditProfile" method="post" enctype="multipart/form-data">
<table border="0">
				<tr>
					<td><input type="hidden" value="<%=session.getAttribute("tea_id") %>" name="tea_id" size="50"/></td>
					<td><input type="hidden" value="<%=session.getAttribute("tea_password") %>" name="tea_password" size="50"/></td>
				</tr>
				<tr>
				<td colspan="2">
				<b>Change Password?</b>
				</td>
				</tr>
				<tr>
				<td>Enter Old Password</td>
				<td><input type="password" name="pword" size=50/></td>
				</tr>
				<tr>
				<td>Enter New Password</td>
				<td><input type="password" name="npword" size=50/></td>
				</tr>
				<tr>
				<td>Confirm New Password</td>
				<td><input type="password" name="cnpword" size=50/></td>
				</tr>
				
				
				<tr>
					<td><input type="reset" class="btn btn-primary" ></td>
					<td><input type="submit" class="btn btn-primary" value="Submit"></td>
					</tr>
				
			</table>
		
</form>
<%} %>



</body>
</html>