import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/Dislike")
public class Dislike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dislike() {
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
		    int flike=Integer.parseInt(request.getParameter("flike"));
            String fid =request.getParameter("fid");
            String id=request.getParameter("id");
            
            if(flike==0) {
                    //insert data into viewslikes
        	   	    PreparedStatement ps1=con.prepareStatement("update ViewsLikes set liked=false where stu_id="+id+" and fid="+fid);    	//insert value in viewslikes
        	    	ps1.executeUpdate();
            }
                else {
      	    	  PreparedStatement stmt = con.prepareStatement("select liked from ViewsLikes where stu_id="+id+" and fid="+fid);	//check details
    	          ResultSet rs=stmt.executeQuery();
    	          while(rs.next()) {
    	          boolean liked=rs.getBoolean("liked");
    			if(liked==true){

    				//increment likes
                    PreparedStatement ps = con.prepareStatement("update channels set flike=flike-1 where fid="+fid);	//check details
                    ps.executeUpdate();
                
        	   	    //insert data into viewslikes
        	   	    PreparedStatement ps1=con.prepareStatement("update ViewsLikes set liked=false where stu_id="+id+" and fid="+fid);    	//insert value in viewslikes
        	    	ps1.executeUpdate();
        	  	    }	//end if 
}
                }
                response.sendRedirect("http://localhost:8080/project/File/Player.jsp?fid="+fid);
	
            
            		}catch(Exception e) {out.println(e);}
		}

}
