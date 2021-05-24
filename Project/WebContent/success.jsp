<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap"
	rel="stylesheet">
</head>
<style type="text/css">
body {
	text-align: center;
	padding: 40px 0;
	background: #EBF0F5;
}

h1 {
	color: #88B04B;
	font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
	font-weight: 900;
	font-size: 40px;
	margin-bottom: 10px;
}

p {
	color: #404F5E;
	font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
	font-size: 20px;
	margin: 0;
}

i {
	color: #9ABC66;
	font-size: 100px;
	line-height: 200px;
	margin-left: -15px;
}

.card {
	background: white;
	padding: 60px;
	border-radius: 4px;
	box-shadow: 0 2px 3px #C8D0D8;
	display: inline-block;
	margin: 0 auto;
}
</style>
<body>
	<div class="card">
		<div
			style="border-radius: 200px; height: 200px; width: 200px; background: #F8FAF5; margin: 0 auto;">
	
		</div>
		<h1>Success</h1>
		<p>
			We received your purchase request;<br /> we'll be in touch shortly!
		</p>
		<a href="DeletefromCart.jsp" class="btn btn-success btn-lg">Continue
			Shopping</a>
	</div>
	<jsp:include page="inc/head.jsp"></jsp:include>
	<sql:setDataSource driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root" password="pass@123"
		var="con" />
	<%
		try 
	{
		String paymentid = request.getParameter("payment_id");
		String paymentstatus = request.getParameter("payment_status");
		String orderid = session.getAttribute("Orderid").toString();
		String username = session.getAttribute("Username").toString();
		System.out.println("user "+username);
		System.out.println("ord "+orderid);
		String query = "update ordertable set PaymentId = ?, PaymentStatus = ? where OrderId = ?";

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "pass@123");

		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, paymentid);
		statement.setString(2, paymentstatus);
		statement.setString(3, orderid);
		statement.executeUpdate();
		
	} 
	catch (Exception e) {
		System.out.println(e);
	}
	%>
</body>
</html>