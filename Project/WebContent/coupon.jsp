<?php include('admin/classes/db_config.php');

?>

<?php 

if (mysqli_connect_errno())
{
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
}


if(isset($_POST["coupon_code"]))  
{  

	 $query = "SELECT * FROM `coupons` WHERE code ='$_POST[coupon_code]'";  
	$result = mysqli_query($connect, $query);    

	$row = mysqli_fetch_array($result);

	
	echo json_encode($row);
}  
?>