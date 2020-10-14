import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.Part;
/**
 * Servlet implementation class DeleteFile
 */
@WebServlet("/DeleteFile")
@MultipartConfig(fileSizeThreshold=1024*1024*500, //500mb
maxFileSize= 1024*1024*1024,
maxRequestSize=1024*1024*400)
public class DeleteFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFile() {
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

	//	HttpSession session=request.getSession(true);
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
			String file[]=request.getParameterValues("file");
			for(int i=0; i<file.length;i++) { 
			    PreparedStatement stmt2 = con.prepareStatement("select fpath from channels where fid="+file[i]);
			    ResultSet rs=stmt2.executeQuery();
			    if(rs.next()) {
			    String path=rs.getString("fpath");
			    File files=new File(path);
			    if(files.delete()) {out.println();};				
			    }
			    
			    String sql2="delete from comments where fid="+file[i];
			    PreparedStatement stmt3 = con.prepareStatement(sql2);
			    stmt3.executeUpdate();
			    
			    String sql1="delete from viewslikes where fid="+file[i];
			    PreparedStatement stmt1 = con.prepareStatement(sql1);
			    stmt1.executeUpdate();
			    
			    String sql="delete from channels where fid="+file[i];
			    PreparedStatement stmt = con.prepareStatement(sql);
			    stmt.executeUpdate();
			    }
		out.println("<link rel=\"stylesheet\" href=\"bootstrap.css\"><br><br>");
		out.println("<b>File Deleted Successfully to your Channel</b><br><br>");
		out.println("<a href='TeacherHome.jsp'>Home</a>");
    	    
    	}
			catch(Exception e) {
				out.println(e);
			}

	}

}
