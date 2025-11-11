<?php
$miPasswordSegura = 'AbarrotesA19';

$hash = password_hash($miPasswordSegura, PASSWORD_DEFAULT);

echo "Tu hash es: <br>";
echo $hash;
?>