import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
/**
 * Servlet implementation class StudentRegPg
 */
@WebServlet("/StudentRegPg")
@MultipartConfig(fileSizeThreshold=1024*1024*2, //2mb
maxFileSize= 1024*1024*10,
maxRequestSize=1024*1024*50)
public class StudentRegPg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentRegPg() {
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
		Part part=request.getPart("stu_pic");
		String fileName1=part.getSubmittedFileName();
		File file=new File(fileName1);
		out.println(file.getName());
		String fileName=file.getName();
		String savePath="C:\\Users\\acer\\eclipse-workspace\\project\\ProfilePic\\Student\\" + fileName;
		//File fileSaveDir=new File(savePath);				
		String fn=request.getParameter("stu_fname");
        String mn = request.getParameter("stu_mname");
        String ln = request.getParameter("stu_lname");
        String email = request.getParameter("stu_email");
        String co = request.getParameter("stu_con");
        String dob = request.getParameter("stu_dob");
        String cou=request.getParameter("stu_course");
        String work = request.getParameter("stu_work");
        String uname=request.getParameter("stu_uname");
        String pass1 = request.getParameter("stu_password");
        String pass2 = request.getParameter("stu_cpassword");
        
        if(pass1.equals(pass2)) {   //if password and confirmation password are equal
		try{
			part.write(savePath );
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
		    PreparedStatement stmt = con.prepareStatement("insert into StudentLogin (stu_pic,stu_fname,stu_mname,stu_lname,stu_email,stu_con,stu_dob,stu_course,stu_work,stu_uname,stu_password) values (?,?,?,?,?,?,?,?,?,?,?)");   //enter details in table
		    stmt.setString(1, savePath);  
		    stmt.setString(2, fn);    stmt.setString(3, mn);
		    stmt.setString(4, ln);    stmt.setString(5, email);
		    stmt.setString(6, co);    stmt.setString(7, dob);
		    stmt.setString(8, cou);    stmt.setString(9, work);
		    stmt.setString(10, uname);    stmt.setString(11, pass1);
		    
		    stmt.executeUpdate();	//execute command
			response.sendRedirect("StudentLogin.html");
		}
		catch(Exception e) {
			out.println(e);
		}
        }
        else 
        {
        out.println("<h1>Password Mismatch</h1>");
      response.sendRedirect("StudentRegPg.html"); 
       }
        
		}
}
	


