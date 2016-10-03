<?php 
   $self->document->setTitle('My Support');
   echo $self->load->controller('common/header'); echo $self->load->controller('common/column_left');
   
   ?>
<div id="content-wrapper">     
    <div class="row">
      <div class="col-sm-12">
        <div class="panel">
          <div class="panel-heading">
               <div class="options pull-right">
                  <div class="btn-toolbar">
                     <a id="create_support"  data-toggle="modal" href='<?php echo $self -> url -> link('account/my_support_tickets/submit_a_ticket', '', 'SSL'); ?>' class="btn btn-default"><i class="fa fa-fw fa-plus"></i>Create New Support</a>
                  </div>
               </div>
               <span class="panel-title">Support</span>
               <div class="clearfix"></div>
          </div>
            <?php if ($pds) { ?>
          <div class="panel-body" id="no-more-tables">
            <table class="table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Code</th>
                  <th>Date</th>
                  <th>Filled</th>
                  <th>Profit</th>
                  <th>Status</th>
                  <th>Time remain</th>
                  <?php $tmp = 1; foreach ($pds as $key => $value): ?>
                  <?php if(intval($value['status']) === 0) { ?>
                  <th>Action</th>
                  <?php } ?>
                <?php endforeach; ?>
                </tr>
              </thead>
              <tbody>
                <?php $tmp = 1; foreach ($pds as $key => $value): ?>
                <tr>
                  <td><?php echo $tmp; ?></td>
                  <td><?php echo $value['pd_number'] ?></td>
                  <td><?php echo date("m/d/Y H:i:A", strtotime($value['date_added'])); ?></td>
                  <td><?php echo $value['filled']/100000000?> BTC</td>
                  <td><?php echo $value['max_profit']/100000000 ?> BTC</td>
                  <td><?php switch ($value['status']) {
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
                            } ?></td>
                  <td style="color:red" class="text-danger countdown" data-countdown="<?php
                                  if(intval($value['status']) === 0 ){
                                    echo $value['date_finish_forAdmin'];
                                  }
                                  if(intval($value['status']) === 1 ){
                                    echo $value['date_finish'];
                                  }
                                  if(intval($value['status']) === 2 ){
                                    echo $value['date_finish_r_wallet'];
                                  }
                              ?>">
                            </td>
                             <?php if(intval($value['status']) === 0) { ?>
                      <td>
                       
                          <a class="label <?php switch ($value['status']) {
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
                        } ?>" href="<?php echo intval($value['status']) == 0 ? $self -> url -> link('account/price/payconfirm', 'token='.$value["pd_number"].'', 'SSL') : 'javascript:;' ?>">Send BTC</a>
                       
                        </td>
                         <?php } 
                        ?> 
                       
                        
                      
                </tr>
                <?php $tmp++; endforeach; ?>
              </tbody>
            </table>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    
  
</div>
<!-- / #content-wrapper -->
<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Create Investment successfull !!!');
   }
   
</script>
<?php echo $self->load->controller('common/footer') ?>