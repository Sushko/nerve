<?php
include "dbAPI.php";
$GLOBALS["store_path"] = str_replace('\\', '/', realpath(dirname("db/nerve.sql"))).'/';//'c:/xampp/htdocs/nerve/db/';

/* function for debug print*/
function _dbg($value)
{
    echo "<pre>[DBG]: ";
    print_r($value);
    echo "</pre>";
}

function OS_type()
{
    //DB_fill_history();
    /*
    if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {
        echo 'This is a server using Windows!';
    } else {
        echo 'This is a server not using Windows!';
    }
    */
    return PHP_OS;
}

/* dump nerve DB */
function DB_dump()
{
    /*to make this command work do any of 3:
        1. point full path to mysqldump ( Windows: c:\xampp\mysql\bin\ ; Linux: /opt/lampp/bin/ )
        2. add mysqldump path to $PATH variablein
        3. put mysqldump to folder with "visible" path  /usr/local/sbin,/usr/local/bin,/usr/sbin,/usr/bin,/sbin,/bin
    */
    if (OS_type() == 'WINNT')
    {
        exec('mysqldump -uroot --password= nerve > '.$GLOBALS["store_path"].date('Y-m-d') . '.sql', $output, $return_var);
    }
    else
    {
        exec('/opt/lampp/bin/mysqldump -uroot --password= nerve > '.$GLOBALS["store_path"].date('Y-m-d') . '.sql', $output, $return_var);
    }
}

/* empty tables outcome and income_and_status for new month */
function DB_empty_curMonth_tables()
{
    global $connection;
    $results = $connection->query("TRUNCATE TABLE outcome");
    if (!$results) {
        print ("error=".$connection->get_error()."<br>");
        return false;
    }
    $results = $connection->query("TRUNCATE TABLE income_and_status");
    if (!$results) {
        print ("error=".$connection->get_error()."<br>");
        return false;
    }
    return true;
}

/* save daily outcome data in log file */
function DB_save_curMonth_outcome()
{
    global $connection;
    $sql = "SELECT * INTO OUTFILE '".$GLOBALS["store_path"].strtolower(date('Y.F')).".csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' FROM `outcome`";
    $results = $connection->query($sql);
    if (!$results) {
        print ("error=".$connection->get_error()."<br>");
        return false;
    }
    return true;
}

/* summarize expends by groups */
function sum_month($month)
{
    $results =  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    if($month->num_rows) {
        while($row2 = $month->fetch_row()) {
            foreach($row2 as $key=>$value) {
     /*is it correct? maybe $val == 0*/
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
    //_dbg($results->num_rows);
    if (!$results) { print ("error=".$connection->get_error()."<br>"); return false; }
    if ($results->num_rows != 0) {echo "Record for year = $year and month = $month already exist<br>"; return false;}
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

            '$income_and_status[10]',   /*invest_amount*/
            '$income_and_status[11]',   /*capital*/
            '$income_and_status[12]',   /*carry-out*/
            '$income_and_status[13]',   /*usd_ratio*/
            '$income_and_status[14]'    /*notes*/
            );";
        //_dbg($sql);
        $results = $connection->query($sql);
        if (!$results) {
            print ("error=".$connection->get_error()."<br>");
            return false;
        }
        return true;
    }
}
/* test data functions */
function DB_test_data()
{

    $results = DB_save_curMonth_outcome();
    if ($results != true) return false;
    $results = DB_fill_history();
    if ($results != true) return false;
    DB_empty_curMonth_tables();

}

/* fill history table for the first time */
function fill_history_1st()
{
    global $connection;

    // 1. fetch all data from income_and_status
    $sql = "SELECT * FROM `income_and_status`";
    $res = $connection->query($sql);
    if (!$res) print ("error=".$connection->get_error()."<br>");
    else 
    {
        // 2. get data from income_and_status row by row
        if($res->num_rows) {
            while($income_and_status = $res->fetch_row()) {
                // 3. load outcome table with data from log file relevant to year/month from income_and_status
                $sql = "LOAD DATA INFILE '".$GLOBALS["store_path"]."outcome.log/".strtolower(date("Y.F", strtotime($income_and_status[0]))).".csv' INTO TABLE outcome COLUMNS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n'";
                $results = $connection->query($sql);
                if (!$results) { print ("error=".$connection->get_error()."<br>"); return false; }
                // 4. fetch data from outcome
                $sql = "SELECT * FROM `outcome`";
                $results = $connection->query($sql);
                if (!$results) { print ("error=".$connection->get_error()."<br>"); return false; }
                else $outcome = sum_month($results);

                $year = date('Y', strtotime($income_and_status[0]));
                $month = date('F', strtotime($income_and_status[0]));
                // 5. check if record for this month/year exist in history table
                $sql = "SELECT * FROM `history` WHERE year='$year' AND month='$month'";
                $results = $connection->query($sql);
                if (!$results) { print ("error=".$connection->get_error()."<br>"); return false; }
                if ($results->num_rows != 0) {echo "Record for year = $year and month = $month already exist<br>"; }
                else
                {
                    // 6. insert data into history table
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

                        '$income_and_status[10]',   /*invest_amount*/
                        '$income_and_status[11]',   /*capital*/
                        '$income_and_status[12]',   /*carry-out*/
                        '$income_and_status[13]',   /*usd_ratio*/
                        '$income_and_status[14]'    /*notes*/
                        );";
                        $results = $connection->query($sql);
                        if (!$results) { print ("error=".$connection->get_error()."<br>"); return false; }
                }
                // 7. delete all data form outcome table
                $results = $connection->query("TRUNCATE TABLE outcome");
                if (!$results) { print ("error=".$connection->get_error()."<br>"); return false; }
            }
        }
    }
}

