<?php include('inc/head.php'); ?>
<?php include('admin/classes/db_config.php');

?>

<?php 

if (mysqli_connect_errno())
{
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
$all_order = "SELECT * FROM `orders_table` WHERE user_id = '$_SESSION[id]' AND status !='6'";  
$result_order = mysqli_query($connect, $all_order);  
while ($data = mysqli_fetch_array($result_order)) {
	$all_order_data[] = $data;
}  

$all_order_download = "SELECT * FROM `orders_table` WHERE user_id = '$_SESSION[id]' AND status='6'";  
$result_order_down = mysqli_query($connect, $all_order_download);  
while ($data_down = mysqli_fetch_array($result_order_down)) {
	$all_order_data_down[] = $data_down;
} 

$coup = "SELECT * FROM `coupons` WHERE status='1'";  
$coup_data = mysqli_query($connect, $coup);  
while ($coup_re = mysqli_fetch_array($coup_data)) {
	$coup_re_data[] = $coup_re;
}  

?>
<body>

	<!--=============================================
	=            Header         =
	=============================================-->
	<?php include('inc/header.php'); ?>

	<!--=====  End of Header  ======-->

    <!--=============================================
    =            breadcrumb area         =
    =============================================-->
    
    <div class="breadcrumb-area mb-50">
    	<div class="container">
    		<div class="row">
    			<div class="col">
    				<div class="breadcrumb-container">
    					<ul>
    						<li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
    						<li class="active">My Account</li>
    					</ul>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    
    <!--=====  End of breadcrumb area  ======-->

	<!--=============================================
	=            My account page section         =
	=============================================-->
	
	<div class="my-account-section section position-relative mb-50 fix">
		<div class="container">
			<div class="row">
				<div class="col-12">

					<?php 



					if(isset($_SESSION['msg_od_c'])):?>



						<div class="alert alert-info alert-dismissible fade show" role="alert">

							<?php echo $_SESSION['msg_od_c']; ?>

							<button type="button" class="close" data-dismiss="alert" aria-label="Close">

								<span aria-hidden="true">&times;</span>

							</button>

						</div>

					<?php endif; ?>

					<?php unset($_SESSION['msg_od_c']); ?>

					<div class="row">

						<!-- My Account Tab Menu Start -->
						<div class="col-lg-3 col-12">
							<div class="myaccount-tab-menu nav" role="tablist">
								<a href="#dashboad" class="active" data-toggle="tab"><i class="fa fa-dashboard"></i>
								Dashboard</a>

								<a href="#orders" data-toggle="tab"><i class="fa fa-cart-arrow-down"></i> Orders</a>

								<a href="#download" data-toggle="tab" id="download_page"><i class="fa fa-cloud-download"></i> Download</a>

								<a href="#coupon" data-toggle="tab"><i class="fa fa-cloud-download"></i> Coupon</a>

								<a href="#payment-method" data-toggle="tab" style="display: none;"><i class="fa fa-credit-card"></i> Payment
								Method</a>

								<a href="#address-edit" data-toggle="tab" style="display: none;"><i class="fa fa-map-marker"></i> address</a>

								<a href="#account-info" data-toggle="tab" style="display: none;"><i class="fa fa-user"></i> Account Details</a>

								<a href="logout.php"><i class="fa fa-sign-out"></i> Logout</a>
							</div>
						</div>
						<!-- My Account Tab Menu End -->

						<!-- My Account Tab Content Start -->
						<div class="col-lg-9 col-12">
							<div class="tab-content" id="myaccountContent">
								<!-- Single Tab Content Start -->
								<div class="tab-pane fade show active" id="dashboad" role="tabpanel">
									<div class="myaccount-content">
										<h3>Dashboard</h3>

										<div class="welcome">
											<p>Hello, <strong style="text-transform: capitalize;"><?php echo $_SESSION['head_name'] ?></strong> (If Not <strong>Tuntuni !</strong><a href="logout.php" class="logout"> Logout</a>)</p>
										</div>

										<p class="mb-0">From your account dashboard. you can easily check &amp; view your
										recent orders.</p>
									</div>
								</div>
								<!-- Single Tab Content End -->

								<!-- Single Tab Content Start -->
								<div class="tab-pane fade" id="orders" role="tabpanel">
									<div class="myaccount-content">
										<h3>Orders</h3>

										<div class="myaccount-table table-responsive text-center">
											<table class="table table-bordered">
												<thead class="thead-light">
													<tr>
														<th>No</th>
														<th>Order ID</th>
														<th>Date</th>
														<th>Status</th>
														<th>Total</th>
														<th>Payment mode(Selected)</th>
														<th>Action</th>
														<th></th>
													</tr>
												</thead>

												<tbody>
													<?php $i = 1; foreach ($all_order_data as  $all_order_data1) { ?>

														<tr id="row_<?php echo $all_order_data1[order_id]; ?>">
															<td><?php echo $i++; ?></td>
															<td><?php echo $all_order_data1[order_id]; ?></td>
															<td><?php echo $created_at_date =date("d-m-Y", strtotime($all_order_data1[created_at])); ?></td>
															<td id="t_<?php echo $all_order_data1[order_id]; ?>"><?php if($all_order_data1[status]=="0") {
																echo "<div class='badge badge-warning' id='panding'>Pending</div>";
															}elseif($all_order_data1[status]=="1") {
																echo "<div class='badge badge-warning' id='accept'>Pending</div>";
															}elseif($all_order_data1[status]=="2") {
																echo "<div class='badge badge-primary' id='preparing'>Preparing</div>";
															}elseif($all_order_data1[status]=="3") {
																echo "<div class='badge badge-info' id='ready'>Ready</div>";
															}elseif($all_order_data1[status]=="4") {
																echo "<div class='badge badge-danger' id='cancl'>Cancelled</div>";
															}else{
																echo "<div class='badge badge-success' id='deliver'>Pick Up</div";
															}  ?></td>
															<td><?php echo $all_order_data1[price]; ?></td>
															<td><?php echo $all_order_data1[pay_mode]; ?></td>
															<td><span class="btn"  data-toggle = "modal" data-target="#order_view_model"  id="order_view" oid="<?php echo $all_order_data1[order_id]; ?>">View</span></td>
															<?php if ($all_order_data1[status]=="1" OR $all_order_data1[status]=="2" ) { ?>
																<td id='cancel_<?php echo $all_order_data1[order_id]; ?>'><a href="cancel_order_form.php?od_ID=<?php echo $all_order_data1[order_id]; ?>"><span oid="">Cancel Order</span></a></td>
																
															<?php }else{ ?>
																<td id='na_<?php echo $all_order_data1[order_id]; ?>'>NA </td>
																
															<?php } ?>
														</tr>
													<?php 	}  ?>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!-- Single Tab Content End -->

								<!-- Single Tab Content Start -->
								<div class="tab-pane fade" id="download" role="tabpanel">
									<div class="myaccount-content">
										<h3>Delivered</h3>

										<div class="myaccount-table table-responsive text-center">
											<table class="table table-bordered" id="mytable">
												<thead class="thead-light">
													<tr>
														<th>Order ID</th>
														<th>Date</th>
														<th>Total</th>
														<th>Payment mode</th>
														<th>Action</th>
													</tr>
												</thead>

												<tbody>
													<?php  foreach ($all_order_data_down as  $all_order_data2) { ?>

														<tr>
															<td><?php echo $all_order_data2[order_id]; ?></td>
															<td><?php echo $created_at_date =date("d-m-Y", strtotime($all_order_data2[created_at])); ?></td>
															<td><?php echo $all_order_data2[price]; ?></td>
															<td><?php echo $all_order_data2[pay_mode]; ?></td>
															<td><span class="btn"><a target="_blank" href="order_download.php?export=<?php echo $all_order_data2[order_id]; ?>">Download file</a></span></td>
														</tr>
													<?php 	}  ?>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!-- Single Tab Content End -->

								<!-- Single Tab Content Start -->
								<div class="tab-pane fade" id="coupon" role="tabpanel">
									<div class="myaccount-content">
										<h3>Coupons</h3>

										<table class="table table-bordered">
											<thead class="thead-light">
												<tr>
													<th>No</th>
													<th>Name</th>
													<th>Code</th>
													<th>Amt</th>
												</tr>
											</thead>

											<tbody>
												<?php $i = 1; foreach ($coup_re_data as  $coup_re_data1) { ?>

													<tr>
														<td><?php echo $i++; ?></td>
														<td><?php echo $coup_re_data1[name]; ?></td>
														<td><?php echo $coup_re_data1[code]; ?></td>
														<td><?php echo $coup_re_data1[amt]; ?></td>
													</tr>
												<?php 	}  ?>
											</tbody>
										</table>
									</div>
								</div>
								<!-- Single Tab Content End -->
								<!-- Single Tab Content Start -->
								<div class="tab-pane fade" id="payment-method" role="tabpanel">
									<div class="myaccount-content">
										<h3>Payment Method</h3>

										<p class="saved-message">You Can't Saved Your Payment Method yet.</p>
									</div>
								</div>
								<!-- Single Tab Content End -->

								<!-- Single Tab Content Start -->
								<div class="tab-pane fade" id="address-edit" role="tabpanel">
									<div class="myaccount-content">
										<h3>Billing Address</h3>

										<address>
											<p><strong>Alex Tuntuni</strong></p>
											<p>1355 Market St, Suite 900 <br>
											San Francisco, CA 94103</p>
											<p>Mobile: (123) 456-7890</p>
										</address>

										<a href="#" class="btn d-inline-block edit-address-btn"><i class="fa fa-edit"></i>Edit Address</a>
									</div>
								</div>
								<!-- Single Tab Content End -->

								<!-- Single Tab Content Start -->
								<div class="tab-pane fade" id="account-info" role="tabpanel">
									<div class="myaccount-content">
										<h3>Account Details</h3>

										<div class="account-details-form">
											<form action="#">
												<div class="row">
													<div class="col-lg-6 col-12 mb-30">
														<input id="first-name" placeholder="First Name" type="text">
													</div>

													<div class="col-lg-6 col-12 mb-30">
														<input id="last-name" placeholder="Last Name" type="text">
													</div>

													<div class="col-12 mb-30">
														<input id="display-name" placeholder="Display Name" type="text">
													</div>

													<div class="col-12 mb-30">
														<input id="email" placeholder="Email Address" type="email">
													</div>

													<div class="col-12 mb-30"><h4>Password change</h4></div>

													<div class="col-12 mb-30">
														<input id="current-pwd" placeholder="Current Password" type="password">
													</div>

													<div class="col-lg-6 col-12 mb-30">
														<input id="new-pwd" placeholder="New Password" type="password">
													</div>

													<div class="col-lg-6 col-12 mb-30">
														<input id="confirm-pwd" placeholder="Confirm Password" type="password">
													</div>

													<div class="col-12">
														<button class="save-change-btn">Save Changes</button>
													</div>

												</div>
											</form>
										</div>
									</div>
								</div>
								<!-- Single Tab Content End -->
							</div>
						</div>
						<!-- My Account Tab Content End -->
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="modal fade order_view_model" id="order_view_model" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="card-title">Order ID: <span id="od_id" class="text-danger"></span> </h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="welcome p-2">
							<p>Name  <strong style="text-transform: capitalize;" id="name"></strong></p>
							<p>Address :<strong id="address"></strong></p>
							<p>Price :<strong id="price"></strong></p>
						</div>
						<div class="card-body">
							<h4 class="card-title">Order List</h4>
							<div class="table-responsive">
								<table class="table verticle-middle mb-0" id="all_pro">
									<thead>
										<tr>
											<th>Product Name</th>
											<th>Price</th>
											<th>QTY</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	
	<!--=====  End of My account page section  ======-->
	

	<!--=============================================
	=            Footer         =
	=============================================-->
	<?php include('inc/footer.php'); ?>
	<script type="text/javascript">
		$(".modal").on("hidden.bs.modal", function(){
			$("table#all_pro tbody").html("");
		});

		$(document).on('click', '#order_view', function(){  
			var oid_send = $(this).attr("oid");  
			var tr ="";
			var name ="";
			var address ="";
			var price ="";

			$.ajax({  
				url:"show_product_cart.php",  
				method:"POST",  
				data:{oid_send:oid_send},  
				dataType:"json",  
				success:function(data){  
                        // console.log(data);
                        $('#od_id').html(oid_send);
                        $.each(data, function(i, item) {

                        	tr ="";
                        	// console.log(item);
                        	$('#name').html(item.name);
                        	$('#address').html(item.address);
                        	$('#price').html(item.price);
                        	tr +='<tr><td>'+item.p_name+'</td><td>'+item.pprice+'</td><td>'+item.quantity+'</td></tr>';
                        	$("table#all_pro tbody ").append(tr);

                        })
                        // $("table#all_pro tbody ").append(tr);

                    }  
                });  
		});

		setInterval(function(){
			append_orders();
                // recent_chatting_append();
        // online_offline();
    },5000);


		function append_orders(){

			var user_id = "<?php echo $_SESSION[user_id]; ?>";

    // alert(user_id);
    $.ajax({
    	type: 'GET',
    	url: 'update_orders.php',
    	data:{user_id:user_id}, 
    	dataType: 'json',
    	cache: false,
    	success: function(response) {
    		$.each(response, function(i, item) {

    			$('#t_'+item.order_id+'').html('display','block');

    			if (item.status==0) {
    				$('#t_'+item.order_id+'').html("<div class='badge badge-warning'>Pending</div>");
    			}
    			if (item.status==1) {
    				$('#t_'+item.order_id+'').html("<div class='badge badge-warning'>Pending</div>");
    			}
    			if (item.status==2) {
    				$('#t_'+item.order_id+'').html("<div class='badge badge-primary'>Preparing</div>");
    			}
    			if (item.status==3) {
    				$('#t_'+item.order_id+'').html("<div class='badge badge-info'>Ready</div>");
    				$('#cancel_'+item.order_id+'').html("NA");
    			}
    			if (item.status==4) {
    				$('#t_'+item.order_id+'').html("<div class='badge badge-danger' >Cancelled</div>");
    			}
    			if (item.status==5) {
    				$('#t_'+item.order_id+'').html("<div class='badge badge-success'>Pick up</div>");
    			}
    			if (item.status==6) {
    				$('#row_'+item.order_id+'').remove();
    				
    			}



    		})


    	}
    });
}
 
</script>