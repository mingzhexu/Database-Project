

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Make An Appointment</title>
</head>
<body>
	<h1>Make An Appointment</h1>
	<form action="appointmentcreate" method="post">
		<p>
			<label for="userName">UserName</label> <input id="userName"
				name="userName" value="">
		</p>
		<p>
			<label for="date">Date (yyyy-mm-dd)</label> <input id="date"
				name="date" value="">
		</p>
		<p>
			<label for="time">Time</label> <input id="time" name="time" value="">
		</p>
		<p>
			<label for="barber">Which Barber? (optional)</label> <input
				id="barber" name="barber" value="">
		</p>
		<p>
			<label for="store">which store? (store id)</label> <input id="store"
				name="store" value="">
		</p>
		<table style="width: 100%">
			<tr>
    		<td>1</td>
   			<td>2</td> 
    		<td>3</td>
  			</tr>
  			<tr>
    		<td>Seattle</td>
    		<td>Kirkland</td> 
    		<td>Bellevue</td>
  			</tr>
		</table>
		<p>
			<label for="style">Your Hair Style (optional)</label>
			<input id="style" name="style" value="">
		</p>
		<p>
			<input type="submit">
		</p>
	</form>
	<br />
	<br />
	<p>
		<span id="successMessage"><b>${messages.success}</b></span>
	</p>
	<a href="Portal.jsp"><button type="button"> Go Back To My Portal </button></a>
	<a href="Homepage.jsp"><button type="button"> Go Back To Home Page </button></a>
</body>
</html>