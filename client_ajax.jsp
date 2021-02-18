<%@ page import="java.sql.*"%>  
<%  
    String c = (request.getParameter("component").toString());  
    int q=Integer.parseInt(request.getParameter("quantity").toString());
    String u=request.getParameter("u");
    String component=request.getParameter("c");
    int field_val = Integer.parseInt(c);
    if(u==null || u.trim().equals("")){  
        out.print("Please enter username");  
    }
    else{  
        try{  
            int quantity=0;
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb","root", "");  
            
            PreparedStatement ps=con.prepareStatement("select * from client_asset where username=?");  
            ps.setString(1,u);  
            ResultSet rs=ps.executeQuery();  
            if(rs.next()){
               quantity = rs.getInt(field_val);
               quantity = quantity + q;
            }
            String sql = "UPDATE `client_asset` SET `"+component+"`= "+quantity+" where username='"+u+"'";
 
            Statement stmt = con.createStatement();
      
            stmt.executeUpdate(sql);
 
            out.print("successfully added");
            con.close();  
        }
        catch(Exception e){out.print(e.toString());
        }  
    }
%> 