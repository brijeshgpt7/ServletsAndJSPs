<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">TheFax.com</h1>
<center><i>Your Online Shopping Destination</i></center><hr>
<% String user = (String) session.getAttribute("USER"); 
	if(user == null){
	user = "Guest";
	}
%>
<b>Hello <%= user %>!</b>
<a href="home.jsp?logout=yes">Logout</a>
</body>
</html>

