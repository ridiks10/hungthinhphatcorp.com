
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
      <base href="<?php echo $base ?>" />
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
   label{
      margin-top: 10px;
   }
   ul#suggesstion-box {
    position: absolute;
    width: 94%;
    background: #fff;
    color: #000;
}
#suggesstion-box li.list-group-item {
    cursor: pointer;
}
#suggesstion-box li.list-group-item:hover {
    background: #626f78;
    cursor: pointer;
    color: #fff;
}
</style>
   <div id="fakeloader"></div>
<div id="bg-register">
<div id="register-container" class="clearfix" style="max-width:1050px; margin:4% auto; background: rgba(40, 57, 70, 0.72); color: #fff; margin-bottom: 7%;">
<div class="container">
  
   <div class="frm-registers" >
     
      <form id="register-account" action="<?php echo $action; ?>" class="form-horizontal" method="post" novalidate="novalidate">
       
      
         
            
               <div class="logobox" style="margin-bottom:20px;">
                <p class="text-center">
                    <a href="#">
                        <!-- <img src="catalog/view/theme/default/image/no_logo.png" width="100"> -->HUNGTHINHPHATCORP.COM
                    </a>
                </p>
            </div>
              
               <div class="col-md-6">
                   <h3>THÔNG TIN ĐĂNG KÝ </h3>
                  <div class="control-group ">
                     <div class="controls">
                        <label for="">Họ và tên</label>
                           <input class="form-control" placeholder='Họ và tên' name="firstname" id="firstname">
                           <span id="firstname-error" class="field-validation-error" style="display: none;">
                           <span id="firstname-error">Vui lòng nhập họ tên</span>
                           </span>
                     </div>
                  </div>
                  <div class="control-group ">
                     <div class="controls">
                         <label for="">Địa chỉ</label>
                           <input class="form-control" placeholder='Địa chỉ' name="address" id="address">
                           <span id="address-error" class="field-validation-error" style="display: none;">
                           <span id="address-error">Vui lòng nhập địa chỉ</span>
                           </span>
                     </div>
                  </div>
                  <div class="control-group ">
                     <div class="controls">
                         
                           <input type="hidden" name="code" value="<?php echo $self->request->get['code']; ?>">
                           <input class="form-control" name="username" id="username" value="wert" data-link="<?php echo $actionCheckUser; ?>" placeholder='User Name' type="hidden">
                           <span id="user-error" class="field-validation-error" style="display: none;">
                           <span>Please enter user name</span>
                           </span>
                     </div>
                  </div>
                  <div class="control-group ">
                     <div class="controls">
                      
                       <label for="">Email</label>
                           <input class="form-control" placeholder='Email' name="email" id="email" data-link="<?php echo $actionCheckEmail; ?>">
                           <span id="email-error" class="field-validation-error" style="display: none;">
                           <span id="Email-error">Vui lòng nhập email</span>
                           </span>
                        
                     </div>
                  </div>
                  <div class="control-group ">
                     <div class="controls">
                        
                      <label for="">Số điện thoại</label>
                           <input class="form-control" placeholder="Số điện thoại" name="telephone" id="phone" data-link="<?php echo $actionCheckPhone; ?>">
                           <span id="phone-error" class="field-validation-error" style="display: none;">
                           <span>Vui lòng nhập số điện thoại</span>
                           </span>
                        
                     </div>
                  </div>
                  <div class="control-group ">
                     <div class="controls">
                       
                        <label for="">Số CMND</label>
                           <input class="form-control" placeholder='CMND' name="cmnd" id="cmnd" data-link="<?php echo $actionCheckCmnd; ?>">
                           <span id="cmnd-error" class="field-validation-error" style="display: none;">
                           <span id="CardId-error">Vui lòng nhập số CMND.</span>
                           </span>
                       
                     </div>
                  </div>
                  <div class="control-group ">
                     <div class="controls">
                       
                        <input class="form-control" value="230" placeholder='Password For Login' id="country" name="country_id" type="hidden">
                           
                           <span id="country-error" class="field-validation-error" style="display: none;">
                           <span>The country field is required.</span>
                           </span>
                       
                     </div>
                  </div>
                  <div class="control-group ">
                     <div class="controls">
                         <label for="">Mật khẩu</label>
                           <input class="form-control" value="" placeholder='Password For Login' id="password" name="password" type="password">
                           <span id="password-error" class="field-validation-error" style="display: none;">
                           <span>Please enter password for login</span>
                           </span>
                        
                     </div>
                  </div>
                  <div class="control-group ">
                     <div class="controls">
                      <label for="">Nhập lại mật khẩu</label>
                 
                           <input class="form-control valid" value ="" placeholder='Repeat Password For Login' id="confirmpassword" type="password">
                           <span id="confirmpassword-error" class="field-validation-error" style="display: none;">
                           <span>Repeat Password For Login not correct</span>
                           </span>
                    
                     </div>
                  </div>
                  <div class="control-group ">
                     <div class="controls">
                     
                       
                           <input class="form-control" value="1" id="password2" placeholder='Transaction Password' name="transaction_password" type="hidden">
                           <span id="password2-error" class="field-validation-error" style="display: none;">
                           <span>Please enter transaction password</span>
                           </span>
                    
                     </div>
                  </div>
                  <div class="control-group ">
                     <div class="controls">
                       
                       
                           <input class="form-control valid" value="1" placeholder='Repeat Transaction Password' id="confirmpasswordtransaction" type="hidden">
                           <span id="confirmpasswordtransaction-error" class="field-validation-error" style="display: none;">
                           <span>Repeat Transaction Password is not correct</span>
                           </span>
                    
                     </div>
                  </div>
                 
   </div>
   <div class="col-md-6">
        <h3>THÔNG TIN ĐĂNG KÝ CÂY HỆ THỐNG</h3>
      
        <div class="">
          <label for="">Người bảo trợ (ID)</label>

          <input type="text" autocomplete="off" class="form-control" id="p_node" name="p_node" placeholder="Người bảo trợ">
          <ul id="suggesstion-box" class="list-group"></ul>

           <span id="p_node-error" class="field-validation-error">
              <span></span>
          </span>
        </div>
       
    
        <div class="">
          <label for="">Người chỉ định (ID)</label>
          <input type="text" class="form-control" id="p_binary" name="p_binary" placeholder="Nhánh" required="required">
         <!--   <ul id="p_binary-box" class="list-group"></ul> -->
          <span id="p_binary-error" class="field-validation-error">
              <span></span>
          </span>
        </div>
        <div class="">
          <label for="">Vị trí (Trái/Phải)</label>
          <select name="postion" id="postion" class="form-control" required="required" data-link="<?php echo $check_p_binary; ?>">
            <option value="">Chọn vị trí</option>
           
          </select>
        </div>
        </div>
        <div class="col-md-6 col-md-offset-5">
     
          <div class="control-group" style="
    margin-top: 20px;
