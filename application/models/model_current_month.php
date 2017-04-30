<?php
class Model_Current_month extends Model
{
	
	public function get_data()
	{
		
		include "db_api.php";
		// Здесь мы просто сэмулируем реальные данные.
		
		return OS_type();
	}

	public function set_data($data)
	{
	    echo "<pre>";
	    echo "current_month says: ";
	    print_r($data);
	    echo "</pre>";
	}

}
