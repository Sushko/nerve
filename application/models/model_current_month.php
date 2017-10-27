<?php
class Model_Current_month extends Model
{

	public function get_data()
	{

		require_once "db_api.php";

		return array(
				'OS' => OS_type(),
				'income_and_status' => get_table_data('income_and_status', 'all'),
				'outcome' => get_table_data('outcome', 'all'),
				'outcome_planned' => get_table_data('outcome_planned', 'all'),
				'extra_expense' => get_table_data('extra_expense', 'all', 'month', 8, 'year', '2017'),
				'goals_in_time' => get_table_data('goals_in_time', 'inc_Lex, 	inc_Youleek, inc_add1, inc_add2, invest_amount', 'month', 9, 'year', '2017'),
				'income_group' => get_table_data('income_group', 'all'),
				'outcome_group' => get_table_data('outcome_group', 'all'),
		);
	}

	public function set_data($data)
	{

		require_once "db_api.php";
		
		print_r($data);
		$fields = '';
		foreach($data['income'] as $key => $val)
		{
			$fields .= $key.' = '.$val;
		}
		
		set_table_data('income_and_status', $fields);
		$fields = '';
		$condition = '';
		set_table_data('outcome', $fields, $condition);

// added new fields should be marked as 'new'
		$fields = '';
		if ($data['extra']['extra_id'] == 'new')
		{
			set_table_data('extra_expense', $fields, 'WHERE `extra_id` = '.$data['extra']['extra_id']);
		}
		else
		{
			add_table_data('extra_expense', $fields);			
		}
		
		//print_r($data);
	}

}
