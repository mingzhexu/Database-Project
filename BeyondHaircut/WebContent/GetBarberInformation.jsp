<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>The Barber who gave me the haircut: </title>
<style>
body {
    background-color;
    background-repeat: no-repeat;
    background-position: left top;
    margin-top: 0px;
    margin-left: 20px;
    margin-right: 20px;
}
p { 
    word-spacing: 5px;
}
body {background-color:lightblue}
</style>
</head>
<body>
	<h1>${messages.title}</h1>
        <table border="1">
            <tr>
                <th>FirstName</th>
                <th>LastName</th>
            </tr>
            <c:forEach items="${barbers}" var="barber" >
                <tr>
                    <td><c:out value="${barber.getFirstName()}" /></td>
                    <td><c:out value="${barber.getLastName()}" /></td>
                </tr>
            </c:forEach>
       </table>
       <p><font color="grey" face="Comic sans MS" size="3"> 
       Tell us more about this barber! We'd love to hear your feedback! </font></p>
       <a href="CommentCreate.jsp?username=${fn:escapeXml(param.username)}">
       <font color="grey" face="Comic sans MS" size="3"> Comment</font></a>
</body>
</html>
