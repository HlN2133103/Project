 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <html>
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
                        <h3 class="content-heading">Add Product</h3>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
                                    <form class="form-valide" action="../AddProducts" method="post" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-xl-12">
                                              <div class="form-group">
                                                <label>Product Name</label>
                                                <input type="text" class="form-control" name="pname" required>
                                            </div>
                                        </div>

                                        <div class="col-xl-12">
                                          <div class="form-group">
                                            <label>Brand</label>
                                                <input type="text" class="form-control" name="brand" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                      <div class="form-group">
                                          <label>MRP Price</label>
                                          <input type="text" class="form-control"  name="mrp_price" required>
                                      </div>
                                  </div>
                                  <div class="col-xl-4">
                                      <div class="form-group">
                                          <label>Cost Price</label>
                                          <input type="text" class="form-control"  name="c_price" required>
                                      </div>
                                  </div>
                                  <div class="col-xl-4">
                                      <div class="form-group">
                                          <label>Selling Price</label>
                                          <input type="text" class="form-control"  name="s_price" required>
                                      </div>
                                  </div>
                                  <div class="col-xl-12">
                                      <div class="form-group">
                                          <label>Image</label>
                                          <input type="file" class="form-control" name="f_image" required>
                                      </div>
                                  </div>
                                  <div class="col-xl-6">
                                      <div class="form-group">
                                        <label>Quantity</label>
                                        <input type="number" class="form-control"  name="quantity" required>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                  <div class="form-group">
                                    <label>Weight</label>
									<input type="text" class="form-control"  name="weight" required>
                                </div>
                            </div>
                            
                        <div class="col-xl-12">
                          <div class="form-group">
                            <label>Description</label>
                            <textarea class="form-control " name="description" ></textarea>
                        </div>
                    </div>
                    <div class="col-xl-4">
                    </div>
                    <div class="col-xl-4">
                    <div class="form-group">
                    <button type="submit" class="btn btn-success">Add Product</button>
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




            <div class="footer">
                <div class="copyright">
                    <p>All rights reserved. &copy; 2020 <a target="_blank" href=""></a></p>
                </div>
            </div>


        </div>

<jsp:include page="inc/footer.jsp"></jsp:include>
        <script type="text/javascript">
            $(document).ready(function(){
                $('.action').change(function(){
                    if($(this).val() != '')
                    {
                        var action = $(this).attr("id");
                        var query = $(this).val();
                        var result = '';
                        if(action == "selcat")
                        {
                            result = 'selvariant';
                        }
                        $.ajax({
                            url:"drop_select.php",
                            method:"POST",
                            data:{action:action, query:query},
                            success:function(data){
                                $('#'+result).html(data);
                            }
                        })
                    }
                });
            });
        </script>