">
                     <div class="controls">
                         <input id="agreeTerm" type="checkbox" value="true">
                           <label for="agreeTerm">Đồng ý với các Điều khoản và Điều kiện của chúng tôi</label>

                     </div>
                  </div>
                  <button type="submit" class="btn btn-primary" style="
    width: 200px;
">Đăng ký</button>
      </div>
                 
            
       
        
        
      </form>
   </div>
  
</div>
<style type="text/css">
   footer, .header-logo{display: none !important;}
   .container{padding-top: 10px;}
</style>
<script type="text/javascript">
   
   $(function() {
       $('#p_binary').on('keyup', function() {
          $('#postion').empty();

           $.ajax({
                url: $('#postion').data('link'),
               type : 'GET',
                data : {
                            p_binary : $('#p_binary').val()
                       },
             
               success : function(result) {
                  result = $.parseJSON(result);
   $('#postion').empty();
                  $('#postion').append(result.html);
               }
           });
           return false;
       });
   });

    $(document).ready(function(){
        $("#p_node").keyup(function(){
            $.ajax({
            type: "POST",
            url: "<?php echo $getaccount;?>",
            data:'keyword='+$(this).val(),        
            success: function(data){
                $("#suggesstion-box").show();
                $("#suggesstion-box").html(data);
                $("#p_node").css("background","#FFF");            
            }
            });
        });
    }); 
    function selectU(val) {
        $("#p_node").val(val);
        $("#suggesstion-box").hide();
    }
   </script>

</body>
</html>
