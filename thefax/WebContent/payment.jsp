<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
</head>
<body bgcolor="#E6E6FA">
	<jsp:include page="banner.jsp" />
	<center>
		<h3>Pay Now</h3>
		<table border="1">
			<tr>
				<td>Cart Total:</td>
				<td>$<%= session.getAttribute("TOTAL") %>0</td>
			</tr>
			<tr>
				<td>Full Name</td>
				<td><input name="fullname"></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input name="address">
				</td>
			</tr>
			<tr>
				<td>State</td>
				<td><select name="state">
						<%
							String[] st = { "Alabama", "North Carolina", "Virginia" };
							for (int i = 0; i < st.length; i++) {
						%>
						<option value="<%=st[i]%>"><%=st[i]%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td>Card Type</td>
				<td><select name="card">
						<%
							String[] cd = { "Visa", "Mastercard", "AmericanExpress" };
							for (int i = 0; i < cd.length; i++) {
						%>
						<option value="<%=cd[i]%>"><%=cd[i]%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td>Card Number</td>
				<td><input name="cardnumber"></td>
			</tr>
			<tr>
				<td>Delivery</td>
				<td><select name="mail">
						<%
							String[] mail = { "USPS", "UPS", "FedEx" };
							for (int i = 0; i < mail.length; i++) {
						%>
						<option value="<%=mail[i]%>"><%=mail[i]%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Confirm Payment">
				</td>
			</tr>
		</table>
	</center>

</body>
</html>