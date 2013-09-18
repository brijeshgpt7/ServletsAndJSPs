<%@page import="com.thefax.bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Summary - </title>
</head>
<body bgcolor="#E6E6FA">
	<jsp:include page="banner.jsp" />
	<center>
		<% ProductBean product = (ProductBean) request.getAttribute("PRODUCT"); %>
		<table align = "center" border ="1">
			<tr><th>Shopping Summary</th></tr>
			<tr><td>Product: <%= product.getDescription() %><br>
					Price: <%= product.getPrice() %>0</td></tr>
			<tr><td><a href="shopping.fax">Continue Shopping</a></td></tr>
			<tr><td><a href="checkout.jsp">Checkout</a></td></tr>
		</table>
	</center>
</body>
</html>