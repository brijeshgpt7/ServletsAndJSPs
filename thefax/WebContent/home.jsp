<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TheFax.com</title>
</head>
<% 		if(request.getParameter("logout")  != null) {
		session.invalidate(); 
		}
%>
<body bgcolor="#E6E6FA">
	<form action="user.fax">
		<jsp:include page="banner.jsp" />
		<% if(request.getParameter("invalid") != null) { %>
		<font color="red">Invalid User ID/Password</font>
		<% } %>
		<div style="width: 45%; height: 50%;">
			<br> <br> <br> Welcome! This is TheFax.com: A new
			style destination of Online Shopping. Loads of Deals and Offers to
			enjoy as you shop.
		</div>
		<div style="width: 50%; height: 50%;">
			<h3>Please Log In</h3>
			<table border="1">
				<tr>
					<td>User ID:</td>
					<td><input name="userid">
					</td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password">
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="login"></td>
				</tr>
			</table>
			New user? <a href="registration.jsp">Register Here</a>
		</div>
	</form>
</body>
</html>