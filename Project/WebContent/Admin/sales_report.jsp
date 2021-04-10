<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!--<?php 

if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$sql1 = "SELECT o.order_id,o.created_at, 
p.p_name, c.quantity, p.price 
FROM orders_table o 
JOIN cart c ON o.order_id = c.order_id 
JOIN product_details p ON p.id = c.product_id
ORDER BY o.order_id";
$result = mysqli_query($connect, $sql1);
// Fetch one and one row
$report = array();
while ($row=mysqli_fetch_array($result))
{
    $report[] = $row;
}

?>
-->
<body>
  <jsp:include page="inc/head.jsp"></jsp:include>
<div id="main-wrapper">
 	
 	<jsp:include page="inc/header.jsp"></jsp:include>
    <jsp:include page="inc/sidebar.jsp"></jsp:include>
                  
                   <div class="content-body">

                <div class="container-fluid">

                    <div class="row">
                        <div class="col-12">
                            <h3 class="content-heading">Sales Report</h3>
                        </div>
                        <div class="col-12">

                            <?php 
                            if(isset($_SESSION['data_notfound'])):?>



                                <div class="alert alert-info alert-dismissible fade show" role="alert">

                                    <?php echo $_SESSION['data_notfound']; ?>

                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">

                                        <span aria-hidden="true">&times;</span>

                                    </button>

                                </div>

                            <?php endif; ?>

                            <?php unset($_SESSION['data_notfound']); ?>
                            <div class="card-footer d-flex justify-content-between align-items-center">
                                <div class="vertical-card__menu--location">
                                    <div class="d-block">
                                     Sales Report
                                 </div>
                             </div>
                             <div class="vertical-card__menu--button">
                                <button class="btn btn-primary add_btn" data-toggle="modal" data-target="#myModal">Export</button>
                            </div>
                        </div>

                        <!-- Modal -->
                        <div id="myModal" class="modal fade" role="dialog">
                          <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>

                            </div>
                            <div class="modal-body">
                              <form action="daily_sale.php" method="post">
                                  <div class="row">

                                    <div class="col">
                                      <input type="date" class="form-control" name="sdate" placeholder="Start Date" required>
                                  </div>
                                  <div class="col">
                                      <input type="date" class="form-control" name="edate" placeholder="End Date" required>
                                  </div>
                                  <div class="col">
                                    <select class="form-control" name="exp_type" required>
                                        <option value="">Report Type</option>
                                        <option value="1">Overall Sales</option>
                                        <option value="2">Product wise sales</option>
                                    </select>
                                </div>
                                <div class="col">
                                 <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                             </div>
                         </div>
                     </form>
                 </div>
                 <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

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
                            <th>Order Id</th>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Created Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($report as $report_data){?>
                            <tr>
                                <td><?php echo $report_data[order_id] ?></td>
                                <td><?php echo $report_data[p_name] ?></td>
                                <td><?php echo $report_data[quantity] ?></td>
                                <td><?php echo $report_data[price] ?></td>
                                <td><?php echo $report_data =date("d-m-Y", strtotime($report_data[created_at])); ?></td>
                            </td>
                        </tr>
                    <?php }  ?>

                </tbody>
                <tfoot>
                    <tr>
                       <th>Order Id</th>
                       <th>Product</th>
                       <th>Quantity</th>
                       <th>Price</th>
                       <th>Created Date</th>
                   </tr>
               </tfoot>
           </table>
       </div>
   </div>
</div>
</div>

