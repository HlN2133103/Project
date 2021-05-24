<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>All Orders</title>
</head>
<body>

	<sql:setDataSource driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root" password="pass@123"
		var="con" />

	<sql:query var="rs" dataSource="${con}">
		select * from ordertable 
	</sql:query>

	<jsp:include page="inc/head.jsp"></jsp:include>

	<div id="main-wrapper">
		<jsp:include page="inc/header.jsp"></jsp:include>
		<jsp:include page="inc/sidebar.jsp"></jsp:include>
		<div class="content-body">
			<div class="container-fluid">


				<div class="row">
					<div class="col-12">
						<h3 class="content-heading">Orders</h3>
					</div>
					<div class="col-12">
						<div
							class="card-footer d-flex justify-content-between align-items-center">
							<div class="vertical-card__menu--location">
								<div class="d-block">All Orders</div>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="example" class="display" style="min-width: 845px">
									<thead>
										<tr>
											<th>OrderId</th>
											<th>Orderdate</th>
											<th>Ordertime</th>
											<th>Username</th>
											<th>Name</th>
											<th>email</th>
											<th>Phone</th>
											<th>Company</th>
											<th>Totalamount</th>
											<th>Paymentmethod</th>
											<th>PaymentId</th>
											<th>ShippingAddress</th>
											<th>Placeofdelivery</th>
											<th>instructions</th>
											<th>Status</th>
											<th>PaymentStatus</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${rs.rows}" var="row">
											<tr>
												<td>${row.OrderId}</td>
												<td>${row.Orderdate}</td>
												<td>${row.Ordertime}</td>
												<td>${row.Username}</td>
												<td>${row.Name}</td>
												<td>${row.email}</td>
												<td>${row.Phone}</td>
												<td>${row.Company}</td>
												<td>${row.Totalamount}</td>
												<td>${row.Paymentmethod}</td>
												<td>${row.PaymentId}</td>
												<td>${row.ShippingAddress}</td>
												<td>${row.Placeofdelivery}</td>
												<td>${row.instructions}</td>
												<td>${row.Status}</td>
												<td>${row.PaymentStatus}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="inc/footer.jsp"></jsp:include>
</body>
</html>
