$<h1>Портфолио</h1>
<p>
<form action="" method="post">
<table class="login">
	<tr>
		<td><input type="submit" value="Send" name="btn" style="width: 60px; height: 25px;"></td>
		<td><input type="text" name="data"></td>
		<td><input type="hidden" name="save"></td>
	</tr>
</table>
</form>
<table>
<?php
// iterate "name"
// (
// 	print name, group
// 	iterate "month"
// 	(
// 		iterate "name_details" [3] to [end]
// 		if (name_details.month = month) var =  cost;
// 	)
// 	if (!= '') print name, group, var by month

// )
	print('<tr><td></td><td></td>');
	foreach($data['plans']['month'] as $month)
	{
		print('<td>'.$month.'</td>');
	}
	print('<tr>');
	foreach($data['plans']['names'] as $names)
	{
	sort($data['plans']['names'][1], SORT_STRING);
		if (!is_array($names)) continue;
		$var = '';
		$empty = 1;
		foreach($data['plans']['month'] as $month)
		{	
			$cost[$month] = 0;
			for ($i=3;$i<count($names);$i++)
			{
				if ($names[$i] == $month) 
				{
					$cost[$month] += $names[2];
				}
				//echo '<tr><td>'.$row['Year'].'</td><td>'.$row['Site'].'</td><td>'.$row['Description'].'</td></tr>';
			}
			if ($cost[$month] != 0) $empty = 0;
			$var = $var.'<td>'.($cost[$month]/100).'</td>';
		}
		if (!$empty) print('<tr><td>'.$names[1].'</td><td>'.$names[0].'</td>'.$var.'</tr>');
	}
?>
</table>
</p>
