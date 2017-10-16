<?php

class Controller_History extends Controller
{

	function __construct()
	{
		$this->model = new Model_History();
		$this->view = new View();
	}

	function action_index()
	{
		include "data.php";
		// protect from saving empty values in all table by pressing save button
		// implement save as incremental - only values that changed (maybe passing from view)
		if(isset($_POST['save']) && isset($_POST['data']))	
		{
			$this->model->set_data($_POST['data']);
		}

		$db_data = $this->model->get_data();
		$data = data_for_history_view($db_data);

		//generate table data from DB data here
		$this->view->generate('history_view.php', 'template_view.php', $data);
	}
}
