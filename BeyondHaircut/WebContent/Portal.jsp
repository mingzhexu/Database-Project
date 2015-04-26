<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to myPortal!</title>
</head>
<body>
	<h1>My Portal</h1>
	<p align="center"> Dear friend ${fn:escapeXml(param.username)}, Welcome back!!</p>
	<p align="right"><a href="Homepage.jsp"><button type="button">Sign Out</button></a></p>
	<p>Make An Appointment</p>
	<a href="AppointmentCreate.jsp?username='${fn:escapeXml(param.username)}'">
		<button type="button">New Appointment</button>
	</a>

	<br></br>
	<p>Appointment History</p>
	<a href="GetAppointmentHistory.jsp?username=${fn:escapeXml(param.username)}">
	<button type="button">Appointments History</button></a>

</body>
</html>
