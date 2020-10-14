import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class comment
 */
@WebServlet("/comment")
public class comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public comment() {
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
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
            String fid = request.getParameter("fid");
            String id=request.getParameter("id");
            String comment=request.getParameter("comment");

            PreparedStatement ps = con.prepareStatement("select tea_id from channels where fid="+fid);	//check details
            ResultSet rs=ps.executeQuery();
            while(rs.next()) {
            	String tea_id=rs.getString("tea_id");
            
            PreparedStatement ps1 = con.prepareStatement("INSERT INTO comments (fid,stu_id,tea_id,comment,commenttime) values (?,?,?,?,?)");	// insert details
            ps1.setString(1, fid);
            ps1.setString(2, id);
            ps1.setString(3, tea_id);
            ps1.setString(4, comment);
    		ps1.setTimestamp(5, new Timestamp(System.currentTimeMillis()));            
            ps1.executeUpdate();
            
            
            response.sendRedirect("http://localhost:8080/project/File/Player.jsp?fid="+fid);
            }
            
            		}catch(Exception e) {out.println(e);}
		}

}
