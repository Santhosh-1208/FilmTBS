<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Ticket</title>
</head>
<body>
<center>
	<h1>Welcome to Add Ticket Page</h1><br>
	<h3>All Available Tickets:</h3>
	
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
        while(rs.next()){
           out.println("<p>" + rs.getInt(1) + " - " 
                            + rs.getString(2) + " - " 
                            + rs.getString(3) + " - " 
                            +rs.getDouble(4)+"</p>");
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        if(rs != null) rs.close();
        if(stmt != null) stmt.close();
        if(con != null) con.close();
    }
%><br><br>
<fieldset style="width:400px; height:330px;border: 2px solid black;"">
<legend>Details</legend>
	<form method="post" action="AddTicket.jsp">
	Name:<input type="text" name="name" ><br><br>
	Phone:<input type="tel" name="phone" ><br><br>
	Ticket ID:<input type="text" name="id"><br><br>
	Movie Name:<input type="text" name="mname" ><br><br>
	Show Time:<input type="time" name="time" ><br><br>
	Seat Number:<input type="text" name="number" ><br><br>
	Price:<input type="checkbox" name="price" value="150">150 <input type="checkbox" name="price" value="250">250 <input type="checkbox" name="price" value="350">350
	<br><br>
	<input type="submit" value="ADD">
	</form>
	</fieldset>
	</center>
</body>
</html>
