<?php
include "dbAPI.php";
$GLOBALS["store_path"] = $path = str_replace('\\', '/', realpath(dirname(__FILE__))).'/';//'c:/xampp/htdocs/nerve/db/';

/* function for debug print*/
function _dbg($value)
{
    echo "<pre>[DBG]: ";
    print_r($value);
    echo "</pre>";
}

/* dump nerve DB */
function DB_dump()
{
    /*to make this command work do any of 3: 
        1. point full path to mysqldump ( Windows: c:\xampp\mysql\bin\ ; Linux: /opt/lampp/bin/ )
        2. add mysqldump path to $PATH variablein
        3. put mysqldump to folder with "visible" path  /usr/local/sbin,/usr/local/bin,/usr/sbin,/usr/bin,/sbin,/bin
    */
    exec('mysqldump -uroot --password= nerve >'.$GLOBALS["store_path"].date('Y-m-d') . '.sql', $output, $return_var);
    //exec('/opt/lampp/bin/mysqldump -uroot --password= nerve >'.$GLOBALS["store_path"].date('Y-m-d') . '.sql', $output, $return_var);
}

/* empty tables ountome and income_and_status for new month */
function DB_empty_curMonth_tables()
{
    global $connection;
    $result = $connection->query("TRUNCATE TABLE outcome");
    $result = $connection->query("TRUNCATE TABLE income_and_status");
}

/* save daily outcome data in log file */
function DB_save_curMonth_outcome()
{
    global $connection;
    $sql = "SELECT * INTO OUTFILE '".$GLOBALS["store_path"].strtolower(date('Y.F')).".csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' FROM `outcome`";
    $result = $connection->query($sql);
    if (!$result) print ("error=".$connection->get_error()."<br>");
}

/* summarize expends by groups */
function sum_month($month)
{
    $results =  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    if($month->num_rows) {
        while($row2 = $month->fetch_row()) {
            foreach($row2 as $key=>$value) {
                if ($key == 0 ) continue;
                $results[$key] += $value;
            }
        }
    }
    return $results;
}

/* fill history table with past month data from ountome and income_and_status */
function DB_fill_history()
{
    global $connection;

    // fetch data from outcome
    $sql = "SELECT * FROM `outcome`";
    $results = $connection->query($sql);
    if (!$results) print ("error=".$connection->get_error()."<br>");
    else $outcome = sum_month($results);

    // fetch data from income_and_status
    $sql = "SELECT * FROM `income_and_status`";
    $results = $connection->query($sql);
    if (!$results) print ("error=".$connection->get_error()."<br>");
    else $income_and_status = $results->fetch_row();

    $year = date('Y', strtotime($income_and_status[0]));
    $month = date('F', strtotime($income_and_status[0]));

    /* check if record for this month/year exist in history table */
    $sql = "SELECT * FROM `history` WHERE year='$year' AND month='$month'";
    $results = $connection->query($sql);
    if (!$results) print ("error=".$connection->get_error()."<br>");
    _dbg($results->num_rows);
    if ($results->num_rows != 0) echo "Record for this year/month already exist";
    else
    {
        /* insert data into history table */
        $sql = "INSERT INTO `history` VALUES (
            '$year',                    /*year*/
            '$month',                   /*month*/
            '$income_and_status[1]',    /*lex_salary_avtor*/
            '$income_and_status[2]',    /*lex_salary_frog*/
            '$income_and_status[3]',    /*lex_salary_globallogic*/
            '$income_and_status[4]',    /*youleek_salary_mindshare*/
            '$income_and_status[5]',    /*parents*/
            '$income_and_status[6]',    /*sales*/
            '$income_and_status[7]',    /*presented*/
            '$income_and_status[8]',    /*government*/
            '$income_and_status[9]',    /*other*/
             
            '$outcome[1]',              /*utilities_house_keeping*/
            '$outcome[2]',              /*utilities_garage*/
            '$outcome[3]',              /*utilities_internet*/
            '$outcome[4]',              /*utilities_electricity*/
            '$outcome[5]',              /*utilities_gas*/
            '$outcome[6]',              /*utilities_water*/
            '$outcome[7]',              /*food*/
            '$outcome[8]',              /*domestic*/
            '$outcome[9]',              /*transportation*/
            '$outcome[10]',             /*car_maintain*/
            '$outcome[11]',             /*clothes*/
            '$outcome[12]',             /*health*/
            '$outcome[13]',             /*house_stuff*/
            '$outcome[14]',             /*kid_stuff*/
            '$outcome[15]',             /*entertainment*/
            '$outcome[16]',             /*presents*/
            '$outcome[17]',             /*study_development*/
            '$outcome[18]',             /*phone*/
            '$outcome[19]',             /*cigarette*/

            '$income_and_status[11]',   /*invest_amount*/
            '',                         /*capital*/
            '$income_and_status[10]',   /*balance*/
            '$income_and_status[12]',   /*usd_ratio*/
            '$income_and_status[13]'    /*notes*/
            );";
        _dbg($sql);
        $results = $connection->query($sql);
        if (!$results) print ("error=".$connection->get_error()."<br>");
    }
}
DB_fill_history();