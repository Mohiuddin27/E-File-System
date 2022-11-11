

<?php

require_once("include/connection.php");

session_start();

if(isset($_POST["reset"])){


  date_default_timezone_set("asia/manila");
  $date = date("M-d-Y h:i A",strtotime("+0 HOURS"));

 $username = mysqli_real_escape_string($conn, $_POST["email_address"]);  
 $password =  password_hash($_POST['user_password'], PASSWORD_DEFAULT, array('cost' => 12));



$query=mysqli_query($conn,"SELECT * FROM login_user WHERE email_address = '$username'")or die(mysqli_error($conn));
		$row=mysqli_fetch_array($query);
           $id=$row['id'];
            $admin=$row['admin_user'];

	
	
    
           $counter=mysqli_num_rows($query);
            
		  	if ($counter == 0) 
			  {	
				   echo "<script type='text/javascript'>alert('Invalid Email Address,Please try again!');
				  document.location='userforgetpassword.php'</script>";
			  } 
			  else
			  {
                mysqli_query($conn,"UPDATE login_user SET user_password='$password' WHERE email_address='$username'");
    
                 
                echo "<script type='text/javascript'>alert('Password Reset Successfull!');
                document.location='login.html'</script>"; 
			  
	          }
   }
?>