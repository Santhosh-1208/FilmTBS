<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Tickets</title>
</head>
<body>
<center>
	<h1>Welcome to Delete Tickets Page</h1>
	<br>
	<fieldset style="width:400px; height:330px;border: 2px solid black;"">
<legend>Details</legend>
	<form method="post" action="DeleteTicket.jsp">
	Name:<input type="text" name="name" ><br><br>
	Phone:<input type="tel" name="phone" ><br><br>
	Ticket ID:<input type="text" name="id"><br><br>
	Movie Name:<input type="text" name="mname" ><br><br>
	Show Time:<input type="time" name="time" ><br><br>
	Seat Number:<input type="text" name="number" ><br><br>
	Price:<input type="checkbox" name="price" value="150">150 <input type="checkbox" name="price" value="250">250 <input type="checkbox" name="price" value="350">350
	<br><br>
	<input type="submit" value="Delete">
	</form>
	</fieldset>
	</center>
</body>
</html>