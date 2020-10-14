import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class chatbox
 */
@WebServlet("/chatbox")
public class chatbox extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chatbox() {
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
            String stu_id = request.getParameter("id");
            String tea_id=request.getParameter("tea_id");
            String person=request.getParameter("person");
            String chat=request.getParameter("chat");

            if(person=="stu") {
            PreparedStatement ps1 = con.prepareStatement("INSERT INTO chatbox (stu_id,tea_id,chat,chattime,stu) values (?,?,?,?,?)");	// insert details
            ps1.setString(1, stu_id);
            ps1.setString(2, tea_id);
            ps1.setString(3, chat);
    		ps1.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
    		ps1.setBoolean(5,true);
            ps1.executeUpdate();
            response.sendRedirect("ChatBoxS.jsp?id="+stu_id+"&tea_id="+tea_id);
            }
            else {
                PreparedStatement ps1 = con.prepareStatement("INSERT INTO chatbox (stu_id,tea_id,chat,chattime,tea) values (?,?,?,?,?)");	// insert details
                ps1.setString(1, stu_id);
                ps1.setString(2, tea_id);
                ps1.setString(3, chat);
        		ps1.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
        		ps1.setBoolean(5,true);
                ps1.executeUpdate();
                response.sendRedirect("ChatBoxT.jsp?id="+stu_id+"&tea_id="+tea_id);
            	
            }
            
            		}catch(Exception e) {out.println(e);}
		}

}
