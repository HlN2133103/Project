<?php include('inc/head.php'); ?>
<?php include('admin/classes/db_config.php'); ?>
<?php 


$cart_data_q = "SELECT c.*, p.p_name,p.price,(p.price * c.quantity) as total,p.image FROM cart c , product_details p WHERE c.product_id = p.id AND c.user_id = '$_SESSION[id]' AND order_id =''";
$re_cart = mysqli_query($connect, $cart_data_q);

// Fetch one and one row
$cart_data_arr = array();
$location_aa = array();
$coup_re_data = array();
while ($cart_data_f=mysqli_fetch_array($re_cart))
{
	$cart_data_arr[] = $cart_data_f;
}


$sub_total_q = "SELECT c.user_id,SUM(p.price * c.quantity) as sub_total FROM cart c , product_details p WHERE c.product_id = p.id AND c.user_id = '$_SESSION[id]' AND order_id =''";
$sub_r = mysqli_query($connect, $sub_total_q);
$sub_data=mysqli_fetch_array($sub_r);


$pack = "SELECT * FROM packaging";
$pack_r = mysqli_query($connect, $pack);
$pack_data=mysqli_fetch_array($pack_r);

$cash = "SELECT id,status,pay_mode,user_id,created_at FROM `orders_table` WHERE status = 4 AND user_id = '$_SESSION[id]'  ORDER BY created_at DESC LIMIT 1";
$cash_r = mysqli_query($connect, $cash);
$cash_data=mysqli_fetch_array($cash_r);

