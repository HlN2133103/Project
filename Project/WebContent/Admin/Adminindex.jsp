<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>
</head>
<body>
<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/project"
					   user="root"
					   password="pass@123"
					   var="con"/>
					 
	<sql:query var="rs" dataSource="${con}">
		SELECT COUNT(OrderId) as Orders from ordertable where Status = 'Accepted'
		</sql:query>
		
		<sql:query var="rs1" dataSource="${con}">
		SELECT COUNT(OrderId) as Orders from ordertable where Status = 'Pending'
		</sql:query>
		
		<sql:query var="rs2" dataSource="${con}">
		SELECT COUNT(OrderId) as Orders from ordertable where Status = 'Cancelled'
		</sql:query>
		
		<sql:query var="rs3" dataSource="${con}">
		SELECT COUNT(OrderId) as Orders from ordertable where Status = 'Delivered'
		</sql:query>
		
		<sql:query var="rs4" dataSource="${con}">
		SELECT SUM(TotalAmount) as Price from ordertable where Status = 'Delivered'
		</sql:query>
		
		
        <div id="preloader">
            <div class="loader"></div>
        </div>

        <div id="main-wrapper">
 <jsp:include page="inc/head.jsp"></jsp:include>
  <jsp:include page="inc/header.jsp"></jsp:include>
   <jsp:include page="inc/sidebar.jsp"></jsp:include>
            <div class="content-body">

                <div class="container-fluid">

                        <div class="col-xl-3 text-left">
                           <h3 class="page-heading">Welcome</h3>
                           <!-- <h2 class="page-heading">Hi,Welcome Back!</h2> -->
                           <p class="mb-0">Admin</p>
                       </div>
                       <div class="col-xl-9 mt-3 mt-xl-0" style="display: none">
                        <div class="card mb-0">
                            <div class="card-body">
                                <h4 class="card-title">Track Order</h4>
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <input type="text" class="form-control" value="ORDER-84534598">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">Track</button>
                                            </div>
                                        </div>
                                        <span class="d-block mt-1">Your order is now preparing</span>
                                    </div>
                                    <div class="col-md-7 p-0 mt-3 mt-md-0">
                                        <div class="steps">
                                            <ul class="list-unstyled multi-steps">
                                                <li>Ordered</li>
                                                <li>Pending</li>
                                                <li class="is-active">Preparing</li>
                                                <li>Delivery</li>
                                                <li>Received</li>
                                            </ul>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>
              
                <div class="row">
                    <div class="col-xl-6 col-xxl-12">
                        <div class="row">
                        <c:forEach items="${rs.rows}" var="row">
                            <div class="col-sm-6 col-xxl-6 col-xl-6">
                                <div class="card">
                                  
                                    <div class="card-body pb-0">
                                        <div class="row justify-content-between">
                                            <div class="col-auto">
                                                <h4 class="text-muted mb-3">Accepted</h4>
                                            </div>      
                                        </div>
                                    </div>
                                    
                                    <div class="chart-wrapper">
                                        <div id="" class="home_chart_widget chart-one">
                                        <h3 align="center">
                                                ${row.Orders}
                                        </h3></div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            <c:forEach items="${rs1.rows}" var="row">
                            <div class="col-sm-6 col-xxl-6 col-xl-6">
                                <div class="card">
                                    <div class="card-body pb-0">
                                        <div class="row justify-content-between">
                                            <div class="col-auto">
                                                <h4 class="text-muted mb-3">Pending</h4>
                                            </div>
                                        
                                        </div>
                                        
                                    </div>
                                    <div class="chart-wrapper">
                                        <div id="" class="home_chart_widget chart-two">
                                        <h3 align="center">
                                                ${row.Orders}
                                        </h3>
                                        </div>
                                    </div>
                                </div>
                            </div>  
                            </c:forEach>
                            
                              <c:forEach items="${rs2.rows}" var="row">
                            <div class="col-sm-6 col-xxl-6 col-xl-6">
                                <div class="card">
                                    <div class="card-body pb-0">
                                        <div class="row justify-content-between">
                                            <div class="col-auto">
                                                <h4 class="text-muted mb-3">Cancel</h4>
                                            </div>
                                            <div class="col-auto">
                                                <h2></h2>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="chart-wrapper">
                                        <div id="" class="home_chart_widget chart-two">
                                         <h3 align="center">
                                                ${row.Orders}
                                        </h3></div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                              <c:forEach items="${rs3.rows}" var="row">
                            <div class="col-sm-6 col-xxl-6 col-xl-6">
                                <div class="card">
                                    <div class="card-body pb-0">
                                        <div class="row justify-content-between">
                                            <div class="col-auto">
                                                <h4 class="text-muted mb-3">Delivered</h4>
                                            </div>
                                            <div class="col-auto">
                                                <h2></h2>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="chart-wrapper">
                                        <div id="" class="home_chart_widget chart-two">
                                         <h3 align="center">
                                                ${row.Orders}
                                        </h3></div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                         <!-- <div class="col-sm-6 col-xxl-6 col-xl-6">
                                <div class="card">
                                    <div class="card-body pb-0">
                                        <div class="row justify-content-between">
                                            <div class="col-auto">
                                                <h4 class="text-muted mb-3">Weekly Revenue</h4>
                                            </div>
                                            <div class="col-auto">
                                                <h2><?php echo $data_week[price] ?></h2>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="chart-wrapper">
                                        <div id="" class="home_chart_widget chart-three"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xxl-6 col-xl-6">
                                <div class="card">
                                    <div class="card-body pb-0">
                                        <div class="row justify-content-between">
                                            <div class="col-auto">
                                                <h4 class="text-muted mb-3">Daily Revenue</h4>
                                            </div>
                                            <div class="col-auto">
                                                <h2><?php echo $data_today[price] ?></h2>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="chart-wrapper">
                                        <div id="" class="home_chart_widget chart-three"></div>
                                    </div>
                                </div>
                            </div>-->
                            
                        </div>
                        
                    </div>
                </div>
                
 </div>
 </div>

            <div class="footer">
                <div class="copyright">
                    <p>All rights reserved. &copy; 2020 <a target="_blank" href=""></a></p>
                </div>
            </div>
   <jsp:include page="inc/footer.jsp"></jsp:include>
</body>
</html>