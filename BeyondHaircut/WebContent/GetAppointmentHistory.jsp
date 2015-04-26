<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get appointment history for a username</title>
</head>
<body>
	<form action=getappointmenhistory method="get">
		<h1>Get appointment history for a username</h1>
		<p>
			<label for="username">UserName</label>
			<input id="username" name="username" value="${fn:escapeXml(param.username)}">
		</p>
		<p>
			<input type="submit">
			<br/><br/><br/>
			<span id="successMessage"><b>${messages.success}</b></span>
		</p>
	</form>
	<h1>Appointments</h1>
        <table border="1">
            <tr>
                <th>UserName</th>
                <th>StoreId</th>
                <th>AppointmentId</th>
                <th>Date</th>
                <th>Duration</th>
                <th>BarberId</th>
                <th>Style</th>
                <th>Price</th>
            </tr>
            <c:forEach items="${appointments}" var="appointment" >
                <tr>
                    <td><c:out value="username" /></td>
                    <td><c:out value="${appointment.getStoreId()}" /></td>
                    <td><c:out value="${appointment.getAppointmentId()}" /></td>
                    <td><c:out value="${appointment.getDate()}" /></td>
                    <td><c:out value="${appointment.getDuration()}" /></td>
                    <td><c:out value="${appointment.getBarberId()}" /></td>
                    <td><c:out value="${appointment.getStyle()}" /></td>
                    <td><c:out value="${appointment.getPrice()}" /></td>
            
                </tr>
            </c:forEach>
       </table>
</body>
</html>