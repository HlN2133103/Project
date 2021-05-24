<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
 <jsp:include page="inc/head.jsp"></jsp:include>
 
 <sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/project"
					   user="root"
					   password="pass@123"
					   var="con"/>
					 
	<sql:query var="rs" dataSource="${con}">
		SELECT * from ordertable where Status ='Delivered'
		</sql:query>
	<div id="main-wrapper">

  <jsp:include page="inc/header.jsp"></jsp:include>
   <jsp:include page="inc/sidebar.jsp"></jsp:include>
		<div class="content-body">

			<div class="container-fluid">

				<div class="row">
					<c:forEach items="${rs.rows}" var="row">
					<div class="col-lg-4">
					
						<div class="card vertical-card__menu">
							<div class="card-body">
								<div class="vertical-card__menu--desc">
									<div class="d-flex justify-content-between align-items-center">
										<h5 class="vertical-card__menu--title"
											style="text-transform: capitalize;">
											${row.OrderId}
										</h5>
										</div>
									<div
										class="d-flex justify-content-between align-items-center mt-2">
										<p class="mb-0">
											<span>PAY:</span> <strong class="text-dark">${row.Paymentmethod}</strong>
										</p>
										<p class="mb-0">
											<strong class="text-danger "> </strong>
										</p>
									</div>
									<div
										class="d-flex justify-content-between align-items-center mt-2">
										<p class="mb-0">
											<span>Amt:</span> <strong class="text-dark">&#x20B9;
											${row.TotalAmount}</strong>
										</p>
										<p class="mb-0">
											<strong class="text-success">${row.Status}</strong>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
	</div>
	<jsp:include page="inc/footer.jsp"></jsp:include>
</body>
