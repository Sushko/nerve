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

function data_for_history_view($db_data)
{
	$data = array();
	$data['OS'] = $db_data['OS'];
	$data['history'] = array();
   	// $total_outcome = Array();
    // $total_income = Array();

	foreach($db_data['history'] as $row)
	{
		foreach($db_data['outcome_group'] as $row2)
		{
		    $data['history'][$row2['title']][$row['year']][$row['month']] = $row[$row2['column_name']]/100;
			if (empty($data['history']['Total outcome'][$row['year']][$row['month']])) $data['history']['Total outcome'][$row['year']][$row['month']] = 0;
			$data['history']['Total outcome'][$row['year']][$row['month']] += $row[$row2['column_name']];
		}
		foreach($db_data['income_group'] as $row2)
		{
		    $data['history'][$row2['title']][$row['year']][$row['month']] = $row[$row2['column_name']]/100;
			if (empty($data['history']['Total income'][$row['year']][$row['month']])) $data['history']['Total income'][$row['year']][$row['month']] = 0;
			$data['history']['Total income'][$row['year']][$row['month']] += $row[$row2['column_name']];
		}
		$data['history']['invest_amount'][$row['year']][$row['month']] = $row['invest_amount']/100;
		$data['history']['capital'][$row['year']][$row['month']] = $row['capital'];
		$data['history']['carry-out'][$row['year']][$row['month']] = $row['carry-out']/100;
		$data['history']['usd_ratio'][$row['year']][$row['month']] = $row['usd_ratio'];
		$data['history']['notes'][$row['year']][$row['month']] = $row['notes'];
	}
	return $data;
}

function data_for_plans_view($db_data)
{

//$db_data
//'OS' => OS_type(),
//'plans_in_time' => get_tabel_data('plans_in_time', 'all'),
//'plans_name' => get_tabel_data('plans_name', 'all'),
//'outcome_group' => get_tabel_data('outcome_group', 'all'),

	$data = array();
	$tmp = array();
	$plans_name = array();
	$data['OS'] = $db_data['OS'];
	$data['plans'] = array();
	$plans_month = array();
	$plans_group = array();

	foreach($db_data['plans_in_time']as $row)
	{
		array_push($plans_month, $row['month']);
	}
	$plans_month = array_unique($plans_month, SORT_STRING);
	sort($plans_month, SORT_STRING);

	array_push($plans_group, 0);
	foreach($db_data['outcome_group']as $row)
	{
		array_push($plans_group, $row['title']);
	}

	array_push($plans_name, 0);
	foreach($db_data['plans_name'] as $row)
	{
		array_push($plans_name, array($row['title'], $plans_group[$row['out_group_id']], $row['cost']));
	}
//print_r($plans_name);
	foreach($plans_name as $key=>$val)
	{
		foreach($db_data['plans_in_time'] as $row)
		{	
			if ($key == $row['plan_id']) array_push($plans_name[$key], $row['month']);//print($row['month'].'<br>');
			//print('key = ');print_r($key);print('<br>');
			//print('row = ');print_r($row['plan_id']);print('<br>');
		}
//	$tmp[$row['plan_id']][$row['month']] = $plans_name[$row['plan_id']];
//$data['plans'][$row['month']]



//print_r($tmp);print('<br>');
		// print_r($row['month']);print('<br>');
		// print_r($db_data['outcome_group'][$tmp['out_group_id']]['title']);print('<br>');

		//array_push($data['plans'][$row['month']][$db_data['outcome_group'][$tmp['out_group_id']]['title']], $tmp);
	}	
	print_r($plans_name);print('<br>');

	// foreach($db_data['outcome_group'] as $row)
	// {
	// 	foreach($data['plans']['month'] as $key=>$value)
	// 	{
	// 		//print_r($key);
	// 		$data['plans'][$value][$row['title']] = Array();
	// 		foreach($db_data['plans_in_time'] as $key2=>$value2)
	// 		{
	// 			print_r($key2);print('  ');print_r($value2);print('<br>');
	// 				$data['plans'][$value2['month']][$row['title']] = Array();
	// 		}
	// 	}
	// }

	// foreach($db_data['outcome_group'] as $row)
	// {
	// 	//$row: group_id, title, column_name
	// 	print_r($row);
	// }

	return $data;
}
