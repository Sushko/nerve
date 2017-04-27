<?php

class Model_History extends Model
{
	
	public function get_data()
	{	
		
		// Здесь мы просто сэмулируем реальные данные.
		
		return 'HISTORY';
	}

	public function set_data($data)
	{
	    echo "<pre>";
	    echo "history says: ";
	    print_r($data);
	    echo "</pre>";
	}

}
