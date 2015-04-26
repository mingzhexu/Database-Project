<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Barbers</title>
</head>
<body>
	<h1>Here are our Barbers!</h1>
	<form action="barbers" method="post"></form>
	<table border="2">
		<tr>
			<th>BarberId</th>
			<th>FirstName</th>
			<th>About</th>
			<th>Rating</th>
			<th>Choose me</th>
		</tr>
		<c:forEach items="${barbers}" var="barber">
			<tr>
				<td><c:out value="${barber.getBarberId()}" /></td>
				<td><c:out value="${barber.getFirstName()}" /></td>
				<td><c:out value="${barber.getAbout()}" /></td>
				<td><c:out value="${barber.getRating()}" /></td>
				<td>Choose <a href="AppointmentCreate.jsp"><c:out
							value="${barber.getFirstName()}" /> </a> Barber No.<c:out
						value="${barber.getBarberId()}" /></td>

			</tr>
		</c:forEach>
	</table>
	

</body>
</html>