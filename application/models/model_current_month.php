<?php
class Model_Current_month extends Model
{
	
	public function get_data()
	{
		
		include "db_api.php";
		
		return OS_type();
		/*return array(
				'income_and_status' => get_tabel_data('income_and_status', 'all'),
				'outcome' => get_tabel_data('outcome', 'all'),
				'outcome_planned' => get_tabel_data('outcome_planned', 'all'),
				'extra_expense' => get_tabel_data('extra_expense', 'all', 'month', 9, 'year', '2017'),
				'goals_in_time' => get_tabel_data('goals_in_time', 'inc_Lex, 	inc_Youleek, inc_add1, inc_add2, invest_amount', 'month', 9, 'year', '2017'),
				'income_group' => get_tabel_data('income_group', 'all'),
				'outcome_group' => get_tabel_data('outcome_group', 'all'),
		);*/
	}

	public function set_data($data)
	{
	    echo "<pre>";
	    echo "current_month says: ";
	    print_r($data);
	    echo "</pre>";
	}

}
