<?php
include "dbAPI.php";
$GLOBALS["store_path"] = $path = str_replace('\\', '/', realpath(dirname(__FILE__))).'/';//'c:/xampp/htdocs/nerve/db/';	

function prepare_table($table)
{
	$results = array();
	if($table->num_rows) {
	    echo '<table cellpadding="0" cellspacing="0" class="db-table">';
	    echo '<tr><th>Field</th><th>Type</th><th>Null</th><th>Key</th><th>Default<th>Extra</th></tr>';
	    while($row2 = $table->fetch_row()) {
	        echo '<tr>';
	        foreach($row2 as $key=>$value) {
	        	print_r( $results);
	        	if ($key != 0 ) $results[0] = $results[0] + $value;
	            echo '<td>',$value,'</td>';
	        }
	        echo '</tr>';
	    }
	    echo '</table><br />';
	}
	    	print_r($results);echo '<br>';
}

//dump nerve DB
function dump_DB()
{
	//to make this command work path of mysqldump should be exported: export PATH=$PATH:/path/to/mysqldump (c:\xampp\mysql\bin\ - windows)
    exec('mysqldump -uroot --password= nerve >'.$GLOBALS["store_path"].date('Y-m-d') . '.sql');
}

function empty_curMonth_tables()
{
	global $connection;
	$result = $connection->query("TRUNCATE TABLE outcome");
	$result = $connection->query("TRUNCATE TABLE income_and_status");
}

function save_curMonth_outcome()
{
	global $connection;
	$sql = "SELECT * INTO OUTFILE '".$GLOBALS["store_path"].strtolower(date('Y.F')).".csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' FROM `outcome`";
    $result = $connection->query($sql);
}

function fill_history()
{
	global $connection;

	// fetch data from outcome
	$sql = "SELECT * FROM `outcome`";
    $outcome = $connection->query($sql);
    if (!$outcome) print ("error=".$connection->get_error()."<br>");
    else prepare_table($outcome);

	// fetch data from income_and_status
	$sql = "SELECT * FROM `income_and_status`";
    $income_and_status = $connection->query($sql);
    if (!$income_and_status) print ("error=".$connection->get_error()."<br>");
	else prepare_table($income_and_status);
    
print_r($outcome);
    // insert data into 
	$sql = "INSERT INTO `history` VALUES (
'".strtolower(date('Y'))."',/*year*/
'".strtolower(date('F'))."',/*month*/
'',/*lex_salary_avtor*/
'',/*lex_salary_frog*/
'',/*lex_salary_globallogic*/
'',/*youleek_salary_mindshare*/
'',/*parents*/
'',/*sales*/
'',/*presented*/
'',/*government*/
'',/*other*/

'',/*utilities_house_keeping*/
'',/*utilities_garage*/
'',/*utilities_internet*/
'',/*utilities_electricity*/
'',/*utilities_gas*/
'',/*utilities_water*/
'',/*food*/
'',/*domestic*/
'',/*transportation*/
'',/*car_maintain*/
'',/*clothes*/
'',/*health*/
'',/*house_stuff*/
'',/*kid_stuff*/
'',/*entertainment*/
'',/*presents*/
'',/*study_development*/
'',/*phone*/
'',/*cigarette*/

'',/*invest_amount*/
'',/*capital*/
'',/*balance*/
'',/*usd_ratio*/
'',/*notes*/
*/
)";
//print $sql;
}

fill_history();