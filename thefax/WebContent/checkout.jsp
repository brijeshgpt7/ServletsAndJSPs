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
<body bgcolor="#E6E6FA">
	<jsp:include page="banner.jsp" />
	<center>
		<em>
			<h1>Checkout</h1>
			<table border="1">
				<tr>
					<td>Description</td>
					<td>Price</td>
					<td>Remove</td>
				</tr>
				<%
					ArrayList<ProductBean> cart = (ArrayList<ProductBean>) session
							.getAttribute("CART");
					String index = request.getParameter("idx");
					if (index != null) {
						cart.remove(Integer.parseInt(index));
					}
					session.setAttribute("CART", cart);
				%>
				<%
					Double total = new Double(0);
					int idx = 0;
				%>
				<%
					for (ProductBean product : cart) {
				%>
				<tr>
					<td><%=product.getDescription()%></td>
					<td><%=product.getPrice()%></td>
					<td><a href="checkout.jsp?idx=<%=idx++%>"> <img
							src="carticon.jpg" height="27" width="27"> </a></td>

				</tr>

				<%
					total += product.getPrice(); }
				%>

				<tr>
					<td>Cart Total:</td>
					<td>$<%=total%></td>
					<% session.setAttribute("TOTAL", total); %>
				</tr>
				<tr>
					<td><a href="payment.jsp">Pay Now</a>
					</td>
				</tr>

			</table> </em>
	</center>
</body>
</html>