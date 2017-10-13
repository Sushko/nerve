<h1>Добро пожаловать <a href="/<?php echo $GLOBALS["home_path"]; ?>"><?php echo $data['OS']?></a>!</h1>
<p>
<img src="/<?php echo $GLOBALS["home_path"]; ?>img/office-small.jpg" align="left" >
<table>
<?php
		echo '<tr><td>USD,$</td><td>'.$data['usd_rate'].'</td></tr>';
		echo '<tr><td>Capital</td><td>'.$data['capital'].'</td></tr>';
		if ($data['notes'] != '') echo '<tr><td colspan = "2" align="center" >'.$data['notes'].'</td></tr>';
?>
</table>
<table>
<tr><td colspan = "2" align="center" >Extra expences</td></tr>
<?php
$summ = 0;
	foreach($data['extra'] as $key => $val)
	{
		if ($val == 0) continue;
		echo '<tr><td>'.$key.'</td><td>'.($val/100).'</td></tr>';
	}
	
?>
</table>
<table>
<?php
	$summ = 0;
    echo '<tr><td>Остаток с пред. месяца</td><td>'.($data['carry-out']/100).'</td><td></td></tr>';
	foreach($data['income'] as $key => $val)
	{
		if ($val == 0) continue;
		echo '<tr><td>'.$key.'</td><td>'.($val/100).'</td><td></td></tr>';
		$summ += $val;
	}
    echo '<tr><td>Income</td><td>'.($data['planned']['income']*$data['usd_rate']).'</td><td>'.($summ/100).'</td></tr>';
    echo '<tr><td>Investment</td><td>'.($data['planned']['invest_amount']*$data['usd_rate']).'</td><td>'.($data['invest_amount']/100).'</td></tr>';

?>
</table>
<table>
<?php

    echo '<tr><td colspan = "3" align="center">Outcome</td></tr>';
	echo '<tr><td colspan = 2 ></td><td>Total</td>';
	foreach($data['outcome']['Одежда'] as $key => $val)
	{
		echo '<td>'.$key.'</td>';
	}
	echo '</tr>';

	$summ_day = Array();
	$total = 0;
	$total_planned = 0;
	foreach($data['planned']['outcome'] as $key => $val)
	{
		echo '<tr>';
		echo '<td>'.$key.'</td><td>'.($val*$data['usd_rate']).'</td>';
		$total_planned += $val;
		$summ_group = 0;
		foreach($data['outcome'][$key] as $key2 => $val2)
		{
			if ($val2 == 0) continue;
			$summ_group += $val2;
		}
		$total += $summ_group;
		echo '<td>'.($summ_group/100).'</td>';
		foreach($data['outcome'][$key] as $key2 => $val2)
		{
			echo '<td>'.($val2/100).'</td>';
			if (empty($summ_day[$key2])) $summ_day[$key2] = 0;
			$summ_day[$key2] += $val2;
		}
		echo '</tr>';
	}
	echo '<tr><td><b>Result</b></td><td>'.($total_planned*$data['usd_rate']).'</td><td><b>'.($total/100).'</b></td>';
	foreach($summ_day as $key => $val) echo '<td>'.($val/100).'</td>';
	//for ($i = 0; $i < $count; $i++) echo '<td>'.($summ_day[$i]/100).'</td>';
	echo '</tr>';
		
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