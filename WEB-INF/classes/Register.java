import java.io.IOException;  
import java.io.PrintWriter;  
import java.sql.*;  
  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
  
public class Register extends HttpServlet {  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
        throws ServletException, IOException {  
  
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
          
    String n=request.getParameter("name");
    String m=request.getParameter("number");
    String u=request.getParameter("username");  
    String p=request.getParameter("password");    
    Connection con = null;
    try {
        Class.forName("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb","root", "");
        PreparedStatement ps=con.prepareStatement("insert into client values(?,?,?,?)");
        if (!con.isClosed()){
            ps.setString(1,n);
            ps.setString(2,m);
            ps.setString(3,u);
            ps.setString(4,p);
            int i=ps.executeUpdate();
        }
            PreparedStatement ps1=con.prepareStatement("INSERT INTO client_asset(username) VALUES (?)");
            if (!con.isClosed()){
                ps1.setString(1,u);
                int i=ps1.executeUpdate();
            }
            response.sendRedirect("login.html");
    } catch(Exception e) {
        out.print("Exception: " + e.getMessage());
    } finally {
    try {
        if (con != null)
            con.close();
        } catch(SQLException e) {}
    }
      
        // RequestDispatcher rd=request.getRequestDispatcher("index.html");  
        // rd.include(request,response);  
    // }  
          
    out.close();  
    }  
}  