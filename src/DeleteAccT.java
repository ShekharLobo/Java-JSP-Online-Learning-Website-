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
@WebServlet("/DeleteAccT")
@MultipartConfig(fileSizeThreshold=1024*1024*500, //2mb
maxFileSize= 1024*1024*1024,
maxRequestSize=1024*1024*400)
public class DeleteAccT extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(true);
 		try{
			String id=(String)session.getAttribute("tea_id");
			String path=(String)session.getAttribute("tea_pic");
			
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
		    
		    File file=new File(path);
			if(file.delete()) {
			out.println("Pic deleted!!");
			}

			PreparedStatement stmt = con.prepareStatement("select fpath,fid from channels where tea_id="+id);   //delete details in table
		    ResultSet rs=stmt.executeQuery();
		    
		    if(rs.next()) {
		    	String fpath=rs.getString("fpath");
		     	File file1=new File(fpath);
		    	if (file1.delete()) {
		    		
		    		out.println("File deleted!!");
		    	}
		    }
		    
		    String fid=rs.getString("fid");
		    PreparedStatement stmt3 = con.prepareStatement("DELETE from viewslikes where fid="+fid);   //delete details in table
		    stmt3.executeUpdate();
		    PreparedStatement stmt1 = con.prepareStatement("DELETE from channels where fid="+fid);   //delete details in table
		    stmt1.executeUpdate();	//execute command
		    PreparedStatement stmt2 = con.prepareStatement("DELETE from TeacherLogin where tea_id="+id);   //delete details in table
		    stmt2.executeUpdate();	//execute command
		    PreparedStatement stmt5 = con.prepareStatement("DELETE from comments where tea_id="+id);   //delete details in table
		    stmt5.executeUpdate();	//execute command
		    PreparedStatement stmt4 = con.prepareStatement("DELETE from follower where tea_id="+id);   //delete details in table
		    stmt4.executeUpdate();	//execute command
		    PreparedStatement stmt6 = con.prepareStatement("DELETE from rate where tea_id="+id);   //delete details in table
		    stmt6.executeUpdate();	//execute command

		    response.sendRedirect("Home.html");
		
		}
		catch(Exception e) {
			out.println(e);
		}
        
		}
}
	

