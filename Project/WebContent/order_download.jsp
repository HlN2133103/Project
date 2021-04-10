<?php session_start(); ?>
<?php  
//export.php  
include('admin/classes/db_config.php');
$output = '';
if(isset($_GET["export"]))
{
  // $sdate = $_POST["start_date"];
  // $edate = $_POST["end_date"];

  $query = "SELECT ot.*,ca.quantity,p.p_name,p.price as pprice,p.gst_under,p.variant  as v_id,c.cat_name,a.variant FROM cart ca,  product_details p ,orders_table ot , product_categories c, attribute a WHERE p.id = ca.product_id AND p.cat_id = c.id AND p.variant = a.id AND  ca.order_id = ot.order_id AND  ca.order_id= '".$_GET["export"]."'";

  $query2 = "SELECT ot.*,ca.quantity,p.p_name,p.price as pprice,p.gst_under,p.variant  as v_id,c.cat_name,a.variant FROM cart ca,  product_details p ,orders_table ot , product_categories c, attribute a WHERE p.id = ca.product_id AND p.cat_id = c.id AND p.variant = a.id AND  ca.order_id = ot.order_id AND  ca.order_id= '".$_GET["export"]."'";

  $result = mysqli_query($connect, $query);  
  $result2 = mysqli_query($connect, $query2);  
  $data = mysqli_fetch_array($result2);
  if($data['discount']!="") {
   $dis =$data['discount'];
 }else{
   $dis ="00";
 }
 $row_col= mysqli_num_rows($result);



 if(mysqli_num_rows($result) > 0)
 {



  $output .=' 
  <font size="6" face="Courier">';

  $output .='<table cellspacing="0" cellpadding="1" width="35%">'; 

  $output .='<tr align="center">
  <td width="100%" align="center"><h3>GST INVOICE</h3></td>
  </tr>'; 
  $output .='<tr align="center">
  <td width="100%"><h2>MADHURAM SWEETS</h2></td>
  </tr>';

  $output .='<tr align="center"><td colspan ="6">------------------------------------------------------</td></tr>';

  $output .='<tr align="center">
  <td colspan ="6">Order ID: '.$data[order_id].'</td>
  </tr>';
  $output .='<tr align="center">
  <td colspan ="6">Name: '.$data[name].'</td>
  </tr>';
  $output .='<tr align="center">
  <td colspan ="6">Address:'.$data[address].'</td>
  </tr>';
  $output .='<tr align="center"><td colspan ="6">------------------------------------------------------</td></tr>';
  $output .='<tr>  
  <th width="40%">Products</th> 
  <th width="12%">qty</th>  
  <th width="13%">amt</th>  
  <th width="15%">gm</th>  
  <th width="10%">Gst%</th>   
  <th width="10%">Total</th>   
  </tr>
  ';
  $output .='<tr align="center"><td colspan ="6">------------------------------------------------------</td></tr>';

  $price5=$price12=$price18=0;
  while($row = mysqli_fetch_array($result))
  {
    if ($row['gst_under']==5) {
     $price5 +=($row['pprice']*$row['quantity']);
   }
   if ($row['gst_under']==12) {
    $price12 +=($row['pprice']*$row['quantity']);
  }
  if ($row['gst_under']==18) {
   $price18 +=($row['pprice']*$row['quantity']);
 }
 $output .= '
 <tr>
 <td>'.$row['p_name'].'</td>
 <td>'.$row['quantity'].'</td>
 <td>'.$row['pprice'].'</td>
 <td>'.$row['variant'].'</td>
 <td>'.$row['gst_under'].'</td>
 <td>'.$row['quantity']*$row['pprice'].'</td>
 </tr>
 ';
}
$output .='<tr align="center"><td colspan ="6">------------------------------------------------------</td></tr>';
$output .= '
<tr >
<td  colspan ="4">Discount</td>
<td align="right" colspan ="2">'.$dis.'</td>
</tr>
';
$output .='<tr align="center"><td colspan ="6">------------------------------------------------------</td></tr>';
$output .= '
<tr >
<td colspan ="4">Packaging</td>
<td align="right" colspan ="2">'.$data[pack].'</td>
</tr>
';
$output .='<tr align="center"><td colspan ="6">------------------------------------------------------</td></tr>';
$output .= '
<tr >
<td  colspan ="4">Grand Total</td>
<td align="right" colspan ="2">'.$data[price].'</td>
</tr>
';
$output .='<tr align="center"><td colspan ="6">------------------------------------------------------</td></tr>';

$output .='<tr>  
<th width="40%">Taxable amt</th> 
<th width="10%">GST %</th>  
<th width="15%">CGST amt</th>  
<th width="15%">SGST amt</th>  
<th width="20%">GST amt</th>   
</tr>
';
$output .='<tr align="center"><td colspan ="6">------------------------------------------------------</td></tr>';

$p5 =  ($price5+$data[pack]) -(($price5+$data[pack]) - (($price5+$data[pack]) * (100/(100 + 5))));
$p5cgst = ($price5+$data[pack]) - (($price5+$data[pack]) * (100/(100 + 2.5)));
$p5sgst = ($price5+$data[pack]) - (($price5+$data[pack]) * (100/(100 + 2.5)));
$p5gst = ($price5+$data[pack]) - (($price5+$data[pack]) * (100/(100 + 5)));

if ($price12<0) {


$p12 =  ($price12+$data[pack]) -(($price12+$data[pack]) - (($price12+$data[pack]) * (100/(100 + 12))));
$p12cgst = ($price12+$data[pack]) - (($price12+$data[pack]) * (100/(100 + 6)));
$p12sgst = ($price12+$data[pack]) - (($price12+$data[pack]) * (100/(100 + 6)));
$p12gst = ($price12+$data[pack]) - (($price12+$data[pack]) * (100/(100 + 12)));
}
if ($price18<0) {
$p18 =  ($price18+$data[pack]) -(($price18+$data[pack]) - (($price18+$data[pack]) * (100/(100 + 18))));
$p18cgst = ($price18+$data[pack]) - (($price18+$data[pack]) * (100/(100 + 9)));
$p18sgst = ($price18+$data[pack]) - (($price18+$data[pack]) * (100/(100 + 9)));
$p18gst = ($price18+$data[pack]) - (($price18+$data[pack]) * (100/(100 + 18)));

}

$output .='<tr>  
<th width="40%">'.round($p5,2).'</th> 
<th width="10%">5</th>  
<th width="15%">'.round($p5cgst,2).'</th>  
<th width="15%">'.round($p5sgst,2).'</th>  
<th width="20%">'.round($p5gst,2).'</th>   
</tr>
';


$output .='<tr>  
<th width="40%">'.round($p12,2).'</th> 
<th width="10%">12</th>  
<th width="15%">'.round($p12cgst,2).'</th>  
<th width="15%">'.round($p12sgst,2).'</th>  
<th width="20%">'.round($p12gst,2).'</th>   
</tr>
';

$output .='<tr>  
<th width="40%">'.round($p18,2).'</th> 
<th width="10%">18</th>  
<th width="15%">'.round($p18cgst,2).'</th>  
<th width="15%">'.round($p18sgst,2).'</th>  
<th width="20%">'.round($p18gst,2).'</th>   
</tr>
';

 $output .='<tr align="center"><td colspan ="6">------------------------------------------------------</td></tr>';
$output .='<tr>  
<th width="40%">'.round(($p5+$p12+$p18),2).'</th> 
<th width="10%"></th>  
<th width="15%">'.round(($p5cgst+$p12cgst+$p18cgst),2).'</th>  
<th width="15%">'.round(($p5sgst+$p12sgst+$p18sgst),2).'</th> 
<th width="20%">'.round(($p5gst+$p12gst+$p18gst),2).'</th> 

</tr>
';
 $output .='<tr align="center"><td colspan ="6">------------------------------------------------------</td></tr>';

$output .= '</table></font>';


require_once('tcpdf_min/tcpdf.php');  
$obj_pdf = new TCPDF('P', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);  
$obj_pdf->SetCreator(PDF_CREATOR);  
$obj_pdf->SetTitle("MADHURAM SWEETS");  
$obj_pdf->SetHeaderData('', '', PDF_HEADER_TITLE, PDF_HEADER_STRING);  
$obj_pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));  
$obj_pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));  
$obj_pdf->SetDefaultMonospacedFont('helvetica');  
$obj_pdf->SetFooterMargin(PDF_MARGIN_FOOTER);  
$obj_pdf->SetMargins('5', PDF_MARGIN_RIGHT);  
$obj_pdf->setPrintHeader(false);  
$obj_pdf->setPrintFooter(false);  
$obj_pdf->SetAutoPageBreak(TRUE, 10);  
$obj_pdf->SetFont('helvetica', '', 12);  
$obj_pdf->AddPage();  
$content = '';  

$content .= $output; 

$obj_pdf->writeHTML($content);  
$obj_pdf->Output('products_file.pdf', 'I'); 

   // header('Content-Type: application/xls');
   // header('Content-Disposition: attachment; filename=exp_data.xls');
   // echo $output;
}else{
  $_SESSION['data_notfound'] = "Hi ".$_SESSION[head_name] . " Data not found";
  header("location:product_page.php");
}
}
?>
