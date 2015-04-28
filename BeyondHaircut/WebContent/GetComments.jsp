<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Find comments for a barber</title>
<style>
body {background-color;
	background-repeat: no-repeat;
	background-position: left top;
	margin-top: 20px;
	margin-left: 20px;
	margin-right: 20px;
}

p {
	word-spacing: 5px;
}

body {
	background-color: lightblue
}
</style>
</head>
<body>
<a href="Homepage.jsp"><button type="button"> Home Page </button></a>

	<form action="getcomments" method="get">
		<h1>Search for comments by BarberId</h1>
		<p>
			<label for="barberId">BarberId</label>
			<input id="barberId" name="barberId" value="${fn:escapeXml(param.barberId)}">
		</p>
		<p>
			<input type="submit">
			<br/><br/><br/>
			<span id="successMessage"><b>${messages.success}</b></span>
		</p>
	</form>
	<br/>
	<div id="CommentCreate"><a href="CommentCreate.jsp">Create Comment</a></div>
	<br/>
	<h1>Matching Comments</h1>
        <table border="1">
            <tr>
                <th>BarberId</th>
                <th>CommentId</th>
                <th>Content</th>
                <th>CustomerId</th>
                <th>Delete Comment</th>
            </tr>
            <c:forEach items="${comments}" var="comment" >
                <tr>
                    <td><c:out value="${comment.getBarberId()}" /></td>
                    <td><c:out value="${comment.getCommentId()}" /></td>
                    <td><c:out value="${comment.getContent()}" /></td>
                    <td><c:out value="${comment.getCustomerId()}" /></td>
                    <td><a href="deletecomment?commentId=<c:out value="${comment.getCommentId()}"/>">Delete</a></td>
                </tr>
            </c:forEach>
       </table>
</body>
</html>