<?php

 require_once("include/connection.php");

$id = mysqli_real_escape_string($conn,$_GET['id']);


mysqli_query($conn,"DELETE FROM departments WHERE id='$id'")or die(mysql_error());
echo "<script type='text/javascript'>alert('Deleted Department!');document.location='view_department.php'</script>";
?>
