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

PreparedStatement pst = con.prepareStatement("insert into hotelusers values(?,?,?,?,?,?)");

String fullname = request.getParameter("fullname");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String username = request.getParameter("username");
String password = request.getParameter("password");
String password2 = request.getParameter("password2");
String city = request.getParameter("city");

if(password.equals(password2))
{
	

pst.setString(1,fullname);
pst.setString(2,email);
pst.setString(3,mobile);
pst.setString(4,username);
pst.setString(5,password);
pst.setString(6,city);

int rst = pst.executeUpdate();

if(rst>=1)
{
	response.sendRedirect("http://localhost:8888/Hotel_Management_System/index.html");
    
}
else
{
     response.sendRedirect("http://localhost:8888/Hotel_Management_System/create_new_account2.html");
     //out.println("failed");
}

}

else
{
	//out.println("<html><body><script type='text/javascript'> alert('Both passwords should be same') </script></body> </html>");
	//out.flush();
	//Thread.sleep(5000);
   response.sendRedirect("http://localhost:8888/Hotel_Management_System/create_new_account1.html");
    //out.println("password does not match");
}

%>

</body>
</html>