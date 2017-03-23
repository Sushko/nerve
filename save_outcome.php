<?
// $select = "SELECT * FROM table_name";
// $export = mysql_query ( $select ) or die ( "Sql error : " . mysql_error( ) );
// $fields = mysql_num_fields ( $export );

// for ( $i = 0; $i < $fields; $i++ )
// {
//     $header .= mysql_field_name( $export , $i ) . "\t";
// }

// while( $row = mysql_fetch_row( $export ) )
// {
//     $line = '';
//     foreach( $row as $value )
//     {                                            
//         if ( ( !isset( $value ) ) || ( $value == "" ) )
//         {
//             $value = "\t";
//         }
//         else
//         {
//             $value = str_replace( '"' , '""' , $value );
//             $value = '"' . $value . '"' . "\t";
//         }
//         $line .= $value;
//     }
//     $data .= trim( $line ) . "\n";
// }
// $data = str_replace( "\r" , "" , $data );

// if ( $data == "" )
// {
//     $data = "\n(0) Records Found!\n";                        
// }

// header("Content-type: application/octet-stream");
// header("Content-Disposition: attachment; filename=your_desired_name.xls");
// header("Pragma: no-cache");
// header("Expires: 0");
// print "$header\n$data";




$result = $db_con->query('SELECT * FROM `outcome`');
if (!$result) die('Couldn\'t fetch records');
$num_fields = mysql_num_fields($result);
$headers = array();
for ($i = 0; $i < $num_fields; $i++) {
    $headers[] = mysql_field_name($result , $i);
}
$fp = fopen('php://output', 'w');
if ($fp && $result) {
    header('Content-Type: text/csv');
    header('Content-Disposition: attachment; filename="test_month.csv"');
    header('Pragma: no-cache');
    header('Expires: 0');
    fputcsv($fp, $headers);
    while ($row = $result->fetch_array(MYSQLI_NUM)) {
        fputcsv($fp, array_values($row));
    }
    die;
}

?>