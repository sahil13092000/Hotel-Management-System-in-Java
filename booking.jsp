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
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localHost:1521:xe","XE","Sahil@2000");
System.out.println("Database Connected");

PreparedStatement pst = con.prepareStatement("insert into hotelbooking values(?,?,?,?,?,?,?,?,?)");

String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String aadhaar = request.getParameter("aadhaar");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String zip = request.getParameter("zip");


pst.setString(1,firstname);
pst.setString(2,lastname);
pst.setString(3,email);
pst.setString(4,mobile);
pst.setString(5,aadhaar);
pst.setString(6,address);
pst.setString(7,city);
pst.setString(8,state);
pst.setString(9,zip);

int rst = pst.executeUpdate();

if(rst>=1)
{
	response.sendRedirect("http://localhost:8888/Hotel_Management_System/booking1.html");
    
}



%>
</body>
</html>