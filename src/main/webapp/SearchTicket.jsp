<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Ticket Page</title>
</head>
<body>
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(
            "jdbc:mysql://127.0.0.1:3306/filmdb", "root", "santhosh-777");
        stmt = con.createStatement();
        String movie = request.getParameter("mname");
        String time = request.getParameter("time");
		PreparedStatement ps;
		if(request.getParameter("submit").equals("View By Movie Name")){
			ps=con.prepareStatement(
					"Select * from tickets where moviename=?"
					);
			ps.setString(1, movie);
		}else{
			ps=con.prepareStatement(
					"Select * from tickets where showtime=? "
					);
			ps.setString(1, time);
		}
        rs = ps.executeQuery();
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
          		<td><%=rs.getDouble(5) %> </td>
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
