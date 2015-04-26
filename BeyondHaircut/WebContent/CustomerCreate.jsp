<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a Customer</title>
</head>
<body>
	<h1>Sign Up</h1>
	<p> Already have an account? </p>
	<a href="Homepage.jsp"><button type="button"> Sign in </button></a>
	<p style="color:blue">
		<span id="successMessage"><b>${messages.success}</b></span>
	</p>
	<form action="customercreate" method="post">
		<p>
			<label for="userName">UserName</label>
			<input id="userName" name="userName" value="">
		</p>
		<p>
			<label for="password">Password</label>
			<input id="password" name="password" value="">
		</p>
		<p>
			<label for="firstName">FirstName</label>
			<input id="firstName" name="firstName" value="">
		</p>
		<p>
			<label for="lastName">LastName</label>
			<input id="lastName" name="lastName" value="">
		</p>
		<p>
			<label for="gender">Gender</label>
			<input id="gender" name="gender" value="">
		</p>
		<p>
			<label for="dob">DoB (yyyy-mm-dd)</label>
			<input id="dob" name="dob" value="">
		</p>
		<p>
			<label for="street">Street</label>
			<input id="street" name="street" value="">
		</p>
		<p>
			<label for="city">City</label>
			<input id="city" name="city" value="">
		</p>
		<p>
			<label for="state">State</label>
			<input id="state" name="state" value="">
		</p>
		<p>
			<label for="zip">ZipCode</label>
			<input id="zip" name="zip" value="">
		</p>
		<p>
			<label for="country">Country</label>
			<input id="country" name="country" value="">
		</p>
		
		<p>
			<input type="submit">
		</p>
	</form>
	
	
</body>
</html>