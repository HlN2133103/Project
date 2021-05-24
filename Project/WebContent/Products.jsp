<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/owl.css">
  </head>

  <body>
<jsp:include page="inc/head.jsp"></jsp:include>
<jsp:include page="inc/header.jsp"></jsp:include>
        <sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/project"
					   user="root"
					   password="pass@123"
					   var="con"/>
				
		<sql:query var="rs" dataSource="${con}">
		select * from products where Status='Available';
	 </sql:query>
			
		
<c:if test="${param.p_name != null}">							 
	<sql:query var="rs" dataSource="${con}">
		select * from products where Productname LIKE ? OR Brand LIKE ?
		<sql:param>${param.p_name}%</sql:param>
		<sql:param>%${param.p_name}%</sql:param>
	 </sql:query>	   
	</c:if>
	 <div class="breadcrumb-area mb-50">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb-container">
						<ul>
							<li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
							<li class="active">Products</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
        <div class="services">
        <div class="container">
        <div class="row">
     <c:forEach items="${rs.rows}" var="row">
        <div class="col-md-4">
            <div class="service-item">
             <a href="product-details.jsp?Id=${row.Id}"> <img src="ImageServlet?id=${row.Id}" style="height:250px; width:300px;" class="img-responsive"/></a>
              <div class="down-content">
                <h4> ${row.Brand} ${row.Productname}</h4>
                <div style="margin-bottom:10px;">
                  <span style="font-size:20px;">
                    MRP: ${row.MRP_Price}
                  </span>
                  <br>
                  <span style="font-size:20px;">
                    Cost Price : ${row.S_Price}
                  </span>
                  <br>
                 <span style="font-size:20px;">
                    Margin: ${row.Margin}%
                  </span>
                  </div>
    
              </div>
            </div>
            <br>
        </div>
        </c:forEach>
      </div>
          
         

        <br>
        <br>
        <br>
        <br>
    </div>
</div>

   
<jsp:include page="inc/footer.jsp"></jsp:include>
  </body>
</html>

