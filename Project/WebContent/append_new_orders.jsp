<?php
session_start();
/*Server*/
include('classes/db_config.php');

if (mysqli_connect_errno())
{
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$Users_ID = $_SESSION[id];


$sql="SELECT * FROM `orders_table` WHERE status= 0";



if ($result_a=mysqli_query($connect,$sql))
{
  // Fetch one and one row
	

	$row_a=mysqli_fetch_array($result_a);

	$query = "SELECT ot.*,ca.quantity,p.p_name,p.price as pprice,p.gst_under,p.variant  as v_id,c.cat_name,a.variant FROM cart ca,  product_details p ,orders_table ot , product_categories c, attribute a WHERE p.id = ca.product_id AND p.cat_id = c.id AND p.variant = a.id AND  ca.order_id = ot.order_id AND  ca.order_id= '".$row_a["order_id"]."'";

	$query2 = "SELECT ot.*,ca.quantity,p.p_name,p.price as pprice,p.gst_under,p.variant  as v_id,c.cat_name,a.variant FROM cart ca,  product_details p ,orders_table ot , product_categories c, attribute a WHERE p.id = ca.product_id AND p.cat_id = c.id AND p.variant = a.id AND  ca.order_id = ot.order_id AND  ca.order_id= '".$row_a["order_id"]."'";

	$result = mysqli_query($connect, $query);  
	$result2 = mysqli_query($connect, $query2);  
	$data = mysqli_fetch_array($result2);
	$price5=$price12=$price18=0;
	while($row3 = mysqli_fetch_array($result))
	{
		if ($row3['gst_under']==5) {
			$price5 +=($row3['pprice']*$row3['quantity']);
		}
		if ($row['gst_under']==12) {
			$price12 +=($row3['pprice']*$row3['quantity']);
		}
		if ($row['gst_under']==18) {
			$price18 +=($row3['pprice']*$row3['quantity']);
		}




	}

	$p51 =  ($price5+$data[pack]) -(($price5+$data[pack]) - (($price5+$data[pack]) * (100/(100 + 5))));
	$p5cgst1 = ($price5+$data[pack]) - (($price5+$data[pack]) * (100/(100 + 2.5)));
	$p5sgst1 = ($price5+$data[pack]) - (($price5+$data[pack]) * (100/(100 + 2.5)));
	$p5gst1 = ($price5+$data[pack]) - (($price5+$data[pack]) * (100/(100 + 5)));


	$p5 =round($p51 ,2);  
	$p5cgst =round($p5cgst1,2); 
	$p5sgst =round($p5sgst1 ,2);  
	$p5gst =round($p5gst1,2); 









	$lastid = $row_a[id];

	$sql_update = "UPDATE orders_table SET status = '1',taxablegst5='$p5',cgst5='$p5cgst',sgst5='$p5sgst',totalgst5='$p5gst' WHERE id = '$lastid'";
	$result10=mysqli_query($connect,$sql_update);
	echo json_encode($row_a);


  // Free result set
	mysqli_free_result($result_a);
}

mysqli_close($connect);
?>

