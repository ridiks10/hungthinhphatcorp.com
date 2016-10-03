<?php 
   $self -> document -> setTitle('Thông Tin Tài Khoản'); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<!-- -------------------------------------------------------- -->
<div id="content-wrapper">
   <div class="row">
      <div class="col-md-12">
         <style>
            #EditProfile .list-group-item span { float: right; }
         </style>
         <div class="panel">
            <div class="panel-heading">
               <h3 class="panel-title"><?php echo $lang['heading_header'] ?></h3>
            </div>
        
            <div class="panel-body panel-custom panel-pd">
               <ul class="nav nav-tabs">
                  <li class="active">
                     <a data-toggle="tab" href="#EditProfile" ><?php echo $lang['text_account'] ?></a>
                  </li>
                  <li>
                     <a data-toggle="tab" href="#ChangePassword"><?php echo $lang['text_password'] ?></a>
                  </li>
                  
                  <li>
                     <a data-toggle="tab" href="#BitcoinWallet"><?php echo $lang['text_bank'] ?></a>
                  </li>
               </ul>
               <div class="tab-content">
                  <div class="tab-pane fade active in" id="EditProfile" data-link="<?php echo $self -> url -> link('account/setting/account', '', 'SSL'); ?>" data-id="<?php echo $self->session -> data['customer_id'] ?>" >
                     <div class="row">
                        <div class="col-md-6">
                           
                              <h3><?php echo $lang['account_detail'] ?></h3>
                              <ul class="list-group">
                                 <li class="list-group-item" id="UserName"><?php echo $lang['text_username'] ?>: <span>huuthanhphuyen</span></li>
                                 <li class="list-group-item"><?php echo $lang['Affiliate_Status'] ?>: <span><?php echo number_format($dautu) ?> VND</span></li>
                                 <li class="list-group-item" id="Date"><?php echo $lang['Affiliate_Since'] ?>: <span>28/12/2015</span></li>
                                 <li class="list-group-item" id="LastIP"><?php echo $lang['Last_Login_IP'] ?>: <span>171.250.123.121</span></li>
                                 <li class="list-group-item" id="date_add_login"><?php echo $lang['Last_Login_Time'] ?>: <span>Accepted</span></li>
                              </ul>
                          
                        </div>
                        <div class="col-md-6">
                           
                              <h3><?php echo $lang['personal_detail'] ?></h3>
                              <ul class="list-group">
                                 <li class="list-group-item" id="fullname"><?php echo $lang['full_name'] ?>: <span></span></li>
                                 <li class="list-group-item" id="Email">E-mail: <span></span></li>
                                 <li class="list-group-item" id="Address">
                                    <?php echo $lang['address'] ?>: <span style="text-align: right;">
                                    </span>
                                    <div class="clearfix"></div>
                                 </li>
                                 <li class="list-group-item" id="Country"><?php echo $lang['country'] ?>: <span></span></li>
                                 <li class="list-group-item" id="Phone"><?php echo $lang['phone'] ?>: <span>+84913452268</span></li>
                              </ul>
                          
                        </div>
                        <?php if (!empty($parrent) && intval($parrent['customer_id']) != 60) { ?>
                         
                      
                         <div class="col-md-6">
                      
                              <h3>Thông tin người bảo trợ</h3>
                              <ul class="list-group">
                                 <li class="list-group-item">ID đăng nhập: <span><?php echo $parrent['username'] ?></span></li>
                                 <li class="list-group-item">Tên: <span><?php echo $parrent['firstname'] ?></span></li>
                                 <li class="list-group-item">E-mail: <span><?php echo $parrent['email'] ?></span></li>
                                
                                 <li class="list-group-item"><?php echo $lang['phone'] ?>: <span><?php echo $parrent['telephone'] ?></span></li>
                                 <li class="list-group-item">Ngày tham gia: <span><?php echo date("d/m/Y", strtotime($parrent['date_added'])); ?></span></li>
                              <li class="list-group-item">Gói đầu tư: <span><?php echo number_format($self->goidautu($parrent['customer_id'])); ?> VND</span></li>
                            </ul>
                          
                        </div>
                         <?php  } ?>
                     </div>
                  </div>
                  <div class="tab-pane fade" id="ChangePassword">
                     <div class="row">
                        <div class="col-md-6">
                    
                              <h3><?php echo $lang['text_password'] ?></h3>
                     <form id="frmChangePassword" action="<?php echo $self -> url -> link('account/setting/editpasswd', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
                       
                           <div class="controls">
                              <label class="control-label" for="OldPassword"><?php echo $lang['text_old_password'] ?></label>
                              <input class="form-control" id="OldPassword" type="password" data-link="<?php echo $self -> url -> link('account/setting/checkpasswd', '', 'SSL'); ?>" />
                              <span id="OldPassword-error" class="field-validation-error">
                              <span></span>
                              </span>
                           </div>
                        
                        
                           <div class="controls">
                              <label class="control-label" for="Password"><?php echo $lang['text_new_password'] ?></label>
                              <input class="form-control" id="Password" name="password" type="password"/>
                              <span id="Password-error" class="field-validation-error">
                              <span></span>
                              </span>
                           </div>
                     
                    
                           <div class="controls">
                              <label class="control-label" for="ConfirmPassword"><?php echo $lang['text_confirm_password'] ?></label>
                              <input class="form-control" id="ConfirmPassword"  type="password"/>
                              <span id="ConfirmPassword-error" class="field-validation-error">
                              <span></span>
                              </span>
                           </div>
                        
                        <div class="" style="padding:0px; margin-top:10px;">
                           <div class="btn-toolbar">
                              <button type="submit" class="btn btn-primary"><?php echo $lang['text_button_password'] ?></button>
                           </div>
                        </div>
                     </form>
                
                 
                 </div>
                <!-- <div class="col-md-6">
                   
                            <!--   <h3><?php echo $lang['text_transaction_password'] ?></h3>
                     <form id="changePasswdTransaction" action="<?php echo $self -> url -> link('account/setting/edittransactionpasswd', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
                        
                           <div class="controls">
                              <label class="control-label" for="TranoldPassword"><?php echo $lang['text_old_password'] ?></label>
                              <input class="form-control" id="TranoldPassword" type="password" data-link="<?php echo $self -> url -> link('account/setting/checkpasswdtransaction', '', 'SSL'); ?>" />
                              <span id="TranoldPassword-error" class="field-validation-error">
                              <span></span>
                              </span>
                           </div>
                       
                        
                           <div class="controls">
                              <label class="control-label" for="Tranpassword"><?php echo $lang['text_new_password'] ?></label>
                              <input class="form-control" id="Tranpassword_New" name="transaction_password" type="password"/>
                              <span id="Tranpassword_New-error" class="field-validation-error">
                              <span></span>
                              </span>
                           </div>
                       
                       
                           <div class="controls">
                              <label class="control-label" for="TranConfirmPassword"><?php echo $lang['text_confirm_password'] ?></label>
                              <input class="form-control" id="TranConfirmPassword" type="password"/>
                              <span id="TranConfirmPassword-error" class="field-validation-error" style="display:none">
                              <span></span>
                              </span>
                           </div>
                       
                        <div class="" style="padding:0px; margin-top:10px;">
                           <div class="btn-toolbar">
                              <button type="submit" class="btn btn-primary"><?php echo $lang['text_button_password'] ?></button>

                            <!--   <a data-link="<?php echo $self -> url -> link('account/forgotten/resetPasswdTran', '', 'SSL'); ?>" data-id="<?php echo $self->session -> data['customer_id'] ?>" id="reset_passwdTran" href="javascript:;" class="btn btn-danger"><?php echo $lang['text_button_transaction_password'] ?></a> -->
                          <!-- </div>
                        </div>
                     </form>
                 
                 </div> -->
             </div>
                  </div>
                  
                  <div class="tab-pane" id="BitcoinWallet">
                    <div class="row">
                       
                        <div class="col-md-6">
                          
                              <h3><?php echo $lang['text_account_bank'] ?></h3>
                         
                                            <div id="Banksinfo" data-link="<?php echo $self -> url -> link('account/setting/banks', '', 'SSL'); ?>" data-id="<?php echo $self->session -> data['customer_id'] ?>">
                                                 
                                            </div>
                               

                                                        <!-- /.col-lg-6 (nested) -->
                                                        <?php if(!$banks['account_holder'] || !$banks['bank_name'] || !$banks['account_number'] || !$banks['branch_bank'] ){?>
                                                         <form id="updateBanks" action="<?php echo $self -> url -> link('account/setting/updatebanks', '', 'SSL'); ?>" method="GET" novalidate="novalidate">
                                                         <?php }?>
                                                            <div style="margin-bottom:20px">
                                                                <label for="Accountholders"><?php echo $lang['text_account_holder'] ?></label>
                                                                <input <?php echo $banks['account_holder'] ? 'readonly="true"' : ''?> class="form-control" id="Accountholders" name="account_holder" value="<?php echo $banks['account_holder'] ?>" type="text"/>
                                                                <span id="Accountholders-error" class="field-validation-error">
                                                                    <span></span>
                                                                </span>
                                                            </div>
                                                            <div style="margin-bottom:20px">
                                                                <label for="Bankname"><?php echo $lang['text_bank_name'] ?></label>
                                                                <input <?php echo $banks['bank_name'] ? 'readonly="true"' : ''?> value="<?php echo $banks['bank_name'] ?>" class="form-control" id="Bankname" name="bank_name" type="text"/>
                                                                <span id="Bankname-error" class="field-validation-error">
                                                                    <span></span>
                                                                </span>
                                                            </div>
                                                            <div style="margin-bottom:20px">
                                                                <label for="Accountnumber"><?php echo $lang['text_account_number'] ?></label>
                                                                <input <?php echo $banks['account_number'] ? 'readonly="true"' : ''?> value="<?php echo $banks['account_number'] ?>" class="form-control" id="Accountnumber" name="account_number" type="text"/>
                                                                <span id="Accountnumber-error" class="field-validation-error">
                                                                    <span></span>
                                                                </span>
                                                            </div>
                                                            <div style="margin-bottom:20px">
                                                                <label for="Branchbank"><?php echo $lang['text_branch'] ?></label>
                                                                <input <?php echo $banks['branch_bank'] ? 'readonly="true"' : ''?> value="<?php echo $banks['branch_bank'] ?>" class="form-control" id="Branchbank" name="branch_bank" type="text"/>
                                                                <span id="Branchbank-error" class="field-validation-error">
                                                                    <span></span>
                                                                </span>
                                                            </div>

                                                            <div class="loading">

                                                            </div>
                                                        <?php if(!$banks['account_holder'] || !$banks['bank_name'] || !$banks['account_number'] || !$banks['branch_bank'] ){?>
                                                            <button type="submit" class="btn btn-primary"><?php echo $lang['text_button_password'] ?></button>
                                                        </form>
                                                        <?php }?>

                                                    
                          
                        </div>
                     </div>
                    <!-- -------------------------------- -->
                     
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- ============================ -->
<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Update profile successfull !!!');
   }
   
</script>
<?php echo $self->load->controller('common/footer') ?>