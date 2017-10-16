<h1>HISTORY on <?php echo $data['OS']?></h1>
<p>
<a href="/<?php echo $GLOBALS["home_path"]; ?>">Currrent Month</a>
<table>
<?php

    echo '<tr><td colspan = "3" align="center">History</td></tr>';
	echo '<tr></td><td></td>';
	foreach($data['history']['Одежда'] as $key => $val)
	{
		$i = 0;
		foreach($data['history']['Одежда'][$key] as $key2 => $val2)
		{
			$i += 1;
		}
		echo '<td colspan = '.$i.' align=center>'.$key.'</td>';
	}
	echo '</tr>';
	echo '<tr><td></td>';
	foreach($data['history']['Одежда'] as $key => $val)
	{
		foreach($data['history']['Одежда'][$key] as $key2 => $val2)
		{
			echo '<td>'.$key2.'</td>';
		}
	}
	echo '</tr>';

	foreach($data['history'] as $key => $val)
	{
		echo '<tr>';
		echo '<td>'.$key.'</td>';
		foreach($data['history'][$key] as $key2 => $val2)
		{
			foreach($data['history'][$key][$key2] as $key3 => $val3)
			{
				echo '<td>'.($val3).'</td>';
			}
		}
    }
	echo '<tr><td>Total outcome</td>';
	foreach($data['history']['Total outcome'] as $key => $val)
	{
		foreach($data['history']['Total outcome'][$key] as $key2 => $val2)
		{
			echo '<td>'.($val2/100).'</td>';
		}
	}
	echo '</tr>';
	echo '<tr><td>Total income</td>';
	foreach($data['history']['Total income'] as $key => $val)
	{
		foreach($data['history']['Total income'][$key] as $key2 => $val2)
		{
			echo '<td>'.($val2/100).'</td>';
		}
	}
	echo '</tr>';


	// $summ_day = Array();
	// $total = 0;
	// $total_planned = 0;
	// foreach($data['planned']['outcome'] as $key => $val)
	// {
	// 	echo '<tr>';
	// 	echo '<td>'.$key.'</td><td>'.($val*$data['usd_rate']).'</td>';
	// 	$total_planned += $val;
	// 	$summ_group = 0;
	// 	foreach($data['outcome'][$key] as $key2 => $val2)
	// 	{
	// 		if ($val2 == 0) continue;
	// 		$summ_group += $val2;
	// 	}
	// 	$total += $summ_group;
	// 	echo '<td>'.($summ_group/100).'</td>';
	// 	foreach($data['outcome'][$key] as $key2 => $val2)
	// 	{
	// 		echo '<td>'.($val2/100).'</td>';
	// 		if (empty($summ_day[$key2])) $summ_day[$key2] = 0;
	// 		$summ_day[$key2] += $val2;
	// 	}
	// 	echo '</tr>';
	// }
	// echo '<tr><td><b>Result</b></td><td>'.($total_planned*$data['usd_rate']).'</td><td><b>'.($total/100).'</b></td>';
	// foreach($summ_day as $key => $val) echo '<td>'.($val/100).'</td>';
	// //for ($i = 0; $i < $count; $i++) echo '<td>'.($summ_day[$i]/100).'</td>';
	// echo '</tr>';
		
?>
</table>
</p>
<form action="" method="post">
<table class="login">
	<tr>
		<td><input type="submit" value="Send" name="btn" style="width: 60px; height: 25px;"></td>
		<td><input type="text" name="data"></td>
		<td><input type="hidden" name="save"></td>
	</tr>
</table>
</form>