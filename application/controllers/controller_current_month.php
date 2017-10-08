<?php

class Controller_Current_month extends Controller
{

	function __construct()
	{
		$this->model = new Model_Current_month();
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

		$db_data = $this->model->get_data();
		//print_r($db_data['income_group']['colunm_name']);
		$data['OS'] = $db_data['OS'];
		//$data['capital'] = $db_data['income_and_status']['capital'] ;
		$data['income_name'] = $db_data['income_group'] ;
		//$data['carry_out'] = $db_data['']; 
		//$data['income_name']['lex_salary_avtor'] = $db_data['income_group']['lex_salary_avtor']; 
#        +----------------------------------------------------------+                                                  #
#        | group_id |       title        |       colunm_name        |                                                  #
#        |----------+--------------------+--------------------------|                                                  #
#        |          | Avtor (Лёша)       | lex_salary_avtor         |                                                  #
#        |          | Frog (Лёша)        | lex_salary_frog          |                                                  #
#        |          | GlobalLogic (Лёша) | lex_salary_globallogic   |                                                  #
#        |          | Mindshare (Youleek)| youleek_salary_mindshare |                                                  #
#        |          | Родители           | parents                  |                                                  #
#        |          | Продажи            | sales                    |                                                  #
#        |          | Подарки            | presented                |                                                  #
#        |          | Социальные выплаты | government               |                                                  #
#        |          | Другое             | other                    |                                                  #
#        |          |                    |                          |                                                  #
/*
				'OS' => OS_type(),
				'income_and_status' => get_tabel_data('income_and_status', 'all'),
				'outcome' => get_tabel_data('outcome', 'all'),
				'outcome_planned' => get_tabel_data('outcome_planned', 'all'),
				'extra_expense' => get_tabel_data('extra_expense', 'all', 'month', 9, 'year', '2017'),
				'goals_in_time' => get_tabel_data('goals_in_time', 'inc_Lex, 	inc_Youleek, inc_add1, inc_add2, invest_amount', 'month', 9, 'year', '2017'),
				'income_group' => get_tabel_data('income_group', 'all'),
				'outcome_group' => get_tabel_data('outcome_group', 'all'),
*/
		//generate table data from DB data here
		$this->view->generate('current_month_view.php', 'template_view.php', $data);
	}
}