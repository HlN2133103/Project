<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<body>

        <div id="main-wrapper">
 <jsp:include page="inc/head.jsp"></jsp:include>
  <jsp:include page="inc/header.jsp"></jsp:include>
   <jsp:include page="inc/sidebar.jsp"></jsp:include>
            <div class="content-body">

                <!-- row -->

                <div class="container-fluid">


                    <div class="row">
                       <div class="col-12">
                        <h3 class="content-heading">Add Coupons</h3>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
                                    <form class="form-valide" action="back_coupon.jsp" method="post">
                                        <div class="row">
                                            <div class="col-xl-6">
                                              <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" class="form-control" name="coupon_name">
                                            </div>
                                        </div>
                                        <div class="col-xl-6">
                                          <div class="form-group">
                                            <label>Code</label>
                                            <input type="text" class="form-control" name="code">
                                        </div>
                                    </div> 
                                    <div class="col-xl-4">
                                      <div class="form-group">
                                        <label>Amount</label>
                                        <input type="text" class="form-control" name="amt">
                                    </div>
                                </div>
                                <div class="col-xl-4">
                                  <div class="form-group">
                                    <label>Status</label>
                                    <select class="form-control" id="selcat" name="status" required>
                                        <option value="">Select status</option>
                                        <option value="Deactivate">Deactivate</option>
                                       	<option value="Active">Active</option>
                                    </select>
                                </div>
                            </div>


                            <div class="col-xl-4">
                              <div class="form-group" style="float: right; margin-top: 40px;">
                                <button type="submit" class="btn btn-primary" name="submit">Add Coupon</button>
                            </div>
                        </div>

                    </div>
                </form>
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