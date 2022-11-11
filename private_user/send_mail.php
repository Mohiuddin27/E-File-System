<?php

//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;

require_once "PHPMailer/PHPMailer.php";
require_once "PHPMailer/SMTP.php";
require_once "PHPMailer/Exception.php";



if (isset($_POST["submit"])) {
  $name = $_POST["name"];
  $email = $_POST["email"];
  $subject = $_POST["subject"];
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
<!DOCTYPE html>
<html>
    <head><title>Send attachment on email</title></head>
    <body>
        

 
<!-- Display contact form -->
<form method="post" action="" enctype="multipart/form-data">
    <div class="form-group">
        <input type="text" name="name" class="form-control"  placeholder="Name" required="">
    </div>
    <div class="form-group">
        <input type="email" name="email" class="form-control"  placeholder="Email address" required="">
    </div>
    <div class="form-group">
        <input type="text" name="subject" class="form-control"  placeholder="Subject" required="">
    </div>
    <div class="form-group">
        <textarea name="message" class="form-control" placeholder="Write your message here" required=""></textarea>
    </div>
    <div class="form-group">
        <input type="file" name="file" class="form-control">
    </div>
    <div class="submit">
        <input type="submit" name="submit" class="btn" value="SEND MESSAGE">
    </div>
</form>
 
</body>
 
</html>
 