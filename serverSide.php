<?php

header("Content-type: text/plain");
$ip = $_SERVER["REMOTE_ADDR"];
$ipsplit = split(":", $ip);
if (sizeof($ipsplit) == 4){
  printf("%s", $ipsplit[3]);
} else {
  printf("%s", $ip);
}

?>
