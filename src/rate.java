

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class rate
 */
@WebServlet("/rate")
public class rate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rate() {
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
		//int flike=0;
	//	HttpSession session=request.getSession(true);
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
    		int rate=Integer.parseInt(request.getParameter("rate"));
    		String fid = request.getParameter("fid");
            String tea_id = request.getParameter("tea_id");
            String id=request.getParameter("stu_id");
            
            PreparedStatement ps=con.prepareStatement("select rate from rate where stu_id="+id+" and tea_id="+tea_id);
            ResultSet rs= ps.executeQuery();
            if(rs.next()) {
            	PreparedStatement ps1=con.prepareStatement("update rate set rate="+rate+" where stu_id="+id+" and tea_id="+tea_id);
                ps1.executeUpdate();

            }
            else {
            	PreparedStatement ps2=con.prepareStatement("insert into rate (stu_id,tea_id,rate) values (?,?,?)");
                ps2.setString(1, id);
                ps2.setString(2, tea_id);
                ps2.setInt(3, rate);
                ps2.executeUpdate();

            }
            
            response.sendRedirect("ViewChannel.jsp?fid="+fid+"&stu_id="+id);
	
            
            		}catch(Exception e) {out.println(e);}
		}

}
