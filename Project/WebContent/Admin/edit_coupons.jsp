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
		select * from coupons where Id = ?;
		<sql:param>
			<%= request.getParameter("id")%>
		</sql:param>
	 </sql:query>
        <div id="main-wrapper">
 <jsp:include page="inc/head.jsp"></jsp:include>
  <jsp:include page="inc/header.jsp"></jsp:include>
   <jsp:include page="inc/sidebar.jsp"></jsp:include>
            <div class="content-body">


                <div class="container-fluid">


                    <div class="row">
                       <div class="col-12">
                        <h3 class="content-heading">Add Coupons</h3>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
                                <c:forEach items="${rs.rows}" var="row">
                                    <form class="form-valide" action="Updatecoupons.jsp" method="post">
                                        <div class="row">
                                            <div class="col-xl-6">
                                              <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" class="form-control" name="coupon_name" value="${row.name}">
                                            </div>
                                        </div>
                                        <div class="col-xl-6">
                                          <div class="form-group">
                                            <label>Code</label>
                                            <input type="text" class="form-control" name="code" value="${row.code}">
                                        </div>
                                    </div> 
                                    <div class="col-xl-4">
                                      <div class="form-group">
                                        <label>Amount</label>
                                        <input type="text" class="form-control" name="amt" value="${row.amt}">
                                    </div>
                                </div>
                                <div class="col-xl-4">
                                  <div class="form-group">
                                    <label>Status</label>
                                    <select class="form-control" id="selcat" name="status" required>
                                        <option>${row.status}</option>
                                        <c:if test="${row.status.equals('Deactivate')}">
                                         <option value="Active">Active</option>
                                         </c:if>
                                         <c:if test="${row.status.equals('Active')}">
                                         <option value="Deactivate">Deactivate</option>
                                         </c:if>
                                         
                            </select>
                                </div>
                            </div>
							<input type="hidden" class="form-control" name="id" value="${row.id}">
                            <div class="col-xl-4">
                              <div class="form-group" style="float: right; margin-top: 40px;">
                                <button type="submit" class="btn btn-primary" name="submit">Update Coupon</button>
                            </div>
                        </div>

                    </div>
                </form>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

</div>
</div>
</div>
</div>
  <jsp:include page="inc/footer.jsp"></jsp:include>
</body>