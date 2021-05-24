<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<jsp:include page="inc/head.jsp"></jsp:include>
	<jsp:include page="inc/header.jsp"></jsp:include>

	<sql:setDataSource driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root" password="pass@123"
		var="con" />

	<sql:query var="rs" dataSource="${con}">
		select p.Id,p.Brand,p.Productname,p.MRP_Price,p.C_Price,p.Margin from products p LEFT JOIN orders o ON p.Id = o.ProductId where p.Id = o.ProductId;
	 </sql:query>
	<div class="hero-slider-container mb-35">
		<div class="hero-slider-one">
			<div class="hero-slider-item slider-bg-1">
				<div
					class="slider-content d-flex flex-column justify-content-center align-items-center">
					<h1>One Stop Supply</h1>
					<p>get Products from our firm to your table</p>
					<a href="Products.jsp" class="slider-btn">SHOP NOW</a>
				</div>

			</div>
			<div class="hero-slider-item slider-bg-2">
				<div
					class="slider-content d-flex flex-column justify-content-center align-items-center">
					<h1>Fresh & Nature</h1>
					<p>get fresh food from our firm to your table</p>
					<a href="Products.jsp" class="slider-btn">SHOP NOW</a>
				</div>
			</div>

		</div>
	</div>
	<div class="services">
		<div class="container">
			<h2>Top Selling Products</h2>
			<div class="row">
				<c:forEach items="${rs.rows}" var="row">
					<div class="col-md-4">
						<div class="service-item">
							<a href="product-details.jsp?Id=${row.Id}"> <img
								src="ImageServlet?id=${row.Id}"
								style="height: 250px; width: 300px;" class="img-responsive"
								alt="" /></a>
							<div class="down-content">
								<h4>${row.Brand} ${row.Productname}</h4>
								<div style="margin-bottom: 10px;">
									<span style="font-size: 20px;"> MRP: ${row.MRP_Price} </span> <br>
									<span style="font-size: 20px;"> Cost Price :
										${row.S_Price} </span> <br> <span style="font-size: 20px;">
										Margin: ${row.Margin}% </span>
								</div>

							</div>
						</div>
						<br>
					</div>
				</c:forEach>
			</div>



			<br> <br> <br> <br>
		</div>
	</div>


	<jsp:include page="inc/footer.jsp"></jsp:include>
</body>
</html>