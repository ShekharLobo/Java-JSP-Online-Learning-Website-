

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
 * Servlet implementation class follow
 */
@WebServlet("/follow")
public class follow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public follow() {
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
            String fid = request.getParameter("fid");
            String id=request.getParameter("stu_id");
            String tea_id=request.getParameter("tea_id");
            int follow=Integer.parseInt(request.getParameter("follow"));
            
            PreparedStatement ps0 = con.prepareStatement("select follow from follower where tea_id="+tea_id+" and stu_id="+id);	//check details
            ResultSet rs0=ps0.executeQuery();
            if(rs0.next()) {
                
            	if(rs0.getBoolean("follow")==true) {
            		if(follow==0) {
                    PreparedStatement ps = con.prepareStatement("update follower set follow="+false+" where stu_id="+id+" and tea_id="+tea_id);	//update the details
                    ps.executeUpdate();
            		}
            	}
            	else {	//if follow=false
                    PreparedStatement ps = con.prepareStatement("update follower set follow="+true+" where stu_id="+id+" and tea_id="+tea_id);	//update if the user want to follow again
                    ps.executeUpdate();            		
            	}
	
            }	//end rs0.next if
            else {	//if no data in follow table
        		if(follow==1) {
                    PreparedStatement ps = con.prepareStatement("insert into follower (stu_id,tea_id,follow) values(?,?,?)");	//insert details
                    ps.setString(1, id);
                    ps.setString(2, tea_id);
                    ps.setBoolean(3, true);
                    ps.executeUpdate();
            		}
            }
            
            response.sendRedirect("ViewChannel.jsp?fid="+fid+"&stu_id="+id);	
            
            		}catch(Exception e) {out.println(e);}
		}

}
