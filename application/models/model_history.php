<?php

class Model_History extends Model
{
	
	public function get_data()
	{	
		include "db_api.php";

		return array(
				'OS' => OS_type(),
				'history' => get_tabel_data('history', 'all'),
				'extra_expense' => get_tabel_data('extra_expense', 'all'),
				'income_group' => get_tabel_data('income_group', 'all'),
				'outcome_group' => get_tabel_data('outcome_group', 'all'),
		);
	}

	public function set_data($data)
	{
	    echo "<pre>";
	    echo "history says: ";
	    print_r($data);
	    echo "</pre>";
	}

}
