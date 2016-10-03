
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="ltr" lang="en" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="ltr" lang="en" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<!--[if gt IE 9]><!--> <html class="gt-ie8 gt-ie9 not-ie"> <!--<![endif]-->
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
   
   <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
   <title>  </title>
      <meta http-equiv="cache-control" content="no-cache"/>
      <base href="http://localhost/mmo/bitwonder/" />
               <!-- Open Sans font from Google CDN -->
   <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300&amp;subset=latin" rel="stylesheet" type="text/css">
   <link rel="icon" href="catalog/view/theme/default/image/favicon.png">

     <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <script src="catalog/view/javascript/loading.js" type="text/javascript"></script>
  <link href="catalog/view/theme/default/stylesheet/fakeloader.css" rel="stylesheet">
    
      <script src="catalog/view/javascript/register/register.js" type="text/javascript"></script>

 
   <link href="catalog/view/theme/default/assets/stylesheets/stylesheet.css" rel="stylesheet" type="text/css">
   



            
                  <script type="text/javascript">
           
         window.funLazyLoad = {
            start : function() {
               $("#fakeloader").fakeLoader({
                  timeToHide : 99999999999, //Time in milliseconds for fakeLoader disappear
                  zIndex : "999", //Default zIndex
                  spinner : "spinner2",
                  bgColor : "rgba(0,0,0,0.5)", //Hex, RGB or RGBA colors
               });
            },
            reset : function() {
               $("#fakeloader").hide();
            },
            show : function() {
               $("#fakeloader").show();
            }
         }

      </script>
 
   </head>

<body>
<style>
   .account-personal-add_customer{
   background:url('catalog/view/theme/default/images/blur.png');
   background-size: cover;
   background-repeat: no-repeat;
   }
   body{
      background: url('catalog/view/theme/default/assets/images/bg.png');
      background-repeat: no-repeat;
   color:#312d0d !important;
   }
   @media (max-width: 768px){
   .panel.panel-default, .panel-default > .panel-heading {
   background: rgba(255, 255, 255, 0.74) !important;
   }
   }
</style>
   <div id="fakeloader"></div>
