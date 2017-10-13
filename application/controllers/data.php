<?php

function data_for_current_month_view($db_data)
{
	    $data = array();
	$data['OS'] = $db_data['OS'];

	$tmp = $db_data['income_and_status']->fetch_array();
	foreach($db_data['income_and_status'] as $row)
	{
		 $data['usd_rate'] = $row['usd_ratio'];
		 $data['capital'] = $row['capital'];
		 $data['carry-out'] = $row['carry-out'];
		 $data['invest_amount'] = $row['invest_amount'];
		 $data['notes'] = $row['notes'];
	}

	foreach($db_data['goals_in_time'] as $row)
	{
		$data['planned']['income'] = $row['inc_Lex']+$row['inc_Youleek']+$row['inc_add1']+$row['inc_add2'];
		$data['planned']['invest_amount'] = $row['invest_amount'];
	}

	$tmp2 = $db_data['outcome_planned']->fetch_array();
	foreach($db_data['outcome_group'] as $row)
	{
		$data['planned']['outcome'][$row['title']] = $tmp2[$row['column_name']];
	}
	//print_r($data);
	foreach($db_data['extra_expense'] as $row)
	{
		$data['extra'][$row['title']] = $row['cost'];
	}

	$data['income'] = array();
	foreach($db_data['income_group'] as $row)
	{
		$data['income'][$row['title']] = $tmp[$row['column_name']];
	}
	$data['outcome'] = array();

	foreach($db_data['outcome'] as $row)
	{
		foreach($db_data['outcome_group'] as $row2)
		{
		$data['outcome'][$row2['title']][$row['date']] = $row[$row2['column_name']];
		}
	}

	return $data;
}