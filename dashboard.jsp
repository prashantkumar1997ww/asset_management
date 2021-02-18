<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>Dash Board</title>
    <style>
        *
		{
			margin: 0;
			padding: 0;
			font-family: Century Gothic;
        }
			a
			{
				text-decoration: none;
				color: black;
				
                border: 1px solid transparent;
                border-radius: 24px;
				transition: 0.6s ease;
			}
        h2
        {
            text-align: center;
            padding: 20px;
        }
        .center {
        margin-left: auto;
        margin-right: auto;
        }
        table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 80%;
        }

        td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
        }

        tr:nth-child(even) {
        background-color: #dddddd;
        }
        .box button {
            border: 0;
            background: none;
            display: block;
            margin: 20px auto;
            text-align: center;
            border: 2px solid #2ecc71;
            padding: 14px 40px;
            outline: none;
            color: white;
            border-radius: 24px;
            transition: 0.25s;
            cursor: pointer
        }
        
        .box button:hover {
            background: #2ecc71
		}
    </style>
</head>

<body>

	<header>
        <div>
			<ul>
				<li><a href="http://localhost/quiz/quiz.php"><strong>Test</strong></a></li>
			</ul>
		</div>
        <br>
        <h2>Welcome User</h2>
        <br>
        <table class="center">
        <tr>
            <th>Components</th>
            <th>Quantity</th>
        </tr>
        <%@ page import="java.sql.*"%>  
        <%  
            String s=request.getParameter("user");  
            if(s==null || s.trim().equals("")){  
                out.print("Please enter username");  
            }
            else{  
                try{  
                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb","root", "");  
                    PreparedStatement ps=con.prepareStatement("select * from client_asset where username=?");  
                    ps.setString(1,s);  
                    ResultSet rs=ps.executeQuery();  
                    int f = 0;
                    if(rs.next()){
                        f=1;
                        String result ="<tr><td>Laptops</td><td>"+ rs.getString(2) + "</td></tr>  <tr><td>Monitors</td><td>" + rs.getString(3) + "</td></tr>    <tr><td>Keyboards</td><td>" + rs.getString(4) + "</td></tr>   <tr><td>Mouse</td><td>" + rs.getString(5) + "</td></tr>   <tr><td>CPU</td><td>" + rs.getString(6) + "</td></tr>";
                        out.print(result);  
                    }  
                    con.close();  
                }
                catch(Exception e){e.printStackTrace();}  
            }  
        %>
        </table>
        <br>
        <div class="box">
            <button> <a href="logout.jsp"><strong>Logout</strong></a></button>
        </div>
	</header>
</body>
</html>