import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfileT")
@MultipartConfig(fileSizeThreshold=1024*1024*2, //2mb
maxFileSize= 1024*1024*10,
maxRequestSize=1024*1024*50)
public class EditProfileT extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    		Part part=request.getPart("tea_pic");
    		String fileName1=part.getSubmittedFileName();
    		String fn=request.getParameter("tea_fname");
            String mn = request.getParameter("tea_mname");
            String ln = request.getParameter("tea_lname");
            String email = request.getParameter("tea_email");
            String co = request.getParameter("tea_con");
            String dob = request.getParameter("tea_dob");
            String cou=request.getParameter("tea_course");
            String work = request.getParameter("tea_work");
            String off = request.getParameter("tea_work_off");
            String desg = request.getParameter("tea_work_post");
		    String id=request.getParameter("tea_id");
		    String path=request.getParameter("tea_path");
		    String password=request.getParameter("tea_password");
			String enteredpword=request.getParameter("pword");
			String npword=request.getParameter("npword");
			String cnpword=request.getParameter("cnpword");
			
			//For new image
		    if(fileName1=="" || fileName1==null) {
		    	out.print("No pic to upload");
    		}
		    else {
		    	File file=new File(path);
            	if(file.delete()) {out.println("File Deleted");}
            	File file1=new File(fileName1);
        		out.println(file1.getName());
        		String fileName=file1.getName();
        		String type=fileName1.substring(fileName1.lastIndexOf("."));
    			String name=fileName.replace(type, "");
    			String PicName=name+id+type;
    			String savePath="C:\\Users\\acer\\eclipse-workspace\\project\\ProfilePic\\Teacher\\" + PicName;
    			part.write(savePath);
    			PreparedStatement ps = con.prepareStatement("update TeacherLogin set tea_pic=? where tea_id="+id);   //enter details in table
    		    ps.setString(1, savePath);  
    		    ps.executeUpdate();	//execute command
    		}
		  //For new password
			if((enteredpword=="" || enteredpword==null)&&(npword=="" || npword==null)&&(cnpword=="" || cnpword==null)) {
				out.println("No password to change");
			}// end null if
			else {
				if(password.equals(enteredpword)) {
					if(npword.equals(cnpword)) {
					PreparedStatement ps=con.prepareStatement("update TeacherLogin set tea_password=? where tea_id="+id);
					ps.setString(1, npword);
					ps.executeUpdate();
					out.println("Password "+enteredpword+" "+npword+" "+cnpword );
					}// end password mismatch if
					else {
						response.sendRedirect("EditProfileT.jsp");
					}
				}//end password entered if
				else {
						response.sendRedirect("EditProfileT.jsp");
				}
			}
			
		    //For new Detail entries
    		PreparedStatement stmt = con.prepareStatement("update TeacherLogin set tea_fname=?, tea_mname=?, tea_lname=? ,tea_email=?, tea_con=?, tea_dob=?, tea_course=?, tea_work=?, tea_work_off=?, tea_work_post=? where tea_id="+id);   //enter details in table
		    stmt.setString(1, fn);    stmt.setString(2, mn);
		    stmt.setString(3, ln);    stmt.setString(4, email);
		    stmt.setString(5, co);    stmt.setString(6, dob);
		    stmt.setString(7, cou);    stmt.setString(8, work);
		    stmt.setString(9, off);    stmt.setString(10, desg);
		    stmt.executeUpdate();	//execute command
			out.println("Updated");
			
			
			response.sendRedirect("signout.jsp");
		}
		catch(Exception e) {
			out.println(e);
		}
	}

}
