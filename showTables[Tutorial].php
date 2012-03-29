<?php

// Creates table from all db info:
$table_name = "";
$qry = "SELECT * FROM".$table_name.";";
$res = mysql_query($mem_qry);

function mysql_fetch_all($res) {
  while($row=mysql_fetch_array($res)) {
    $return[] = $row;
  }
  return $return;
}

function create_table($dataArr) {
  echo "<tr>";
  for($j = 0; $j < count($dataArr); $j++) {
    echo "<td>".$dataArr[$j]."</td>";
  }
  echo "</tr>";
}

$all = mysql_fetch_all($res);

echo "<table class='data_table'>";

for($i = 0; $i < count($all); $i++) {
  create_table($all[$i]);
}

echo "</table>";

?>