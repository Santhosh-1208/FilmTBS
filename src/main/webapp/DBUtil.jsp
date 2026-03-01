<%@ page import="java.sql.*" %>

<%
    String url = "jdbc:mysql://localhost:3306/filmdb";
    String user = "root";
    String password = "santhosh-777";

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    con = DriverManager.getConnection(url, user, password);
    stmt = con.createStatement();
%>