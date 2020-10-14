import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
@MultipartConfig(fileSizeThreshold=1024*1024*2, //2mb
maxFileSize= 1024*1024*10,
maxRequestSize=1024*1024*50)
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
//		String savePath="";
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    		Part part=request.getPart("stu_pic");
    		String fileName1=part.getSubmittedFileName();
    		String fn=request.getParameter("stu_fname");
            String mn = request.getParameter("stu_mname");
            String ln = request.getParameter("stu_lname");
            String email = request.getParameter("stu_email");
            String co = request.getParameter("stu_con");
            String dob = request.getParameter("stu_dob");
            String cou=request.getParameter("stu_course");
            String work = request.getParameter("stu_work");
		    String id=request.getParameter("stu_id");
		    String path=request.getParameter("stu_pic");
		    String password=request.getParameter("stu_password");
			String enteredpword=request.getParameter("pword");
			String npword=request.getParameter("npword");
			String cnpword=request.getParameter("cnpword");
			if(fileName1=="" || fileName1==null) {
		    	out.println("No pics to upload");
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
    			String savePath="C:\\Users\\acer\\eclipse-workspace\\project\\ProfilePic\\Student\\" + PicName;
    			part.write(savePath);
    			PreparedStatement stmt = con.prepareStatement("update StudentLogin set stu_pic=? where stu_id="+id);   //enter details in table
    		    stmt.setString(1, savePath);  
    		    stmt.executeUpdate();	//execute command
    			out.println(PicName);
		    }
			
			//For new password
			if((enteredpword=="" || enteredpword==null)&&(npword=="" || npword==null)&&(cnpword=="" || cnpword==null)) {
				out.println("No password to change");
			}// end null if
			else {
				if(password.equals(enteredpword)) {
					if(npword.equals(cnpword)) {
					PreparedStatement ps=con.prepareStatement("update StudentLogin set stu_password=? where stu_id="+id);
					ps.setString(1, cnpword);
					ps.executeUpdate();
					out.println("Password "+enteredpword+" "+npword+" "+cnpword );
					}// end password mismatch if
					else {
						response.sendRedirect("EditProfile.jsp");
					}
				}//end password entered if
				else {
						response.sendRedirect("EditProfile.jsp");
				}
			}
			PreparedStatement stmt = con.prepareStatement("update StudentLogin set stu_fname=?, stu_mname=?, stu_lname=? ,stu_email=?, stu_con=?, stu_dob=?, stu_course=?, stu_work=? where stu_id="+id);   //enter details in table
		    stmt.setString(1, fn);    stmt.setString(2, mn);
		    stmt.setString(3, ln);    stmt.setString(4, email);
		    stmt.setString(5, co);    stmt.setString(6, dob);
		    stmt.setString(7, cou);    stmt.setString(8, work);
		    stmt.executeUpdate();	//execute command
			
			out.println("Login again to see the changes<br>");
		    response.sendRedirect("signoutS.jsp");
		   }
		catch(Exception e) {
			out.println(e);
		}
        }
        
        
	}


