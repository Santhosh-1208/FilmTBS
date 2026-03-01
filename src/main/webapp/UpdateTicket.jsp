<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Ticket Page</title>
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
        String name=request.getParameter("name");
        String phone=request.getParameter("phone");
        String id=request.getParameter("id");
        String movie = request.getParameter("mname");
        String time = request.getParameter("time");
      	String seat=request.getParameter("number");
        double price = Double.parseDouble(request.getParameter("price"));
	
        stmt.execute("use filmdb");
        PreparedStatement ps1 = con.prepareStatement(
        	    "Delete from tickets where  ticketid=?"
        	);
        ps1.setInt(1, Integer.parseInt(id));
        ps1.execute();
        PreparedStatement ps = con.prepareStatement(
        		"INSERT INTO tickets VALUES (?, ?, ?, ?, ?)"
        	);
        	ps.setInt(1, Integer.parseInt(id));
        	ps.setString(2, movie);
        	ps.setString(3, time);
        	ps.setString(4, seat);
        	ps.setDouble(5, price);
        	int flag=ps.executeUpdate();
        	if(flag==1){
        		%><h1>Ticket Updated Successfully <%= name %></h1><%
        	}else{
        		%><h1>Failed to update Ticket <%= name %></h1><%
        	}
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
