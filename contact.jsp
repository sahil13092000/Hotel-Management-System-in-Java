<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%!ResultSet rs; %>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localHost:1521:xe","XE","Sahil@2000");
System.out.println("Database Connected");

PreparedStatement pst = con.prepareStatement("insert into hotelqueries values(?,?,?)");

String name = request.getParameter("name");
String email = request.getParameter("email");
String message = request.getParameter("message");

pst.setString(1,name);
pst.setString(2,email);
pst.setString(3,message);

int rst = pst.executeUpdate();

if(rst>=1)
{
	response.sendRedirect("http://localhost:8888/Hotel_Management_System/contact%201.html");
    
}
else
{
	response.sendRedirect("http://localhost:8888/Hotel_Management_System/contact2.html");

}

%>

</body>
</html>