/* fetch data from table */
function get_table_data($table, $field, $key1 = null, $value1 = null, $key2 = null, $value2 = null)
{
    global $connection;
    $results = $connection->query("SET NAMES utf8");
    if (!$results) { print ("error=".$connection->get_error()."<br>"); return false; }
    if ($field == 'all') $field ='*';
    if (!$key1)         $sql = "SELECT $field FROM $table";
    else if (!$key2)    $sql = "SELECT $field FROM $table WHERE $key1=$value1";
    else                $sql = "SELECT $field FROM $table WHERE $key1=$value1 AND $key2=$value2";
    //_dbg($sql);
    $results = $connection->query($sql);
    if (!$results) {
        print ("error=".$connection->get_error()."<br>");
        return false;
    }
    //_dbg($results);
    return $results;
}
/* update data in table */
function set_table_data($table, $fields, $condition = NULL)
{
    global $connection;
    $results = $connection->query("SET NAMES utf8");

    if (!$results) { print ("error=".$connection->get_error()."<br>"); return false; }
    if (!$condition)    $sql = "UPDATE $table SET $fields";
    else                $sql = "UPDATE $table SET $fields WHERE $condition";
    _dbg($sql);
    //$results = $connection->query($sql);
    if (!$results) {
        print ("error=".$connection->get_error()."<br>");
        return false;
    }
    //_dbg($results);
    return $results;
}
//  $query = "UPDATE `PayPort` SET `Trader` = '', `TraderUA` = '', `Logo` = '', `Message` = '', `link` = '', `ID provider` = '', `Text` = '' WHERE `ID trader` = ".$id;

/* add data in table */
function add_table_data($table, $fields)
{
    global $connection;
    $results = $connection->query("SET NAMES utf8");

    if (!$results) { print ("error=".$connection->get_error()."<br>"); return false; }
    $sql = "INSERT INTO $table VALUES $fields";
    _dbg($sql);
    //$results = $connection->query($sql);
    if (!$results) {
        print ("error=".$connection->get_error()."<br>");
        return false;
    }
    //_dbg($results);
    return $results;
}
//  $query = "UPDATE `PayPort` SET `Trader` = '', `TraderUA` = '', `Logo` = '', `Message` = '', `link` = '', `ID provider` = '', `Text` = '' WHERE `ID trader` = ".$id;

/* add data in table */
function search_table($table, $key)
{
    global $connection;
    $results = $connection->query("SET NAMES utf8");

    if (!$results) { print ("error=".$connection->get_error()."<br>"); return false; }
    $sql = "SELECT * FROM $table WHERE $key";
    //_dbg($sql);
    $results = $connection->query($sql);
    if (!$results) {
        print ("error=".$connection->get_error()."<br>");
        return false;
    }
    //_dbg($results->fetch_row());
    return $results;
}
// get_tabel_data('history', 'lex_salary_globallogic');
// get_tabel_data('history', 'lex_salary_globallogic', 'year', '2017');
// get_tabel_data('history', 'lex_salary_globallogic', 'month', 4);
// get_tabel_data('history', 'lex_salary_globallogic', 'month', 4, 'year', '2017');
// DB_empty_curMonth_tables();
// DB_dump();
// fill_history_1st();
