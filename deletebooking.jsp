<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! ResultSet rs; %>
<%

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localHost:1521:xe","XE","Sahil@2000");
	System.out.println("Database Connected");
	
	PreparedStatement pst = con.prepareStatement("delete from hotelbooking where firstname=?");
	
	String name = request.getParameter("fname");
	//String password = request.getParameter("password");
	
	pst.setString(1,name);
	//pst.setString(2,password);
	int rst = pst.executeUpdate();
	
	if(rst>0)
	{
		response.sendRedirect("http://localhost:8888/Hotel_Management_System/adminbooking.jsp");
        
	}
	//else
	//{
		//response.sendRedirect("http://localhost:8888/Hotel_Management_System/login1.html");
	//}
	
}catch(Exception e)
{
	//System.out.println("catch qkisdgh");
	e.printStackTrace();
}



%>

</body>
</html>