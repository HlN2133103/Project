<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
<jsp:include page="inc/head.jsp"></jsp:include>
<jsp:include page="inc/header.jsp"></jsp:include>
<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/project"
					   user="root"
					   password="pass@123"
					   var="con"/>
					   
	<sql:query var="rs" dataSource="${con}">
		select * from products where Id=?
		<sql:param>${param.Id}</sql:param>
	</sql:query>
	<div class="breadcrumb-area mb-50">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb-container">
						<ul>
							<li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
							<li class="active">Products-Detail</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <c:forEach items="${rs.rows}" var="row">
    <div class="services">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <div>
              <img src="ImageServlet?id=${row.Id}" alt="" class="img-fluid wc-image">
            </div>
            <br>
          </div>

          <div class="col-md-5">
            <div class="sidebar-item recent-posts">
              <div class="sidebar-heading">
                <h4><c:out value="${row.Brand} ${row.Productname}"></c:out>
                </h4>
              </div>

              <div class="content">
                <p><c:out value="${row.description}"></c:out></p></div>
            </div>

            <br>
            <br>

            <form action="AddToCart" method="POST" >
              <div class="row">
                <div class="col-md-6 col-sm-12">
                  <div class="form-group">
                   
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6 col-sm-12">
                  <div class="form-group">
                    <label for="">Quantity</label>
                    <input type="number" value="1" name="quantity"  class="form-control">
                    <input type="text" value="${row.Id}" hidden name="Id">
                    <input type="text" value="${row.S_Price}" hidden name="Price">
                    <input type="text" value ="${row.Brand} ${row.Productname}" hidden name="pname">
                     <input type="text" value ="${row.Weight}" hidden name="pweight"></h4>
                  </div>
                  <label for="">MRP Price</label>
                  <p style="font-size:20px;"> Rs. ${row.MRP_Price}</p><br>
                  <label for="">Selling Price</label>
                  <p style="font-size:20px;"> Rs. ${row.S_Price}</p><br>
                </div>
                <div class="col-lg-12">
                  <div class="form-group">
                    
                  <button type="submit" class="btn btn-round btn-block" style="background:#a4c639;color: #fff;
                      font-size: 13px;
                      text-transform: uppercase;
                      font-weight: 700;
                      padding: 12px 30px;
                      border-radius: 30px;
                      display: inline-block;
                      transition: all 0.3s;">
                      Add to Cart</button>
                      </div>

        </form>

                <form action="pay" method="POST">
                  <div class="col-lg-12">
                  <div class="form-group">
                      <input type="text" value="" hidden name="pname">
                      <input type="text" value="" hidden name="brand">
                      <input type="text" value="" hidden name="Price">
                      <input type="text" value="" hidden name="name">
                      <input type="text" value="" hidden name="phone">
                      <input type="text" value="" hidden name="email">
                      
                     <button type="submit" class="btn btn-round btn-block" style="background:#a4c639;color: #fff;
                      font-size: 13px;
                      text-transform: uppercase;
                      font-weight: 700;
                      padding: 12px 30px;
                      border-radius: 30px;
                      display: inline-block;
                      transition: all 0.3s;">
                      Buy Now</button>
                </div></div>
        </form>
                    
                                       </div>
                </div>
              </div>
            </form>

            <br>
          </div>
        

        <br>
        <br>
        <br>
        <br>
        </div>
      </div>
    </div>
    </c:forEach>

    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>
<jsp:include page="inc/footer.jsp"></jsp:include>
  </body>
</html>