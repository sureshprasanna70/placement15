<?php
try{
  $conn=mysql_connect($argv[1],$argv[2],$argv[3]);
  mysql_select_db($argv[4]);
  $ac_query="select id,can_edit from users";
  $result=mysql_query($ac_query);
  while($row=mysql_fetch_array($result)){
      $query='UPDATE users set can_edit=1 where id='.$row['id'];
      echo $query.PHP_EOL;
      mysql_query($query);

  }

}
catch(Exception $e){
  echo $e;
}
?>
