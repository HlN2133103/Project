<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Categories</title>
  </head>
  <body>
  <jsp:include page="inc/head.jsp"></jsp:include>

       <div id="main-wrapper">
         <jsp:include page="inc/header.jsp"></jsp:include>
   <jsp:include page="inc/sidebar.jsp"></jsp:include>
            <div class="content-body">
                <div class="container-fluid">


                    <div class="row">
                        <div class="col-12">
                            <h3 class="content-heading">Products</h3>
                        </div>
                        <div class="col-12">
                            <div class="card-footer d-flex justify-content-between align-items-center">
                                <div class="vertical-card__menu--location">
                                    <div class="d-block">
                                        All Products
                                    </div>
                                </div>
                                <div class="vertical-card__menu--button">
                                    <a href="add_category.php"><button class="btn btn-primary add_btn" data-id="109">Add Category</button></a>
                                </div>
                            </div>
                            <div class="card">

                                <?php 



                                if(isset($_SESSION['cat_msg'])):?>



                                    <div class="alert alert-info alert-dismissible fade show" role="alert">

                                        <?php echo $_SESSION['cat_msg']; ?>

                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">

                                            <span aria-hidden="true">&times;</span>

                                        </button>

                                    </div>

                                <?php endif; ?>

                                <?php unset($_SESSION['cat_msg']); ?>
                                <?php 



                                if(isset($_SESSION['statusMsg'])):?>



                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">

                                        <?php echo $_SESSION['statusMsg']; ?>

                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">

                                            <span aria-hidden="true">&times;</span>

                                        </button>

                                    </div>

                                <?php endif; ?>

                                <?php unset($_SESSION['statusMsg']); ?>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="example" class="display" style="min-width: 845px">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Sku</th>
                                                    <th>Created Date</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach($categories as $categories_data){?>
                                                    <tr>
                                                        <td><?php echo $categories_data[cat_name] ?></td>
                                                        <td><?php echo $categories_data[cat_sku] ?></td>
                                                        <td><?php echo $created_at_date =date("d-m-Y", strtotime($categories_data[created_at])); ?></td>
                                                  
                                                    <td><span><a href="add_category.php?id=<?php echo $categories_data[id] ?>" class="mr-4" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"><i class="fa fa-pencil color-muted"></i> </a><i class="fa fa-close color-danger"></i></span>
                                                    </td>
                                                </tr>
                                            <?php }  ?>

                                        </tbody>
                                       
                                    </table>
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
</html>
