<!DOCTYPE html>
<html lang="en">
<?php
// include('Private_Dashboard/include/connection.php');
session_start();
if(!isset($_SESSION["email_address"])){
    header("location:../login.html");

} 

?>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>E-Filing System</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="css/style.css" rel="stylesheet">


<!-- 
<link href="css/addons/datatables.min.css" rel="stylesheet">
<script href="js/addons/datatables.min.js" rel="stylesheet"></script>
<link href="css/addons/datatables-select.min.css" rel="stylesheet">
<script href="js/addons/datatables-select.min.js" rel="stylesheet"></script> -->


<!-- <link rel="stylesheet" id="font-awesome-style-css" href="http://phpflow.com/code/css/bootstrap3.min.css" type="text/css" media="all">
<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js"></script> -->
    <script src="js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="media/css/dataTable.css" />
    <script src="media/js/jquery.dataTables.js" type="text/javascript"></script>
    <!-- end table-->
    <script type="text/javascript" charset="utf-8">
  $(document).ready(function(){
      $('#dtable').dataTable({
                "aLengthMenu": [[5, 10, 15, 25, 50, 100 , -1], [5, 10, 15, 25, 50, 100, "All"]],
                "iDisplayLength": 10
                //"destroy":true;
            });
  })
    </script>
    <style type="text/css">
      select[multiple], select[size] {
    height: auto;
    width: 20px;
}
.pull-right {
    float: right;
    margin: 2px !important;
}
    #loader{
        position: fixed;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 100%;
        z-index: 9999;
        background: url('img/lg.flip-book-loader.gif') 50% 50% no-repeat rgb(249,249,249);
        opacity: 1;
    }
 /*   #dtable{
 display: block;

  overflow-x: scroll;
  width: 600px;
    }*/



  </style>

    <script src="jquery.min.js"></script>
<script type="text/javascript">
  $(window).on('load', function(){
    //you remove this timeout
    setTimeout(function(){
          $('#loader').fadeOut('slow');  
      });
      //remove the timeout
      //$('#loader').fadeOut('slow'); 
  });
</script>

</head>

<body style="padding:0px; margin:0px; background-color:#fff;font-family:arial,helvetica,sans-serif,verdana,'Open Sans'">
  <?php 

     require_once("include/connection.php");


   $id = mysqli_real_escape_string($conn,$_SESSION['email_address']);


  $r = mysqli_query($conn,"SELECT * FROM login_user where id = '$id'") or die (mysqli_error($con));

  $row = mysqli_fetch_array($r);

   $id=$row['email_address'];
   // $fname=$row['fname'];
   // $lname=$row['lname'];

?>
  <!-- Start your project here-->
<!--Navbar -->
<nav class="mb-1 navbar navbar-expand-lg navbar-dark default-color fixed-top">
    <a class="navbar-brand" href="#"><img src="js/img/mm.png" width="33px" height="33px"> <font color="#F0B56F">E</font>-<font color="#F0B56F">F</font>ile<font color="#F0B56F"> S</font>ystem</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4"
    aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
    <ul class="navbar-nav ml-auto">
      <!-- <li class="nav-item active">
        <a class="nav-link" href="#">
          <i class="fab fa-facebook-f"></i> Facebook
          <span class="sr-only">(current)</span>
        </a>
      </li>-->
   
      <li class="nav-item dropdown">
        <a style="text-transform:capitalize"class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">
           <font color="black"><i class="fas fa-user-circle"></i> Welcome <?php echo $_SESSION['name'];  ?>!</font> <?php echo ucwords(htmlentities($id)); ?><i class="fas fa-sign-in-alt"></i> Login </a>
        <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
          <a class="dropdown-item" href="history_log.php"> <i class="fas fa-chalkboard-teacher"></i> User Logged</a>
          <a class="dropdown-item" href="Logout.php"><i class="fas fa-sign-in-alt"></i> LogOut</a>

        </div>
      </li>
    </ul>
  </div>
</nav>
<br>
<!--/.Navbar -->
<br><Br><br>
<!-- Card -->

<?php

//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;

require_once "PHPMailer/PHPMailer.php";
require_once "PHPMailer/SMTP.php";
require_once "PHPMailer/Exception.php";



if (isset($_POST["submit"])) {
//   $name = $_POST["name"];
  $email = $_POST["email"];
//   $subject = $_POST["subject"];
  $message = $_POST["message"];
  $file=$_FILES["file"]["name"];
  if($file){
    $file_tmp=$_FILES["file"]["tmp_name"];
    $file_name=$_FILES["file"]["name"];
    move_uploaded_file($file_tmp,'./files/'.$file_name);
  }

  //Create an instance; passing `true` enables exceptions
  $mail = new PHPMailer(true);

  try {
    //Server settings
    $mail->SMTPDebug  = 0;                      //Enable verbose debug output
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'efile17342@gmail.com';                     //SMTP username
    $mail->Password   = 'frvmakbvpdekkjol';                               //SMTP password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
    $mail->Port       = 465;   
    $mail->SMTPSecure = "ssl";                                 //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    //Email Settings
    $mail->isHTML(true);
    $mail->setFrom('efile17342@gmail.com');
    // $mail->Subject($_POST['subject']);
    $mail->addAttachment("./files/".$file_name);
    $mail->addAddress($email); //enter you email address
    $mail->Body = $message;
    $mail->send();
    echo "<script type='text/javascript'>alert('Email has been sent')</script>";
  } 
  catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
  }
}
?>
<div class="container">
   
  <div class="row">
   
     <div class="col-md-9">
     <a class="btn btn-success mb-5" style="margin-left:200px" href="home.php">Back to Home</a>
     <div class="card" style="width:50%;display:block;margin:0 auto;padding:20px">
     <h3 class="text-center mt-3 mb-3">Email Sent Form</h3>
     <form method="post" action="" enctype="multipart/form-data">
    <div class="form-group">
        <label>Email To</label>
        <input type="email" name="email" class="form-control"  placeholder="Email address" required="">
    </div>
    <div class="form-group">
        <label>Email Body</label>
        <textarea name="message" class="form-control" placeholder="Write your message here" required=""></textarea>
    </div>
    <div class="form-group">
        <label>File Attachment</label>
        <input type="file" name="file" class="form-control" required="">
    </div>
    <div class="submit">
        <input type="submit" name="submit" class="btn btn-primary" value="SEND EMAIL">
    </div>
