
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
 * Servlet implementation class TeacherRegPg
 */
@WebServlet("/TeacherRegPg")
@MultipartConfig(fileSizeThreshold=1024*1024*2, //2mb
maxFileSize= 1024*1024*10,
maxRequestSize=1024*1024*50)
public class TeacherRegPg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherRegPg() {
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
		Part part=request.getPart("tea_pic");
		String fileName1=part.getSubmittedFileName();
		File file=new File(fileName1);
		//out.println(file.getName());
		String fileName=file.getName();
		String savePath="C:\\Users\\acer\\eclipse-workspace\\project\\ProfilePic\\Teacher"+ File.separator + fileName;
		//File fileSaveDir=new File(savePath);
		
		String fn=request.getParameter("tea_fname");
        String mn = request.getParameter("tea_mname");
        String ln = request.getParameter("tea_lname");
        String email = request.getParameter("tea_email");
        String co = request.getParameter("tea_con");
        String dob = request.getParameter("tea_dob");
        String cou=request.getParameter("tea_course");
        String work = request.getParameter("tea_work");
        String off = request.getParameter("tea_off");
        String post = request.getParameter("tea_post");
        String channel=request.getParameter("tea_uname");
        String pass1 = request.getParameter("tea_password");
        String pass2 = request.getParameter("tea_cpassword");
        if(pass1.equals(pass2)){
        	try{
//        		String pw = DigestUtils.shaHex(pass1);
        		part.write(savePath );
        	Class.forName("com.mysql.jdbc.Driver");
    	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    	    PreparedStatement stmt = con.prepareStatement("insert into TeacherLogin (tea_pic,tea_fname,tea_mname,tea_lname,tea_email,tea_con,tea_dob,tea_course,tea_work,tea_work_off,tea_work_post,tea_channel,tea_password) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");
		    stmt.setString(1, savePath);  
    		    stmt.setString(2, fn);    stmt.setString(3, mn);
        	    stmt.setString(4, ln);    stmt.setString(5, email);
        	    stmt.setString(6, co);    stmt.setString(7, dob);
        	    stmt.setString(8, cou);    stmt.setString(9, work);
        	    stmt.setString(10, off);    stmt.setString(11, post);
        	    stmt.setString(12, channel);    stmt.setString(13, pass1);

        	    stmt.executeUpdate();
    			response.sendRedirect("TeacherLogin.html");

        	}
    			catch(Exception e) {
    				out.println(e);
    			}
    	        }
    	        else 
    	        {
    	        out.println("<h1>Password Mismatch</h1>");
    	      response.sendRedirect("TeacherRegPg.html"); 
    	       }

	}

}
