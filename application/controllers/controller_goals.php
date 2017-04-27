<?php

class Controller_Goals extends Controller
{

	function __construct()
	{
		$this->model = new Model_Goals();
		$this->view = new View();
	}
	
	function action_index()
	{
		// protect from saving empty values in all table by pressing save button
		// implement save as incremental - only values that changed (maybe passing from view)
		if(isset($_POST['save']) && isset($_POST['data']))	
		{
			$this->model->set_data($_POST['data']);
		}

		$data = $this->model->get_data();	
		$this->view->generate('goals_view.php', 'template_view.php', $data);
	}
}