<div id="bg-register">
<div id="register-container" class="clearfix" style="max-width:450px; margin:4% auto; background: rgba(40, 57, 70, 0.72); color: #fff; margin-bottom: 7%;">
<div class="container">
  
   <div class="frm-registers" >
      <?php if(!$p_binary) { ?>
      <form id="register-account" action="<?php echo $self -> url -> link('account/register', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
         <?php  } else { ?>
      <form id="register-account" action="<?php echo $self -> url -> link('account/personal/replace_submit', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
         <?php }?>
         <?php if($p_binary) { ?>
         <input type="hidden" name="p_binary" value="<?php echo $p_binary ?>"/>
         <input type="hidden" name="postion" value="<?php echo $postion ?>">
         <?php } ?>
         <?php
            if(intval($self -> checkBinaryLeft($self->request->get['p_binary'], $self->request->get['postion'])) === 1) { ?>
       
            
               <div class="logobox" style="margin-bottom:20px;">
                <p class="text-center">
                    <a href="#">
                        <img src="catalog/view/theme/default/image/no_logo.png" width="100">
                    </a>
                </p>
            </div>
              
               <div class="col-md-12">
                  <div class="control-group form-group">
                     <div class="controls">
                           <input class="form-control" placeholder='Fullname' name="firstname" id="firstname">
                           <span id="firstname-error" class="field-validation-error" style="display: none;">
                           <span id="firstname-error">Please enter Full Name</span>
                           </span>
                     </div>
                  </div>
                  <div class="control-group form-group">
                     <div class="controls">
                           <input class="form-control" placeholder='Address' name="address" id="address">
                           <span id="address-error" class="field-validation-error" style="display: none;">
                           <span id="address-error">Please enter Address</span>
                           </span>
                     </div>
                  </div>
                  <div class="control-group form-group">
                     <div class="controls">
                           <input type="hidden" name="node" value="<?php echo $self->request->get['token']; ?>">
                           <input class="form-control" name="username" id="username" value="" data-link="<?php echo $actionCheckUser; ?>" placeholder='User Name'>
                           <span id="user-error" class="field-validation-error" style="display: none;">
                           <span>Please enter user name</span>
                           </span>
                     </div>
                  </div>
                  <div class="control-group form-group">
                     <div class="controls">
                      
                       
                           <input class="form-control" placeholder='Email Address' name="email" id="email" data-link="<?php echo $actionCheckEmail; ?>">
                           <span id="email-error" class="field-validation-error" style="display: none;">
                           <span id="Email-error">Please enter Email Address</span>
                           </span>
                        
                     </div>
                  </div>
                  <div class="control-group form-group">
                     <div class="controls">
                        
                      
                           <input class="form-control" placeholder="Phone Number" name="telephone" id="phone" data-link="<?php echo $actionCheckPhone; ?>">
                           <span id="phone-error" class="field-validation-error" style="display: none;">
                           <span>Please enter Phone Number</span>
                           </span>
                        
                     </div>
                  </div>
                  <div class="control-group form-group">
                     <div class="controls">
                       
                       
                           <input class="form-control" placeholder='Citizenship Card/Passport No' name="cmnd" id="cmnd" data-link="<?php echo $actionCheckCmnd; ?>">
                           <span id="cmnd-error" class="field-validation-error" style="display: none;">
                           <span id="CardId-error">The Citizenship card/passport no field is required.</span>
                           </span>
                       
                     </div>
                  </div>
                  <div class="control-group form-group">
                     <div class="controls">
                        
                       
                           <select class="form-control" id="country" name="country_id">
                              <option value="">-- Choose your Country --</option>
                              <?php foreach ($country as $key=> $value) {?>
                              <option value="<?php echo $value['id'] ?>">
                                 <?php echo $value[ 'name'] ?>
                              </option>
                              <?php } ?>
                           </select>
                           <span id="country-error" class="field-validation-error" style="display: none;">
                           <span>The country field is required.</span>
                           </span>
                       
                     </div>
                  </div>
                  <div class="control-group form-group">
                     <div class="controls">
                           <input class="form-control" placeholder='Password For Login' id="password" name="password" type="password">
                           <span id="password-error" class="field-validation-error" style="display: none;">
                           <span>Please enter password for login</span>
                           </span>
                        
                     </div>
                  </div>
                  <div class="control-group form-group">
                     <div class="controls">
                     
                 
                           <input class="form-control valid" placeholder='Repeat Password For Login' id="confirmpassword" type="password">
                           <span id="confirmpassword-error" class="field-validation-error" style="display: none;">
                           <span>Repeat Password For Login not correct</span>
                           </span>
                    
                     </div>
                  </div>
                  <div class="control-group form-group">
                     <div class="controls">
                     
                       
                           <input class="form-control" id="password2" placeholder='Transaction Password' name="transaction_password" type="password">
                           <span id="password2-error" class="field-validation-error" style="display: none;">
                           <span>Please enter transaction password</span>
                           </span>
                    
                     </div>
                  </div>
                  <div class="control-group form-group">
                     <div class="controls">
                       
                       
                           <input class="form-control valid" placeholder='Repeat Transaction Password' id="confirmpasswordtransaction" type="password">
                           <span id="confirmpasswordtransaction-error" class="field-validation-error" style="display: none;">
                           <span>Repeat Transaction Password is not correct</span>
                           </span>
                    
                     </div>
                  </div>
                  <div class="control-group form-group">
                     <div class="controls">
                        <div class="checkbox-inline">
                           <input id="agreeTerm" type="checkbox" value="true">
                           <label for="agreeTerm">Agree to our Terms and Condition</label>
                        </div>
                     </div>
                  </div>
                  <div class="text-center">
                     <div id="success"></div>
                     <button type="submit" class="btn btn-primary">Submit</button>
                  </div>
            
       
         </div>
          <?php } else { ?>
            <div class="alert alert-danger" style="margin-top:100px;">
               <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
               <strong>Warning!</strong> This branch has had! Please choose another branch!
            </div>
          <?php } ?>
      </form>
   </div>
  
</div>
<style type="text/css">
   footer, .header-logo{display: none !important;}
   .container{padding-top: 10px;}
</style>
<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Create user successfull !!!');
   }
   </script>

</body>
</html>
