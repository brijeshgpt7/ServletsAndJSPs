<%@page import="com.thefax.bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Catalog</title>
</head>
<%
	if (session.getAttribute("USER") == null){
	response.sendRedirect("home.jsp");
} %>
<body bgcolor="#E6E6FA">
	<jsp:include page="banner.jsp" />
	<center>
		<em>
			<h1>Welcome to Catalog Page</h1>
			<table border="1">
				<tr>
					<td>Description</td>
					<td>Price</td>
					<td>Add</td>
				</tr>
				<%
					ArrayList<ProductBean> catalog = (ArrayList<ProductBean>) request
							.getAttribute("CATALOG");
				%>
				<%
					for (ProductBean product : catalog) {
				%>
				<tr>
					<td><%=product.getDescription()%></td>
					<td><%=product.getPrice()%></td>
					<td><a href="shopping.fax?code=<%=product.getCode()%>"> <img
							src="carticon.jpg" height="27" width="27"> </a></td>

				</tr>

				<%
					}
				%>

			</table> </em>
	</center>
</body>
</html>