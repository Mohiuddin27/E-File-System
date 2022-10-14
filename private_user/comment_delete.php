<?php

 require_once("include/connection.php");

$id = mysqli_real_escape_string($conn,$_GET['delete_id']);


mysqli_query($conn,"DELETE FROM  comments WHERE id='$id'")or die(mysql_error());
echo "<script type='text/javascript'>alert('Deleted Comment!');document.location='showcomment.php'</script>";
?>