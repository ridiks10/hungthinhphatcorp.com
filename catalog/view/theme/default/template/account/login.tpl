<!DOCTYPE html>
<html lang="en">

<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <link rel="shortcut icon" href="img/favicon_1.ico">

        <title>Login</title>
       <script src="catalog/view/javascript/jquery.js"></script>
        <script src="catalog/view/javascript/bootstrap.min.js"></script>
        <script src="catalog/view/javascript/pace.min.js"></script>
    <script src="catalog/view/javascript/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="catalog/view/javascript/jquery.app.js"></script>
      <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:100,300,400,600,700,900,400italic' rel='stylesheet'>
      <!-- Bootstrap core CSS -->
      <link href="catalog/view/theme/default/css/bootstrap.min.css" rel="stylesheet">
      <link href="catalog/view/theme/default/css/bootstrap-reset.css" rel="stylesheet">
      <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
      <link href="catalog/view/theme/default/css/style.css" rel="stylesheet">
      <link href="catalog/view/theme/default/css/helper.css" rel="stylesheet">
      <link href="catalog/view/theme/default/css/style-responsive.css" rel="stylesheet" >
      <script src="catalog/view/javascript/jquery.form.min.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/alertifyjs/alertify.js" type="text/javascript"></script> 
        <link href="catalog/view/theme/default/css/al_css/alertify.css" rel="stylesheet">
    </head>


    <body style="background: #1a2942" class="login_new">

        <img id="logo_login" src="images/logo.png" alt="" style="position:absolute; left: 10px;">
        <div id="top_login" style="position:absolute; right: 4%; color: #fff; top:30px; text-align: right">
          <h1 style="font-size: 30px;"">HƯNG THỊNH PHÁT</h1>
          <p>Add: Số 8 Mỹ phú 2C, Khu Mỹ Phú 2, P.Tân Phú, Q.7, HCM</p>
          <p>Email: hungthinhphat290816@gmail.com</p>
          <p>Phone: <span style="font-size: 20px;">0903 068 199</span></p>
        </div>  
        <div class="wrapper-page animated fadeInDown" id="frm_lg">
            <div class="panel panel-color panel-primary frm_login" style="background:#edf0f0 !important">
                <div class="panel-heading"> 
                   <h3 class="text-center m-t-10"> HUNGTHINHPHATCORP.COM</h3>
                </div> 

                <form action="<?php echo $action; ?>" method="post" class="form-horizontal m-t-40">
                                            
                    <div class="form-group ">
                        <div class="col-xs-12">
                            
                           
                                        <input type="text" name="email" value="<?php echo $email; ?>" placeholder="User name" id="input-email" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group ">
                        
                        <div class="col-xs-12">
                          
                                        <input type="password" name="password" value="<?php echo $password; ?>" placeholder="Password" id="input-password" class="form-control" />
                        </div>
                    </div>

                 
                    <div class="form-group text-right">
                        <div class="col-xs-12">
                            <!-- <input type="submit" value="Login" class="btn-login" /> -->
                            <button class="btn btn-purple w-md" type="submit">Log In</button>
                        </div>
                    </div>
                    <div class="form-group m-t-30">
                        <div class="col-sm-7">
                         
                            <a href="<?php echo $forgotten; ?>"><i class="fa fa-lock m-r-5"></i> Forgot your password</a>
                        </div>
                       
                    </div>
                <div class="form-group m-t-30">
                         <?php if ($redirect) { ?>
                                    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                                    <?php } ?>
                                </div>
                                 <?php if ($success) { ?>
                                    <div class="alert alert-success"><i class="fa fa-check-circle"></i>
                                        <?php echo $success; ?>
                                    </div>
                                    <?php } ?>
                                    <?php if ($error_warning) { ?>
                                    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>
                                        <?php echo $error_warning; ?>
                                    </div>
                                <?php } ?>
                    </div>
                </form>

            </div>
        </div>


     


    
    </body>

</html>
<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Create user successfull !!!');
   }
   
</script>
