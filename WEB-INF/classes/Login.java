import java.io.IOException;  
import java.io.PrintWriter;  
import java.sql.*;  
  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;


public class Login extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
        throws ServletException, IOException 
    {  
  
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
          
    String u=request.getParameter("username");  
    String p=request.getParameter("password");
    
    Connection con = null;
    Statement stm = null;
    ResultSet rs = null;

        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb","root", "");
            String query = "select * from client where username='"+u+"' and password='"+p+"'";
            stm = con.createStatement();
            rs = stm.executeQuery(query);
            if (rs.next())
            {
                // out.println("<h1>Welcome</h1>");
                // out.println("<p>Name = "+rs.getString("name")+"</p>");
                // out.println("<p>Mobile Number = "+rs.getString("mobile number")+"</p>");
                // out.println("<p>Username = "+rs.getString("username")+"</p>");
                response.sendRedirect("client.jsp?u="+u);
            }
            else
            {
                out.println("<h3>Sorry Check your Username and Password</h3>");
            }
        }
        catch(Exception e) 
        {
            out.print("Exception: " + e.getMessage());
        }
        finally 
        {
            try 
            {
                rs.close();
                stm.close();
                con.close();
            } 
            catch(SQLException e) {}
        }
    }  
}