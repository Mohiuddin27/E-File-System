

<?php

require_once("../include/connection.php");

session_start();

if(isset($_POST["reset"])){


  date_default_timezone_set("asia/manila");
  $date = date("M-d-Y h:i A",strtotime("+0 HOURS"));

 $username = mysqli_real_escape_string($conn, $_POST["admin_user"]);  
 $password =  password_hash($_POST['admin_password'], PASSWORD_DEFAULT, array('cost' => 12));



$query=mysqli_query($conn,"SELECT * FROM admin_login WHERE admin_user = '$username'")or die(mysqli_error($conn));
		$row=mysqli_fetch_array($query);
           $id=$row['id'];
            $admin=$row['admin_user'];
           $_SESSION["admin_user"] = $row["admin_user"];

	
	
    
           $counter=mysqli_num_rows($query);
            
		  	if ($counter == 0) 
			  {	
				   echo "<script type='text/javascript'>alert('Invalid Email Address,Please try again!');
				  document.location='forgetpassword.php'</script>";
			  } 
			  else
			  {
                mysqli_query($conn,"UPDATE admin_login SET admin_password='$password' WHERE admin_user='$username'");
    
                 
                echo "<script type='text/javascript'>alert('Password Reset Successfull!');
                document.location='index.html'</script>"; 
			  
	          }
   }
?>