<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
</head>
<body>
<%! ResultSet rs; %>

<%

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localHost:1521:xe","XE","Sahil@2000");
	System.out.println("Database Connected");
	
	PreparedStatement pst = con.prepareStatement("select * from hotelusers where username=? and password =?");
	
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	pst.setString(1,username);
	pst.setString(2,password);
	rs = pst.executeQuery();
	
	if(rs.next())
	{
		response.sendRedirect("http://localhost:8888/Hotel_Management_System/index.html");
        
	}
	else
	{
		response.sendRedirect("http://localhost:8888/Hotel_Management_System/login1.html");
	}
	
}catch(Exception e)
{
	System.out.println("catch qkisdgh");
	e.printStackTrace();
}


%>

</body>
</html>