<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>

<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/project"
					   user="root"
					   password="pass@123"
					   var="con"/>
					 
	<sql:query var="rs" dataSource="${con}">
		SELECT * from ordertable 
		</sql:query>
		
	<style type="text/css">
#order_view {
	cursor: pointer;
}
</style>
	<jsp:include page="inc/head.jsp"></jsp:include>
	<div id="main-wrapper">



		<jsp:include page="inc/header.jsp"></jsp:include>
		<jsp:include page="inc/sidebar.jsp"></jsp:include>
		<div class="content-body">

			<div class="row">
				<div class="col-lg-12">
					<div class="row" data-id="recent_list">
					<c:forEach items="${rs.rows}" var="row">
						<div class="col-lg-4"
							id="${row.OrderId}"
							tid="${row.OrderId}">
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
												<span>PAY: </span><strong class="text-dark">${row.Paymentmethod}
												</strong>
											</p>
											<botton class="mb-0">
												<c:if test="${row.Status.equals('Pending')}">
												<a href ="Confirmorder.jsp?Orderid=${row.OrderId}" class="btn btn-dark">
												Confirm
												</a>
												<br>
												<a href ="Cancelorder.jsp?Orderid=${row.OrderId}" class="btn btn-danger">
												Cancel
												</a>
												</c:if>
												<c:if test="${row.Status.equals('Accepted')}">
											<a href ="Prepareorder.jsp?Orderid=${row.OrderId}" class="btn btn-warning" >
												Prepare for Dispatch
											</a>
										</c:if>
										<c:if test="${row.Status.equals('Prepare for Dispatch')}">
											<a href ="Dispatchorder.jsp?Orderid=${row.OrderId}" class="btn btn-primary" >
												Dispatched
											</a>
											</c:if>
											<c:if test="${row.Status.equals('Dispatched')}">
											<a href ="Dispatchedorder.jsp?Orderid=${row.OrderId}" class="btn btn-success" >
												Out For Delivery</a>
												</c:if>
												<c:if test="${row.Status.equals('Out For Delivery')}">
											<a href ="Deliveredorder.jsp?Orderid=${row.OrderId}" class="btn btn-success" >
												Delivered</a>
												</c:if>
											</botton>
										
										</div>
										<div
											class="d-flex justify-content-between align-items-center mt-2">
											<p class="mb-0">
												<span>Amt:</span> <strong class="text-dark">&#x20B9;
													${row.TotalAmount}
												</strong>
											</p>
											<p class="mb-0">
											<c:if test="${row.Status.equals('Pending')}">
												<strong class="text-danger ">${row.Status}
												</strong>
												</c:if>
												<c:if test="${row.Status.equals('Accepted')}">
												<strong class="text-warning ">${row.Status}
												</strong>
												</c:if>
												<c:if test="${row.Status.equals('Prepare for Dispatch')}">
												<strong class="text-warning ">${row.Status}
												</strong>
												</c:if>
												<c:if test="${row.Status.equals('Dispatched')}">
												<strong class="text-warning ">${row.Status}
												</strong>
												</c:if>
												<c:if test="${row.Status.equals('Out For Delivery')}">
												<strong class="text-warning ">${row.Status}
												</strong>
												</c:if>
												<c:if test="${row.Status.equals('Delivered')}">
												<strong class="text-success ">${row.Status}
												</strong>
												</c:if>
										<c:if test="${row.Status.equals('Cancelled')}">
												<strong class="text-danger ">${row.Status}
												</strong>
												</c:if>
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
	</div>

	<div></div>
	<jsp:include page="inc/footer.jsp"></jsp:include>
</body>