</div>
</div>
</div>
        <!--**********************************
            Content body end
            ***********************************-->


        <!--**********************************
            Footer start
            ***********************************-->
            <div class="footer">
                <div class="copyright">
                    <p>All rights reserved. &copy; 2020 <a target="_blank" href="http://jkitsolution.co.in/">jkitsolution.co.in</a></p>
                </div>
            </div>
        <!--**********************************
            Footer end
            ***********************************-->


        <!--**********************************
            Right sidebar start
            ***********************************-->
            <div class="sidebar-right">
                <a class="sidebar-right-trigger gradient-5-x" href="javascript:void(0)">
                    <span><i class="fa fa-cog fa-spin"></i></span>
                </a>
                <div class="sidebar-right-inner">
                    <div class="admin-settings">
                        <h4>Pick your style</h4>
                        <div>
                            <p>Background</p>
                            <select class="form-control" name="theme_version" id="theme_version">
                                <option value="light">Light</option>
                                <option value="dark">Dark</option>
                            </select>
                        </div>
                        <div>
                            <p>Layout</p>
                            <select class="form-control" name="theme_layout" id="theme_layout">
                                <option value="vertical">Vertical</option>
                                <option value="horizontal">Horizontal</option>
                            </select>
                        </div>
                        <div>
                            <p>Sidebar</p>
                            <select class="form-control" name="sidebar_style" id="sidebar_style">
                                <option value="full">Full</option>
                                <option value="mini">Mini</option>
                                <option value="compact">Compact</option>
                                <option value="overlay">Overlay</option>
                            </select>
                        </div>
                        <div>
                            <p>Sidebar position</p>
                            <select class="form-control" name="sidebar_position" id="sidebar_position">
                                <option value="static">Static</option>
                                <option value="fixed">Fixed</option>
                            </select>
                        </div>
                        <div>
                            <p>Header position</p>
                            <select class="form-control" name="header_position" id="header_position">
                                <option value="static">Static</option>
                                <option value="fixed">Fixed</option>
                            </select>
                        </div>
                        <div>
                            <p>Container</p>
                            <select class="form-control" name="container_layout" id="container_layout">
                                <option value="wide">Wide</option>
                                <option value="boxed">Boxed</option>
                                <option value="wide-boxed">Wide Boxed</option>
                            </select>
                        </div>
                        <div>
                            <p>Direction</p>
                            <select class="form-control" name="theme_direction" id="theme_direction">
                                <option value="ltr">LTR</option>
                                <option value="rtl">RTL</option>
                            </select>
                        </div>
                        <div>
                            <p>Navigation Header</p>
                            <div>
                                <span>
                                    <input type="radio" name="navigation_header" value="color_1" class="filled-in chk-col-primary" id="nav_header_bg_1">
                                    <label for="nav_header_bg_1"></label>
                                </span>
                                <span>
                                    <input type="radio" name="navigation_header" value="color_2" class="filled-in chk-col-primary" id="nav_header_bg_2">
                                    <label for="nav_header_bg_2"></label>
                                </span>
                                <span>
                                    <input type="radio" name="navigation_header" value="color_3" class="filled-in chk-col-primary" id="nav_header_bg_3">
                                    <label for="nav_header_bg_3"></label>
                                </span>
                                <span>
                                    <input type="radio" name="navigation_header" value="color_4" class="filled-in chk-col-primary" id="nav_header_bg_4">
                                    <label for="nav_header_bg_4"></label>
                                </span>
                                <span>
                                    <input type="radio" name="navigation_header" value="color_5" class="filled-in chk-col-primary" id="nav_header_bg_5">
                                    <label for="nav_header_bg_5"></label>
                                </span>
                                <span>
                                    <input type="radio" name="navigation_header" value="color_6" class="filled-in chk-col-primary" id="nav_header_bg_6">
                                    <label for="nav_header_bg_6"></label>
                                </span>
                                <span>
                                    <input type="radio" name="navigation_header" value="color_7" class="filled-in chk-col-primary" id="nav_header_bg_7">
                                    <label for="nav_header_bg_7"></label>
                                </span>
                                <span>
                                    <input type="radio" name="navigation_header" value="color_8" class="filled-in chk-col-primary" id="nav_header_bg_8">
                                    <label for="nav_header_bg_8"></label>
                                </span>
                                <span>
                                    <input type="radio" name="navigation_header" value="color_9" class="filled-in chk-col-primary" id="nav_header_bg_9">
                                    <label for="nav_header_bg_9"></label>
                                </span>
                                <span>
                                    <input type="radio" name="navigation_header" value="color_10" class="filled-in chk-col-primary" id="nav_header_bg_10">
                                    <label for="nav_header_bg_10"></label>
                                </span>
                            </div>
                        </div>
                        <div>
                            <p>Header</p>
                            <div>
                                <span>
                                    <input type="radio" name="header_bg" value="color_1" class="filled-in chk-col-primary" id="header_bg_1">
                                    <label for="header_bg_1"></label>
                                </span>
                                <span>
                                    <input type="radio" name="header_bg" value="color_2" class="filled-in chk-col-primary" id="header_bg_2">
                                    <label for="header_bg_2"></label>
                                </span>
                                <span>
                                    <input type="radio" name="header_bg" value="color_3" class="filled-in chk-col-primary" id="header_bg_3">
                                    <label for="header_bg_3"></label>
                                </span>
                                <span>
                                    <input type="radio" name="header_bg" value="color_4" class="filled-in chk-col-primary" id="header_bg_4">
                                    <label for="header_bg_4"></label>
                                </span>
                                <span>
                                    <input type="radio" name="header_bg" value="color_5" class="filled-in chk-col-primary" id="header_bg_5">
                                    <label for="header_bg_5"></label>
                                </span>
                                <span>
                                    <input type="radio" name="header_bg" value="color_6" class="filled-in chk-col-primary" id="header_bg_6">
                                    <label for="header_bg_6"></label>
                                </span>
                                <span>
                                    <input type="radio" name="header_bg" value="color_7" class="filled-in chk-col-primary" id="header_bg_7">
                                    <label for="header_bg_7"></label>
                                </span>
                                <span>
                                    <input type="radio" name="header_bg" value="color_8" class="filled-in chk-col-primary" id="header_bg_8">
                                    <label for="header_bg_8"></label>
                                </span>
                                <span>
                                    <input type="radio" name="header_bg" value="color_9" class="filled-in chk-col-primary" id="header_bg_9">
                                    <label for="header_bg_9"></label>
                                </span>
                                <span>
                                    <input type="radio" name="header_bg" value="color_10" class="filled-in chk-col-primary" id="header_bg_10">
                                    <label for="header_bg_10"></label>
                                </span>
                            </div>
                        </div>
                        <div>
                            <p>Sidebar</p>
                            <div>
                                <span>
                                    <input type="radio" name="sidebar_bg" value="color_1" class="filled-in chk-col-primary" id="sidebar_bg_1">
                                    <label for="sidebar_bg_1"></label>
                                </span>
                                <span>
                                    <input type="radio" name="sidebar_bg" value="color_2" class="filled-in chk-col-primary" id="sidebar_bg_2">
                                    <label for="sidebar_bg_2"></label>
                                </span>
                                <span>
                                    <input type="radio" name="sidebar_bg" value="color_3" class="filled-in chk-col-primary" id="sidebar_bg_3">
                                    <label for="sidebar_bg_3"></label>
                                </span>
                                <span>
                                    <input type="radio" name="sidebar_bg" value="color_4" class="filled-in chk-col-primary" id="sidebar_bg_4">
                                    <label for="sidebar_bg_4"></label>
                                </span>
                                <span>
                                    <input type="radio" name="sidebar_bg" value="color_5" class="filled-in chk-col-primary" id="sidebar_bg_5">
                                    <label for="sidebar_bg_5"></label>
                                </span>
                                <span>
                                    <input type="radio" name="sidebar_bg" value="color_6" class="filled-in chk-col-primary" id="sidebar_bg_6">
                                    <label for="sidebar_bg_6"></label>
                                </span>
                                <span>
                                    <input type="radio" name="sidebar_bg" value="color_7" class="filled-in chk-col-primary" id="sidebar_bg_7">
                                    <label for="sidebar_bg_7"></label>
                                </span>
                                <span>
                                    <input type="radio" name="sidebar_bg" value="color_8" class="filled-in chk-col-primary" id="sidebar_bg_8">
                                    <label for="sidebar_bg_8"></label>
                                </span>
                                <span>
                                    <input type="radio" name="sidebar_bg" value="color_9" class="filled-in chk-col-primary" id="sidebar_bg_9">
                                    <label for="sidebar_bg_9"></label>
                                </span>
                                <span>
                                    <input type="radio" name="sidebar_bg" value="color_10" class="filled-in chk-col-primary" id="sidebar_bg_10">
                                    <label for="sidebar_bg_10"></label>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <!--**********************************
            Right sidebar end
            ***********************************-->
        </div>
    <!--**********************************
        Main wrapper end
        ***********************************-->

        <?php include('inc/footer.php'); ?>