
<!--end modaladmin-->
  <!--Add user-->
<div class="modal fade" id="modalRegisterForm2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
<form action="create_user.php" method="POST" enctype="multipart/form-data">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold"><i class="fas fa-user-plus"></i> Add User Employee</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
           <div class="md-form mb-5">

        </div>
        <div class="md-form mb-5">
          <i class="fas fa-user prefix grey-text"></i>
          <input type="text" id="orangeForm-name" name="name" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-name">Your name</label>
        </div>
        <div class="md-form mb-5">
          <i class="fas fa-envelope prefix grey-text"></i>
          <input type="email" id="orangeForm-email" name="email_address" class="form-control validate" required="">
          <label data-error="wrong" data-success="right" for="orangeForm-email">Your email</label>
        </div>

        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <input type="password" id="orangeForm-pass" name="user_password" class="form-control validate" required="">
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Your password</label>
        </div>
         <div class="md-form mb-4">
          <i class="fas fa-user prefix grey-text"></i>
          <input type="text" id="orangeForm-pass" name="user_status" value = "Employee" class="form-control validate" readonly="">
          <label data-error="wrong" data-success="right" for="orangeForm-pass">User Status</label>
        </div>
        <div class="md-form mb-4">
             <label> <i class="fas fa-building prefix grey-text"></i> <spam style="font-size:20px; font-weight:600;margin-left:30px">Department Name: </span></label><br><br><br>
               
                <select name="department" style="width:100%;padding:8px">
                   <option value="">--SELECT--</option>
                  <?php
                   require_once("include/connection.php");
                   $i=1;
                   $query = mysqli_query($conn,"SELECT * FROM departments ORDER BY id") or die (mysqli_error($con));
                   while($file=mysqli_fetch_array($query)){
                      // $id =  $file['id'];
                      // $name =  $file['name'];
                  
                  
                  ?>
                    <option value="<?php echo $file['name']; ?>"><?php echo strtoupper($file['name']); ?></option>
                    
                  <?php
                   }
                  ?>
                </select>

        </div>
        
       <div class="md-form">
        <label style="font-size:20px; font-weight:600;">Upload Image: </label><br><br>
        <input type="file" name="image">

        </div>
      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-info" name="reguser">Sign up</button>
      </div>
    </div>
  </div>
</div>
</form>
