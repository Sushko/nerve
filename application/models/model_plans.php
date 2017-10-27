<?php

class Model_Plans extends Model
{
	
	public function get_data()
	{	
		
		include "db_api.php";

		return array(
				'OS' => OS_type(),
				'plans_in_time' => get_table_data('plans_in_time', 'all'),
				'plans_name' => get_table_data('plans_name', 'all'),
				'outcome_group' => get_table_data('outcome_group', 'all'),
		);
	}

	public function set_data($data)
	{
	    echo "<pre>";
	    echo "plans say: ";
	    print_r($data);
	    echo "</pre>";
	}

}
