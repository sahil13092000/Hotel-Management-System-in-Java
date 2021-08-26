<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!--meta charset="UTF-8"-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>We Hotel | Admin</title>

    <style>
     .blue
     {  
         position: fixed;
         background-color: darkblue;
         height: 100%;
         min-width: 100px;
         padding-top: 20px;
         
         
         
     }
     .white{
      color: white;
      
     }
     .logout{
       border: 1px white solid;
       border-radius: 20px;
       align-items: center;
       
     }
     .white a{
       text-decoration: none;
       color: white;
     }
     .admin{
       text-align: center;
     }
     h1{
     border: 2px solid;
     }
     input{
         padding:5px; 
     }
     
     a{
       text-decoration: none;
       color: white;
     }
         
     
     

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="body">
<%! ResultSet rs; %>



<div class="row">
          <div class="admin"><h1>HOTEL ADMIN</h1></div><hr>
          <div class="col-2 blue">

            <table class="table table-striped" >
              <tr> <td class="white list-group-item active"><a href="admin.jsp">messages</a></td></tr>
             <tr> <td class="white"><a href="adminbooking.jsp">hotel booking</a></td> </tr>
             <tr> <td class="white">rooms</td> </tr>
             <tr> <td class="white">hotel Staff</td> </tr>
             <tr> <td class="white logout"><a href="adminlogin.html">log out</a></td> </tr>
            </table>
          </div>
          <div class="col-3"></div>
          <div class="col-8">
            <table class="table caption-top">
              <caption><h3>HOTEL QUERIES</h3> <div><form method="post" action="deletequery.jsp"> <input type="text" name="name" placeholder="Delete by Name"> <button type="submit" class="btn btn-danger">Delete</button>  </form></div></caption>
              <thead>
                <tr>
                  <th scope="col">Sr no</th>
                  <th scope="col">Name</th>
                  <th scope="col">Email</th>
                  <th scope="col">Message</th>
                </tr>
              </thead>
              <tbody>
              
 <%

try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localHost:1521:xe","XE","Sahil@2000");
	System.out.println("Database Connected");
	PreparedStatement pst=con.prepareStatement("select * from hotelqueries ",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    
	rs = pst.executeQuery();
	ResultSetMetaData rsmd = rs.getMetaData();
	//int cols = rsmd.getColumnCount();
	
	
	
	int count=1;
	while(rs.next())
	{  // System.out.println("this is before out......");
		
	out.println("<tr>");
	out.println("<th scope='row'>"+count+"</th>");
	
	for(int i=1;i<=3;i++)
	{
		//out.println("<tr>");
		
		 out.println("<td>"+rs.getString(i) +"</td>");
		 
		 //out.println("</tr>");
		
		 
	}
	out.println("</tr>");
	count++;
	}
	
	

}catch(Exception e)
{
e.printStackTrace();	

}
%>
              
              
                
                
                
                
              </tbody>
            </table>          </div>
          <!-- <div class="col-5">
            3 of 3
          </div> -->
        </div>
      </div>
    






    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        
        
        

</body>
</html>