<?php
$conn=mysql_connect($argv[1],$argv[2],$argv[3]);
mysql_select_db($argv[4]);
$extra_query="select current,history,total_arrears,user_id from extra_activities";
$extra_result=mysql_query($extra_query);
while($extra_row=mysql_fetch_array($extra_result)){
  $total_arrears=0;
  $total_arrears=$extra_row["current"]+$extra_row["history"];
  $college_profile_query="update college_profiles set current=".$extra_row["current"].",history=".$extra_row["history"].",total_arrears=".$total_arrears." where user_id=".$extra_row["user_id"];
  echo $college_profile_query.PHP_EOL;
  mysql_query($college_profile_query);
}
?>
