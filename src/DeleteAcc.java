import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class DeleteAcc
 */
@WebServlet("/DeleteAcc")
@MultipartConfig(fileSizeThreshold=1024*1024*2, //2mb
maxFileSize= 1024*1024*10,
maxRequestSize=1024*1024*50)
public class DeleteAcc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(true);
 		try{
			String id=(String)session.getAttribute("id");
			String path=(String)session.getAttribute("pic");

			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
		    
		    File file=new File(path);
			if(file.delete()) {
			out.println("Pic deleted!!");
			}


		    PreparedStatement stmt1 = con.prepareStatement("DELETE from ViewsLikes where stu_id="+id);   //enter details in table
		    stmt1.executeUpdate();	//execute command
		    PreparedStatement stmt = con.prepareStatement("DELETE from StudentLogin where stu_id="+id);   //enter details in table
		    stmt.executeUpdate();	//execute command
		    PreparedStatement stmt5 = con.prepareStatement("DELETE from comments where stu_id="+id);   //delete details in table
		    stmt5.executeUpdate();	//execute command
		    PreparedStatement stmt4 = con.prepareStatement("DELETE from follower where stu_id="+id);   //delete details in table
		    stmt4.executeUpdate();	//execute command
		    PreparedStatement stmt6 = con.prepareStatement("DELETE from rate where stu_id="+id);   //delete details in table
		    stmt6.executeUpdate();	//execute command
		
		    response.sendRedirect("Home.html");
		}
		catch(Exception e) {
			out.println(e);
		}
        
		}
}
	


