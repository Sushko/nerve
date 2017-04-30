<?php

class Model_Goals extends Model
{
	
	public function get_data()
	{	
		//	return array of arrays with 2 or more tables with data after DB query
		return array(
				'Some' => 'Some data',
				'Any' => 'Any data',
				'Value' => 'Some and any value'
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
