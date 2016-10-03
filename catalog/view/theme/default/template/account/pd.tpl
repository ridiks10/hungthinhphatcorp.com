<?php 
   $self -> document -> setTitle($lang['heading_title']); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="wraper container-fluid">
   <div class="page-title">
      <h3 class="title"><?php echo $lang['heading_title'] ?></h3>
   </div>
   <!-- Form-validation -->

   <div class="row">
      <div class="col-md-12">
         <div class="panel panel-default">
            <div class="panel-heading">

               <h3 class="panel-title pull-left"><?php echo $lang['text_register_user'] ?></h3>
               <div class="options pull-right">
                  <div class="btn-toolbar">
                     <a href="<?php echo $self -> url -> link('account/pd/create', '', 'SSL'); ?>" class="btn btn-default"><i class="fa fa-fw fa-plus"></i><?php echo $lang['text_button_create'] ?></a>
                  </div>
               </div>
               <div class="clearfix"></div>
            </div>
            <?php if(count($pds) > 0){ ?>
            <div class="panel-body">
               <div class="row">
                  <?php $num = 1; foreach ($pds as $value => $key): ?>
                  <!--  <?php  if(intval($self -> countDay($key['id'])) === 1) { ?>
                     YEsssssssssssssss
                     <?php } ?> -->
                  <!--  <div class="col-md-4 col-xs-12">
                     <div class="panel-provide">
                        <div class="provide-heading">
                           <h4 style="padding-top:0px">PD amount: <code><?php echo ($key['filled']/100000000); ?> <i class="fa fa-btc" aria-hidden="true"></i> </code></h4>
                           <h5>Date: <?php echo date("m/d/Y H:i:A", strtotime($key['date_added'])); ?></h5>
                        </div>
                        <div class="provide-info">
                           <!--  <span class="text-danger time-out" data-countdown="<?php echo $key['date_finish'] ?>">
                              </span> 
                           <p>PD Number: <?php echo $key['pd_number'] ?></p>
                           <p>Profit: <code><?php echo floatval(($key['max_profit']/100000000)); ?> <i class="fa fa-btc" aria-hidden="true"></i> </code></p>
                           <h4 data-title="TIME REMAIN" style="color:red; font-size:15px;" class="text-danger countdown" data-countdown="<?php echo intval($key['status']) == 0 ? $key['date_finish_forAdmin'] : $key['date_finish']; ?>">
                           </h4>
                           <p>Status: <?php switch ($key['status']) {
                        case 0:
                            echo '<span class="label label-default">Waitting</span>';
                            break;
                        case 1:
                            echo '<span class="label label-info">Active</span>';
                            break;
                        case 2:
                            echo '<span class="label label-success">Finish</span>';
                            break;
                        case 3:
                            echo '<span class="label label-danger">Report</span>';
                            break;
                        } ?></p>
                           <?php if (intval($key['status']) == 0 ){ ?>
                           <p>Transfer: <a class="label <?php switch ($key['status']) {
                        case 0:
                            echo 'label-default';
                            break;
                        case 1:
                            echo 'label-info';
                            break;
                        case 2:
                            echo 'label-success';
                            break;
                        case 3:
                            echo 'label-danger';
                            break;
                        } ?>" href="<?php echo intval($key['status']) == 0 ? $self -> url -> link('account/pd/trade', 'token='.$key["id"].'', 'SSL') : 'javascript:;' ?>">Send BTC</a></p>
                           <?php } ?>
                           <?php if (intval($key['status']) == 2 && intval($key['check_withdrawal']) == 0 ){ ?>
                          
                           <?php } ?>
                        </div>
                     </div>
                     </div> -->
                  <?php endforeach; ?>
                  <table id="datatable" class="table table-striped table-bordered">
                     <thead>
                        <tr>
                           <th class="text-center"><?php echo $lang['NO'] ?>.</th>
                           <th><?php echo $lang['ACCOUNT'] ?></th>
                           <th><?php echo $lang['DATE_CREATED'] ?></th>
                           <th><?php echo $lang['PD_NUMBER'] ?></th>
                           <th><?php echo $lang['FILLED'] ?></th>
                           <th><?php echo $lang['MAX_PROFIT'] ?></th>
                           <th><?php echo $lang['STATUS'] ?></th>
                 <th><?php echo $lang['TIME_REMAIN'] ?></th>
                           <!-- <th><?php echo $lang['action'] ?></th> -->
                        </tr>
                     </thead>
                     <tbody>
                        <?php $num = 1; foreach ($pds as $value => $key){ ?>
                        <tr>
                           <td data-title="<?php echo $lang['NO'] ?>." align="center"><?php echo $num ?></td>
                           <td data-title="<?php echo $lang['ACCOUNT'] ?>"><?php echo $key['username'] ?></td>
                           <td data-title="<?php echo $lang['DATE_CREATED'] ?>"><?php echo date("d/m/Y", strtotime($key['date_added'])); ?></td>
                           <td data-title="<?php echo $lang['PD_NUMBER'] ?>">PD<?php echo $key['pd_number'] ?></td>
                           <td data-title="<?php echo $lang['FILLED'] ?>"><?php echo floatval($key['filled']/100000000); ?> BTC</td>
                           <td data-title="<?php echo $lang['MAX_PROFIT'] ?>"><?php echo ($key['max_profit']/100000000); ?> BTC</td>
                           <td data-title="<?php echo $lang['STATUS'] ?>" class=""> 
                              <?php
                                 switch ($key['status']) {
                                     case 0:
                                         echo '<span class="label label-inverse">Waitting</span>';
                                         break;
                                     case 1:
                                         echo '<span class="label label-info">Active</span>';
                                         break;
                                     case 2:
                                         echo '<span class="label label-success">Finish</span>';
                                         break;
                                     case 3:
                                         echo '<span class="label label-danger">Report</span>';
                                         break;
                                 }
                                 ?> 
                           </td>
                            
                          <td data-title="<?php echo $lang['TIME_REMAIN'] ?>"> <span style="color:red; font-size:15px;" class="text-danger countdown" data-countdown="<?php echo intval($key['status']) == 0 ? $key['date_finish_forAdmin'] : $key['date_finish']; ?>">
                              </span> 
                           </td>
                           
                       <!--  <td>
                        <?php if(intval($key['status']) === 0) { ?>
                          <a class="label <?php switch ($key['status']) {
                        case 0:
                            echo 'label-default';
                            break;
                        case 1:
                            echo 'label-info';
                            break;
                        case 2:
                            echo 'label-success';
                            break;
                        case 3:
                            echo 'label-danger';
                            break;
                        } ?>" href="<?php echo intval($key['status']) == 0 ? $self -> url -> link('account/price/payconfirm', 'token='.$key["pd_number"].'', 'SSL') : 'javascript:;' ?>">Send BTC</a>
                        <?php } else { ?>
                            &nbsp;
                        <?php }?>
                        
                      </td> -->
                        </tr>
                        <?php $num++; } ?>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
         <?php } ?>
      </div>
   </div>
</div>
<!-- End Row -->
<!-- End row -->
</div>
<?php echo $self->load->controller('common/footer') ?>