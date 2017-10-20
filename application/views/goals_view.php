<h1>Контакты</h1>
<p>
<table>
	<tr>
		<td colspan="2" align="center">Time</td>
		<td colspan="5" align="center">Income</td>
		<td colspan="4" align="center">Outcome</td>
		<td rowspan="2" align="center">Investment</td>
		<td rowspan="2" align="center">Capital</td>
		<td colspan="2" align="center">Goals</td>
	</tr>
	<tr>
		<!-- Time -->
		<td>year</td>
		<td>month</td>
		<!-- Income -->
		<td>Lex</td>
		<td>Youleek</td>
		<td>additional income 1</td>
		<td>additional income 2</td>
		<td>Total</td>
		<!-- Outcome -->
		<td>Main</td>
		<td>Extra</td>
		<td>Vacation</td>
		<td>Total</td>
		<!-- Investment -->
		<!-- Capital -->
		<!-- Goals -->
		<td>cost</td>
		<td>name</td>
	</tr>
	
<?php

for ($i=0;$i<count($data['goals']['year']);$i++)
{
	echo '<!-- Time -->
		<tr>
		<td>'.$data['goals']['year'][$i].'</td>
		<td>'.$data['goals']['month'][$i].'</td>
		<!-- Income -->
		<td>'.$data['goals']['inc_lex'][$i].'</td>
		<td>'.$data['goals']['inc_youleek'][$i].'</td>
		<td>'.$data['goals']['inc_add1'][$i].'</td>
		<td>'.$data['goals']['inc_add2'][$i].'</td>
		<td>'.$data['goals']['inc_total'][$i].'</td>
		<!-- Outcome -->
		<td>'.$data['goals']['out_main'][$i].'</td>
		<td>'.$data['goals']['out_extra'][$i].'</td>
		<td>'.$data['goals']['out_vacation'][$i].'</td>
		<td>'.$data['goals']['out_total'][$i].'</td>
		<!-- Investment -->
		<td>'.$data['goals']['invest'][$i].'</td>
		<!-- Capital -->
		<td>'.$data['goals']['capital'][$i].'</td>
	 	<!-- Goals -->
	 	<td>'.$data['goals']['g_cost'][$i].'</td>
	 	<td>'.$data['goals']['g_name'][$i].'</td>
	 	</tr>';
}
?>
</table>
<form action="" method="post">
<table class="login">
	<tr>
		<td><input type="submit" value="Send" name="btn" style="width: 60px; height: 25px;"></td>
		<td><input type="text" name="data"></td>
		<td><input type="hidden" name="save"></td>
	</tr>
</table>
</form>
<!--<iframe align="left" src="https://maps.google.ru/maps?f=q&amp;source=s_q&amp;hl=ru&amp;geocode=&amp;q=%D0%91%D0%BE%D0%B1%D1%80%D1%83%D0%B9%D1%81%D0%BA,+%D0%91%D0%B5%D0%BB%D0%B0%D1%80%D1%83%D1%81%D1%8C&amp;sll=53.174971,29.250412&amp;sspn=0.127788,0.363579&amp;ie=UTF8&amp;hq=&amp;hnear=%D0%91%D0%BE%D0%B1%D1%80%D1%83%D0%B9%D1%81%D0%BA,+%D0%9C%D0%BE%D0%B3%D0%B8%D0%BB%D1%91%D0%B2%D1%81%D0%BA%D0%B0%D1%8F+%D0%BE%D0%B1%D0%BB%D0%B0%D1%81%D1%82%D1%8C,+%D0%91%D0%B5%D0%BB%D0%B0%D1%80%D1%83%D1%81%D1%8C&amp;ll=53.163,29.241&amp;spn=0.063897,0.181789&amp;t=m&amp;z=13&amp;iwloc=A&amp;output=embed"
frameborder="0" marginwidth="0" marginheight="0" scrolling="no" align="right" width="450" height="380">
</iframe>-->
</p>
