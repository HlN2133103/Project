<?php include('admin/classes/db_config.php');

?>

<?php 

if (mysqli_connect_errno())
{
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
}


if(isset($_POST["ct_id"]))  
 {  
      $query = "DELETE FROM cart WHERE id = '".$_POST["ct_id"]."'";  
      if (mysqli_query($connect, $query)) {
      	$_SESSION[delete_cart_p] = "Removed from Cart";
      	 $output = $_SESSION[delete_cart_p];
      	echo json_encode($output);
      }
 }  
 ?>