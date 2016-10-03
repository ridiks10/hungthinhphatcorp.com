<?php 
   $self -> document -> setTitle($lang['createPD']); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="wraper container-fluid">
   <div class="page-title">
      <h3 class="title"><?php echo $lang['createPD'] ?></h3>
   </div>
   <!-- Form-validation -->

   <div class="row">
      <div class="col-md-12">
         <div class="panel panel-default">
            <div class="panel-heading">
               <h3 class="panel-title"><?php echo $lang['text_button_create'] ?></h3>
            </div>
            <div class="panel-body">
       
                <?php if($wallet) { ?>
               <div class="row">
                  <div class="col-md-12">
                     <div class="alert  alert-success alert-edit-account" style="display:none">
                        <i class="fa fa-check"></i> <?php echo $lang['ok'] ?>.
                     </div>
                     <div id="checkPD-error" class="alert alert-dismissable alert-danger" style="display:none">
                     </div>
                     <div id="checkWaiting-error" class="alert alert-dismissable alert-danger" style="background-color: rgba(255, 0, 0, 0.09); display:none">
                     </div>
                  </div>
                  <div class="col-md-12 col-sm-12 col-xs-12">
                     <form id="submitPD" class="form-horizontal margin-none" name="buy_share_form" action="<?php echo $self -> url -> link('account/pd/submit', '', 'SSL'); ?>" method="post" novalidate="novalidate">
                     <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo $lang['amount']?></label>
                        <div class="col-md-8">
                           <select class="form-control valid" id="amount" name="amount">
                              <option value=""><?php echo $lang['choise']?></option>
                              <option value="0.5"> 0.5 BTC</option>
                              <option value="1">1 BTC</option>
                              <option value="5">5 BTC</option>
                             <!-- <?php if ($count == 0): ?>
                              <option value="2400000"><?php echo number_format("2400000")."<br>"; ?> VND</option>
                              <?php elseif ($count == 1): ?>
                              <option value="2800000"><?php echo number_format("2800000")."<br>"; ?> VND</option>
                              <?php else: ?>
                              <option value="3200000"><?php echo number_format("3200000")."<br>"; ?> VND</option>
                              <?php endif; ?> -->
                           </select>
                           <span id="amount-error" class="field-validation-error" style="display: none;">
                           <span ><?php echo $lang['err_amount'] ?>.</span>
                           </span>
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo $lang['password']?></label>
                        <div class="col-md-8">
                           <input class="form-control" id="Password2" name="Password2" type="password"/>
                           <span id="Password2-error" class="field-validation-error" style="display: none;">
                           <span >The transaction password field is required.</span>
                           </span>
                        </div>
                     </div>
                     <div class="control-group form-group">
                        <div class="controls">
                           <div class="col-md-offset-3 ">
                              <div class="loading"></div>
                              <button type="submit" class="btn-register btn btn-primary"> <?php echo $lang['text_button_create'] ?></button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
                <?php } else {?>
                  <div class="row">
                     <div class="col-md-12">
                        <div class="alert alert-danger">
                           <strong>Important!</strong> Please add your "bitcoin wallet address to initialize your account.
                           <p><a href="<?php echo $self -> url -> link('account/setting', '', 'SSL'); ?>"><i class="fa fa-cog"></i> Profile</a></p>
                        </div>
                        <div class="alert alert-warning">
                           <strong>Note!</strong> "Bitcoin wallet address "use to transfer Bitcoin when you perform transaction"
                        </div>
                     </div>
                  </div>
               <?php }?>
            </div>
         </div>
      </div>
   </div>
   <!-- End Row -->
   <!-- End row -->
</div>
<script type="text/javascript">
   
window.err_password = '<?php echo $lang['err_password'] ?>';

window.err_pd = '<?php echo $lang['err_pd'] ?>';

window.err_pin = '<?php echo $lang['err_pin'] ?>';
window.err_account = '<?php echo $lang['err_account'] ?>';


window.err_password_2 = '<?php echo $lang['err_password_2'] ?>';

</script>
<?php echo $self->load->controller('common/footer') ?>