$location_q = "SELECT * FROM location ";
$loc_re = mysqli_query($connect, $location_q);
while($loc_re_data=mysqli_fetch_array($loc_re)){
	$location_aa[] =$loc_re_data;
}
$coup = "SELECT * FROM `coupons` WHERE status='1'";  
$coup_data = mysqli_query($connect, $coup);  
while ($coup_re = mysqli_fetch_array($coup_data)) {
	$coup_re_data[] = $coup_re;
} 
// echo "string";
// die; 
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
    						<li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
    						<li class="active">Checkout</li>
    					</ul>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    
    <!--=====  End of breadcrumb area  ======-->

	<!--=============================================
	=            Checkout page content         =
	=============================================-->
	
	<div class="page-section section mb-50">
		<div class="container">
			<div class="row">
				<div class="col-12">
					
					<!-- Checkout Form s-->
					<form action="payment_page.php" class="checkout-form" method="POST">
						<div class="row row-40">
							
							<div class="col-lg-7 mb-20">
								
								<!-- Billing Address -->
								<div id="billing-form" class="mb-40">
									<h4 class="checkout-title">Billing Address</h4>

									<div class="row">

										<div class="col-md-6 col-12 mb-20">
											<label>First Name*</label>
											<input type="text" name="fname" placeholder="First Name" required>
										</div>

										<div class="col-md-6 col-12 mb-20">
											<label>Last Name*</label>
											<input type="text" name="lname" placeholder="Last Name" required>
										</div>

										<div class="col-md-6 col-12 mb-20">
											<label>Email Address*</label>
											<input type="email" name="email" placeholder="Email Address" required>
										</div>

										<div class="col-md-6 col-12 mb-20">
											<label>Phone no*</label>
											<input type="text" name="phone" placeholder="Phone number" required>
										</div>

										<div class="col-md-12 col-12 mb-20">
											<label>Company Name</label>
											<input type="text" name="cname" placeholder="Company Name">
										</div>
										

										<div class="col-12 mb-20">
											<label>Address*</label>
											<input type="text" name="address1" placeholder="Address line 1" required>
											<input type="text" name="address2" placeholder="Address line 2">
										</div>

										<div class="col-md-6 col-12 mb-20">
											<label>Country*</label>
											<select class="nice-select" name="country" required>
												<option>Bangladesh</option>
												<option>China</option>
												<option>country</option>
												<option>India</option>
												<option>Japan</option>
											</select>
										</div>

										<div class="col-md-6 col-12 mb-20">
											<label>Town/City*</label>
											<input type="text" name="city" placeholder="Town/City" required>
										</div>

										<div class="col-md-6 col-12 mb-20">
											<label>State*</label>
											<input type="text" name="state" placeholder="State" required>
										</div>
										<div class="col-md-6 col-12 mb-20">
											<label>Pin*</label>
											<select class="nice-select" name="pincode" required>
												<option value=" ">Select Pin</option>
												<?php foreach ($location_aa as $loc_data) { ?>
													<option value="<?php echo $loc_data['loc_name']  ?>"><?php echo $loc_data['loc_name'];  ?></option>
												<?php } ?>
											</select>

										</div>
										<div class="col-md-12 col-12 mb-20">
											<label>Add Cooking instructions(optional)</label>
											<textarea type="text" class="checkout-form" name="note" placeholder="Write here..." style="width: 95%"></textarea>
										</div>

									</div>

								</div>
								
								<!-- Shipping Address -->

							</div>
							
							<div class="col-lg-5">
								<div class="row">
									
									<!-- Cart Total -->
									<div class="col-12 mb-60">

										<h4 class="checkout-title">Cart Total</h4>

										<div class="checkout-cart-total">

											<h4>Product <span>Total</span></h4>
											
											<ul>
												<?php foreach($cart_data_arr as $cart_data){?>
													<li><?php echo $cart_data['p_name']; ?> X <?php echo $cart_data['quantity'];?> <span> &#x20B9; <?php echo $cart_data['price']; ?> </span></li>
												<?php } ?>
												
											</ul>
											<?php if ($sub_data['sub_total']!="") { ?>
												
												<p>Sub Total <span> &#x20B9; <?php echo $sub_data['sub_total']; ?>.00</span></p>
												<p>Packaging charge <span>&#x20B9;<?php echo $pack_data['charge']; ?>.00</span></p>
												<!-- <p>Shipping Fee <span>&#x20B9;00.00</span></p> -->
												<p id='dis_price'>Discount <span>&#x20B9;00.00</p>

													<h4 id="g_total">Grand Total <span> &#x20B9; <?php echo $g_total = $sub_data['sub_total']+ $pack_data['charge']; ?>.00</span></h4>
													<input type="hidden" name="total_price" id="total_price" value="<?php echo $g_total; ?>">
													<input type="hidden" name="discount" id="discount">
													<input type="hidden" name="packaging" id="packaging" value="<?php echo $pack_data['charge']; ?>">
												<?php } ?>

												<!-- <h4 style="margin-top: 20px;">Coupon <span><button class="btn btn-success">Apply</button></span></h4> -->

											</div>
											<div class="discount-coupon mt-2">
												<!--    <h4>Discount Coupon Code</h4> -->

												<div class="row">
													<div class="col-md-6 col-12 mb-25">
														<input type="text" name="coupon_code" id="coupon_code" placeholder="Coupon Code">
													</div>
													<div class="col-md-6 col-12 mb-25">
														<button class="place-order" style="margin-top: 0px;float: right;height: 45px;" id="Apply_coupon">Apply Code</button>
														<!-- <span value="Apply Code"> -->
														</div>
													</div>

													<div class="checkout-cart-total">

														<h4>Coupon <span>Code</span></h4>

														<ul>
															<?php  foreach ($coup_re_data as  $coup_re_data1) {?>
																<li><?php echo $coup_re_data1['code']; ?> <span> &#x20B9; <?php echo $coup_re_data1['amt']; ?> </span></li>
															<?php } ?>

														</ul>
													</div>

												</div>



											</div>

											<!-- Payment Method -->
											<div class="col-12">

												<h4 class="checkout-title">Payment Method</h4>

												<div class="checkout-payment-method">

													<?php if ($cash_data['pay_mode']!='cash') { ?>

														<div class="single-method">
															<input type="radio" id="payment_cash" name="payment_method" value="cash" required>
															<label for="payment_cash">Cash on Delivery</label>
															<!-- <p data-method="cash">Please send a Check to Store name with Store Street, Store Town, Store State, Store Postcode, Store Country.</p> -->
														</div>
													<?php	} ?>


													<div class="single-method">
														<input type="radio" id="payment_payoneer" name="payment_method" value="online" >
														<label for="payment_payoneer">Online</label>
														<!-- <p data-method="payoneer">Please send a Check to Store name with Store Street, Store Town, Store State, Store Postcode, Store Country.</p> -->
													</div>

													<div class="single-method">
														<input type="checkbox" id="accept_terms" required>
														<label for="accept_terms">I’ve read and accept the terms & conditions</label>
													</div>

												</div>
												<?php if ($sub_data['sub_total'] < 1000) {
													echo "<h3 style='color:red;margin-top:10px;'>More then 1000 Order should Palaced</h3>";
												}else{ ?>
													<button class="place-order" id="accept_terms_s">Place order</button>
												<?php } ?>

											</div>

										</div>
									</div>

								</div>
							</form>

						</div>
					</div>
				</div>
			</div>

			<!--=====  End of Checkout page content  ======-->


	<!--=============================================
	=            Footer         =
	=============================================-->
	<?php include('inc/footer.php'); ?>
	<script type="text/javascript">
		$('#accept_terms_s').click(function() {
			if(!$('#accept_terms').is(':checked'))
				alert('Place accept terms and conditions');
		});
		$(document).on('click', '#Apply_coupon', function(){  
			var coupon_code = $('#coupon_code').val(); 
			var total ="<?php echo $g_total ?>";
			var price=0,price1=0,price2=0;

			if (coupon_code !='') {
				$.ajax({  
					url:"coupon.php",  
					method:"POST",  
					data:{coupon_code:coupon_code},  
					dataType:"json",  
					success:function(data){  
						console.log(data);
						price1 =data.amt;
						price =  total - price1;
						$('#dis_price').html("Discount <span>&#x20B9;"+price1+".00</span>");
						$('#g_total').html("Grand Total <span>&#x20B9;"+price+".00</span>");
						$('#total_price').val(price);
						$('#discount').val(price1);
						

                     // alert(price); 
                    // location.reload(true);  
                }  
            });  
			}else{
				$('#coupon_code').prop('required', true);
			}

		});
	</script>