<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Ticket Page</title>
</head>
<body>
<h1>All Available Tickets:</h1>
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(
            "jdbc:mysql://127.0.0.1:3306/filmdb", "root", "santhosh-777");
        stmt = con.createStatement();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
       	PreparedStatement ps2=con.prepareStatement("SELECT * FROM movies ");
		rs=ps2.executeQuery();
		%>
		<table border="1" cellpadding="10" cellspacing="0"> 
		<tr>
		 <th>Ticket ID</th> 
		 <th>Movie Name</th> 
		 <th>Show Time</th>
		 <th>Price</th> 
		</tr> 
		<%
        while(rs.next()){
        	%>
          <tr> <td><%=rs.getInt(1) %> </td>
          		<td><%=rs.getString(2) %> </td>
          		<td><%=rs.getString(3) %> </td>
          		<td><%=rs.getDouble(4) %> </td>
           </tr><%               
        }
		%></table><%
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        if(rs != null) rs.close();
        if(stmt != null) stmt.close();
        if(con != null) con.close();
    }
%>
</body>
</html>
