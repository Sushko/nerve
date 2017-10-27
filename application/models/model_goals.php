<?php

class Model_Goals extends Model
{
	
	public function get_data()
	{	
		
		include "db_api.php";

		return array(
				'OS' => OS_type(),
				'goals_in_time' => get_table_data('goals_in_time', 'all'),
				'goals_name' => get_table_data('goals_name', 'all'),
				'capital' => get_table_data('income_and_status', 'capital'),
		);
	}

	public function set_data($data)
	{
	    echo "<pre>";
	    echo "goals say: ";
	    print_r($data);
	    echo "</pre>";
	}

}
