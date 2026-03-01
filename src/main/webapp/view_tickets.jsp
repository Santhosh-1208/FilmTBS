<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Tickets</title>
</head>
<body>
<center>
	<h1>Welcome to View Tickets Page</h1>
	<br>
	<fieldset style="width:300px; height:130px;border: 2px solid black;"">
<legend>Details</legend>
	<form method="post" action="ViewTicket.jsp">
	Name:<input type="text" name="name" ><br><br>
	Phone:<input type="tel" name="phone" ><br><br>
	<input type="submit" value="View List Of All Tickets">
	</form>
	</fieldset>
	</center>
</body>
</html>