<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>
</head>
<body>

        <div id="preloader">
            <div class="loader"></div>
        </div>

        <div id="main-wrapper">
 <jsp:include page="inc/head.jsp"></jsp:include>
  <jsp:include page="inc/header.jsp"></jsp:include>
   <jsp:include page="inc/sidebar.jsp"></jsp:include>
            <div class="content-body">

                <div class="container-fluid">
                    <div class="row justify-content-between mb-4 align-items-center mt-3">
                        <?php 



                        if(isset($_SESSION['login_success'])):?>



                            <div class="alert alert-info alert-dismissible fade show" role="alert">

                                <?php echo $_SESSION['login_success']; ?>

                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">

                                    <span aria-hidden="true">&times;</span>

                                </button>

                            </div>

                        <?php endif; ?>

                        <?php unset($_SESSION['login_success']); ?>


                        <div class="col-xl-3 text-left">
                           <h3 class="page-heading">Welcome <?php  if(!empty($_SESSION['head_name'])){ echo $_SESSION['head_name']; }else{ echo "Null";}?>!</h3>
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
                            <div class="col-sm-6 col-xxl-6 col-xl-6">
                                <div class="card">
                                    <div class="card-body pb-0">
                                        <div class="row justify-content-between">
                                            <div class="col-auto">
                                                <h4 class="text-muted mb-3">Accepted</h4>
                                            </div>
                                            <div class="col-auto">
                                                <h2><?php echo $data[count_o_a] ?></h2>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="chart-wrapper">
                                        <div id="" class="home_chart_widget chart-one"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xxl-6 col-xl-6">
                                <div class="card">
                                    <div class="card-body pb-0">
                                        <div class="row justify-content-between">
                                            <div class="col-auto">
                                                <h4 class="text-muted mb-3">Pending</h4>
                                            </div>
                                            <div class="col-auto">
                                                <h2><?php echo $data_p[count_o_p] ?></h2>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="chart-wrapper">
                                        <div id="" class="home_chart_widget chart-two"></div>
                                    </div>
                                </div>
                            </div>  <div class="col-sm-6 col-xxl-6 col-xl-6">
                                <div class="card">
                                    <div class="card-body pb-0">
                                        <div class="row justify-content-between">
                                            <div class="col-auto">
                                                <h4 class="text-muted mb-3">Cancel</h4>
                                            </div>
                                            <div class="col-auto">
                                                <h2><?php echo $data_c[count_o_c] ?></h2>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="chart-wrapper">
                                        <div id="" class="home_chart_widget chart-two"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xxl-6 col-xl-6">
                                <div class="card">
                                    <div class="card-body pb-0">
                                        <div class="row justify-content-between">
                                            <div class="col-auto">
                                                <h4 class="text-muted mb-3">Delivered</h4>
                                            </div>
                                            <div class="col-auto">
                                                <h2><?php echo $data_d[count_o_d] ?></h2>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="chart-wrapper">
                                        <div id="" class="home_chart_widget chart-two"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xxl-6 col-xl-6">
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
                            </div>
                            
                        </div>
                        
                    </div>
                </div>
 </div>
 </div>
 </div>
            <div class="footer">
                <div class="copyright">
                    <p>All rights reserved. &copy; 2020 <a target="_blank" href="http://jkitsolution.co.in/">jkitsolution.co.in</a></p>
                </div>
            </div>
   <jsp:include page="inc/footer.jsp"></jsp:include>
</body>
</html>