</form>
     </div>
<div style="margin-top:20px">
 

      </div>
    </div>
 
  

</script>


 <div class="col-md-3" style="border-top: 4px solid #17a2b8;border-radius: 4px;  box-shadow: 0px 1px 1px 0px  #6c757d;"><br>
  <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
      aria-controls="pills-home" aria-selected="true">Profile</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab"
      aria-controls="pills-profile" aria-selected="false">About</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="pills-contact-tab"  href="showcomment.php" role="tab"
      aria-controls="pills-contact" aria-selected="false">Comment</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab"
      aria-controls="pills-contact" aria-selected="false">Your Coment</a>
  </li>
</ul>
<div class="tab-content pt-2 pl-1" id="pills-tabContent">
  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
    <img style="width:150px;height:100px;objecct-fit:cover" src="../Private_Dashboard/media/users/<?php echo $_SESSION['image'];  ?>" class="rounded" alt="..."><hr>
    <div class="">
     
     <div class=""><p style="text-transform: capitalize;"><b style="font-size: 1.1em;">Full Name:</b><?php echo $_SESSION['name']; ?></p></div>
     <div class=""><p><b style="font-size: 1.1em;">Email:</b><?php echo $_SESSION['email']; ?></p></div>   
     <div class=""><p style="text-transform: uppercase;"><b style="font-size: 1.1em;">Department :</b><?php echo $_SESSION['department']; ?></p></div>
 

  </div>
  <hr>
  </div>
  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
   <h6 style="font-size: 1.1em">E-Filing System (EFS)</h6><Hr>
  is a system (based on computer programs in the case of the management of digital documents) used to track, manage and store documents and reduce paper. Most are capable of keeping a record of the various versions created and modified by different users (history tracking).</div>
  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
  <?php  
    require_once("include/connection.php");
    if(isset($_POST['add'])){
      $user_id= $_POST['user_id'];
      $user_name=$_POST['user_name'];
      $user_email= $_POST['user_email'];
      $user_comment= $_POST['user_comment'];

      $conn->query("INSERT INTO comments(user_id,user_name,user_email,user_comment)VALUES('$user_id','$user_name','$user_email','$user_comment')");
      echo "<script type='text/javascript'>document.location='../private_user/home.php'</script>";
  
    }
  
  ?>

   <form action="" method="POST">
    <input type="hidden" name="user_id" value="<?php echo $_SESSION['id'];?>"></input>
    <input type="hidden" name="user_name" value="<?php echo $_SESSION['name'];?>"></input>
    <input type="hidden" name="user_email" value="<?php echo $_SESSION['email'];?>"></input>
    <label>My Comment</label>
    <textarea id="w3review" name="user_comment" style="width:100%"></textarea>
    <button type="submit" name="add" class="btn btn-primary">Submit</submit>

   </form>
</div><hr><br>
<!--   <div class="card">
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Cras justo odio</li>
    <li class="list-group-item">Dapibus ac facilisis in</li>
    <li class="list-group-item">Vestibulum at eros</li>
  </ul>
</div><br> -->
   <!-- Card -->
<div class="card" style="border-top: 4px solid #17a2b8;border-radius: 4px;">

  <!-- Card image -->
  <div class="view overlay">

      <div class="mask rgba-white-slight"></div>
    </a>
  </div>

  <!-- Card content -->
  <div class="card-body">

    <!-- Title -->
    <h4 class="card-title">File Document</h4><hr>
    <!-- Text -->

    <ul>
      <li> <p>Ensuring changes and revisions are clearly identified</p></li>
      <li> <p>Ensuring that documents remain legible and identifiable</p></li>
      <li> <p>Preventing “unintended” use of obsolete documents</p></li>
    </ul>
    <!-- Button -->
<!--     <a href="#" class="btn btn-primary">Button</a> -->

  </div>

</div>
<!-- Card -->

 </div>
</div>
</div>


<!-- Card -->
  <!-- /Start your project here-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="js/jquery-3.4.0.min.js"></script>

  <script type="text/javascript" src="js/popper.min.js"></script>

  <script type="text/javascript" src="js/bootstrap.min.js"></script>

  <script type="text/javascript" src="js/mdb.min.js"></script>
  <script type="text/javascript" charset="utf-8">
  $(document).ready(function(){
      $('#dtable').dataTable({
                "aLengthMenu": [[5, 10, 15, 25, 50, 100 , -1], [5, 10, 15, 25, 50, 100, "All"]],
                "iDisplayLength": 10
                //"destroy":true;
            });
  })
    </script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css"/>   
<script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/1.0.3/css/dataTables.responsive.css">
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/1.0.3/js/dataTables.responsive.js"></script>

</body>
</html>
