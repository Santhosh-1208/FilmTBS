<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Ticket Page</title>
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
        PreparedStatement ps = con.prepareStatement(
        	    "Delete from tickets where ticketid=?"
        	);
        	ps.setInt(1, Integer.parseInt(id));
        	int flag=ps.executeUpdate();
        	if(flag==1){
        		%><h1>Ticket Delete Successfully <%= name %></h1><%
        	}else{
        		%><h1>Failed to delete Ticket <%= name %></h1><%
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
