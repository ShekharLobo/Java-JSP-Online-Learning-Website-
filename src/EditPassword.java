import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/EditPassword")
public class EditPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
		    String id=request.getParameter("tea_id");
		    String password=request.getParameter("tea_password");
			String enteredpword=request.getParameter("pword");
			String npword=request.getParameter("npword");
			String cnpword=request.getParameter("cnpword");
			//For new password
			if((enteredpword=="" || enteredpword==null)&&(npword=="" || npword==null)&&(cnpword=="" || cnpword==null)) {
				out.println("No password to change");
			}//end null if
			else {
				if(password.equals(enteredpword)) {
					if(npword.equals(cnpword)) {
					PreparedStatement ps=con.prepareStatement("update TeacherLogin set tea_password=? where tea_id="+id);
					ps.setString(1, cnpword);
					ps.executeUpdate();
					out.println("Password "+enteredpword+" "+npword+" "+cnpword );
					}// end password mismatch if
					else {
						response.sendRedirect("EditProfile.jsp");
					}
				}//end password entered if
				else {
						response.sendRedirect("EditProfile.jsp");
				}
				out.println("Login again to see the changes<br>");
				 //   response.sendRedirect("signoutS.jsp");
			}
		   }
		catch(Exception e) {
			out.println(e);
		}

		
		
		}

}
