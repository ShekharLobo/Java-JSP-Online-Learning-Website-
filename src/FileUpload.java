
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@WebServlet("/FileUpload")
@MultipartConfig(fileSizeThreshold=1024*1024*500, //500mb
maxFileSize= 1024*1024*1024,
maxRequestSize=1024*1024*400)
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		Part part=request.getPart("media"); //out.println(part);
		String fileName1=part.getSubmittedFileName();
		File file=new File(fileName1);
		out.println(file.getName());
		
		//String fileName=fileName1.substring(fileName1.lastIndexOf("\\"));
		String fileName=file.getName();
		String fileType=fileName.substring(fileName.lastIndexOf("."));
		String savePath="C:\\Users\\acer\\eclipse-workspace\\project\\WebContent\\File"+File.separator+ fileName;
		String id=request.getParameter("tea_id");
//		out.println(savePath);
		
		try{
    	part.write(savePath );
    	Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fdtp","root","123456");
	    String sql="insert into channels (fname,ftype,fpath,tea_id,uploadtime) values (?,?,?,?,?)";
	    PreparedStatement stmt = con.prepareStatement(sql);
	    stmt.setString(1, fileName);  
		stmt.setString(2, fileType);
		stmt.setString(3, savePath);
		stmt.setString(4, id);
//		java.sql.Date uploaddate=new java.sql.Date(new java.util.Date().getTime());
	//	java.sql.Timestamp uploadtime=new java.sql.Timestamp(new java.util.Date().getTime());
		stmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
    	stmt.executeUpdate();
		out.println("<b>File Uploaded Successfully to your Channel</b><br><br>");
		out.println("<a href='TeacherHome.jsp'>Home</a>");
    	    
    	}
			catch(Exception e) {
				out.println(e);
			}

	}

}
