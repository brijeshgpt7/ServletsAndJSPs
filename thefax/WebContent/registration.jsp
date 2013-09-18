<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TheFax.com</title>
</head>
<body bgcolor="#E6E6FA">
	<form action="user.fax">
		<jsp:include page="banner.jsp" />
		<center>
			<h3>Register</h3>
			<table border="1">
				<tr>
					<td>User ID</td>
					<td><input name="userid">
					</td>
				</tr>
				<tr>
					<td>Name</td>
					<td><input name="name">
					</td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td>Age</td>
					<td><select name="age">
							<%
								for (int a = 13; a <= 50; a++) {
							%>
							<option value="<%=a%>"><%=a%></option>
							<%
								}
							%>
					</select>
					</td>
				</tr>
				<tr>
					<td>City</td>
					<td><select name="city">
							<%
								String[] ct = { "Fairfax", "Miami", "Chicago", "New York",
										"Boston", "Vienna" };
								for (int i = 0; i < ct.length; i++) {
							%>
							<option value="<%=ct[i]%>"><%=ct[i]%></option>
							<%
								}
							%>
					</select>
					</td>
				</tr>
				<tr>
					<td>Phone</td>
					<td><input name="phone">
					</td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input name="email">
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Register Me">
					</td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>