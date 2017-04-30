<?php
//include "dbAPI.php";
class Model_Current_month extends Model
{
	
	public function get_data()
	{
		
		// Здесь мы просто сэмулируем реальные данные.
		
		return PHP_OS;
	}

	public function set_data($data)
	{
	    echo "<pre>";
	    echo "current_month says: ";
	    print_r($data);
	    echo "</pre>";
	}

}
