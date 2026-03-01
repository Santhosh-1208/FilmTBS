<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Tickets</title>
</head>
<body>
<center>
	<h1>Welcome to Search Tickets Page</h1>
	<br>
	<fieldset style="width:350px; height:140px;border: 2px solid black;"">
<legend>Details</legend>
	<form method="post" action="SearchTicket.jsp">
	Movie Name:<input type="text" name="mname" ><br><br>
	Show Time:<input type="time" name="time" ><br><br>
	<input type="submit" name="submit" value="View By Movie Name">
	<input type="submit" name="submit" value="View By Show Time">
	</form>
	</fieldset>
	</center>
</body>
</html>