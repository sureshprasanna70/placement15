<?php
try{
  $conn=mysql_connect($argv[1],$argv[2],$argv[3]);
  mysql_select_db($argv[4]);
  $ac_query="select * from academic_details";
    for($i=0;$i<4200;$i++){
      $query='INSERT INTO academic_detail values("","","","","","","","","","","","","","","","",'.$i.',"")';
      echo $query.PHP_EOL;
      mysql_query($query);

    }
  $result=mysql_query($ac_query);
  while($row=mysql_fetch_array($result)){
    if($row["course"]==="sslc")
    { 
      $query='UPDATE academic_detail set sslc_mark='.$row["percentage"].',sslc_institute="'.$row['institution'].'",sslc_year='.$row['pass_year'].',sslc_authority="'.$row['examination_authority'].'" where user_id='.$row['user_id'];
      echo $query.PHP_EOL;
      mysql_query($query);

    }
    else if($row["course"]==="hsc")
    { 
      $query='UPDATE academic_detail set hsc_mark='.$row["percentage"].',hsc_institute="'.$row['institution'].'",hsc_year='.$row['pass_year'].',hsc_authority="'.$row['examination_authority'].'" where user_id='.$row['user_id'];
      echo $query.PHP_EOL;
      mysql_query($query);

    }
    else if($row["course"]==="ug")
    { 
      $query='UPDATE academic_detail set ug_mark='.$row["percentage"].',ug_institute="'.$row['institution'].'",ug_year='.$row['pass_year'].',ug_authority="'.$row['examination_authority'].'" where  user_id='.$row['user_id'];
      echo $query.PHP_EOL;
      mysql_query($query);

    }
    else if($row["course"]==="pg")
    { 
      $query='UPDATE academic_detail set pg_mark='.$row["percentage"].',pg_institute="'.$row['institution'].'",pg_year='.$row['pass_year'].' , pg_authority="'.$row['examination_authority'].'" where user_id='.$row['user_id'];
      echo $query.PHP_EOL;
      mysql_query($query);

    }


  }

}
catch(Exception $e){
  echo $e;
}
?>
