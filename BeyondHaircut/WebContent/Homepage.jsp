

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BEYOND A HAIRCUT</title>
</head>
<body>
<h1><font face="verdana" color="green"> Welcome to BEYOND A HAIRCUT</font></h1>
<img src="loungebarber.jpg" width="340" height="280" align="right">
<h2><font face="verdana" color="green"> Sign Up TODAY and Get 10% off!</font></h2>
<br/><br/>
<a href="Homepage.jsp">SIGN IN</a>
<section class="loginform cf">
<form action="homepage" method="post">
	<ul>
	<li><label for="userName">UserName</label>
	<input id="userName" name="userName" value="" placeholder="username (0~9,a~z)" required></li>
	<li><label for="password">Password</label>
	<input id= "password     " name="password" value="" type="password" name="password" placeholder="password" required></li>
	
		
	<li><input type="submit" value= "login"></li>
	</ul>	
</form>
</section>
	<p>
		<span id="successMessage"><b>${messages.success}</b></span>
	</p>
<a href="CustomerCreate.jsp">SIGN UP</a>



<br/><br/>
<p>Check out our <a href="Barbers.jsp">Top Barbers</a> and their <a href="GetComments.jsp"> Popular Comments!</a></p>
</body>
</html>