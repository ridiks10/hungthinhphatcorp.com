<?php 
   $self->document->setTitle('Chi Tiết Gói Đầu Tư');
   echo $self->load->controller('common/header'); echo $self->load->controller('common/column_left');
   
   ?>
<div id="content-wrapper">
   <!-- 5. $PRICING_PAGE ==============================================================================
      Pricing page
      -->
   <!-- Javascript -->

   <!-- / Javascript -->
   <div class="page-pricing-header">
      
      <div class="bg-overlay" style="background: #8f7c5f;"></div>
      <div class="page-pricing-header-content">
         <h1 class="page-title"><strong><?php ECHO $lang['investment'] ?></strong></h1>
        <div class="clearfix"></div>
      </div>
   </div>
  
      
   
    <div class="row">
      <div class="col-sm-12">
        <div class="panel">
          <!-- <div class="panel-heading">
            
        
               <div class="options pull-right">
                  <div class="btn-toolbar">
                     <a href="<?php echo $self -> url -> link('account/price/create', '', 'SSL'); ?>" class="btn btn-default"><i class="fa fa-fw fa-plus"></i><?php echo $lang['create_investment'] ?></a>
                  </div>
               </div><span class="panel-title"><?php echo $lang['detail_investment'] ?></span>
               <div class="clearfix"></div>
          </div> -->
            <?php if ($pds) { ?>
          <div class="panel-body" id="no-more-tables">
            <table class="table">
              <thead>
                <tr>
                  <th>#</th>
                  <th><?php echo $lang['PD_NUMBER'] ?></th>
                  <th><?php echo $lang['DATE_CREATED'] ?></th>
                  <th><?php echo $lang['FILLED'] ?></th>
                  <th><?php echo $lang['MAX_PROFIT'] ?></th> 
                  <th><?php echo $lang['STATUS'] ?></th>
                 <th><?php echo $lang['TIME_REMAIN'] ?></th>
                  <!--  <?php $tmp = 1; foreach ($pds as $key => $value): ?>
                  <?php if(intval($value['status']) === 0) { ?>
                  <th><?php echo $lang['action'] ?></th>
                  <?php } ?>
                <?php endforeach; ?> -->
                </tr>
              </thead>
              <tbody>
                <?php $tmp = 1; foreach ($pds as $key => $value): ?>
                <tr>
                  <td data-title="#"><?php echo $tmp; ?></td>
                  <td data-title="<?php echo $lang['PD_NUMBER'] ?>"><?php echo $value['pd_number'] ?></td>
                  <td data-title="<?php echo $lang['DATE_CREATED'] ?>"><?php echo date("m/d/Y", strtotime($value['date_added'])); ?></td>
                  <td data-title="<?php echo $lang['FILLED'] ?>"><?php echo number_format($value['filled'])?> VNĐ</td>
                 <td data-title="<?php echo $lang['MAX_PROFIT'] ?>"><?php echo number_format($value['max_profit']) ?> VNĐ</td>
                  <td data-title="<?php echo $lang['STATUS'] ?>"><?php switch ($value['status']) {
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
                  <td data-title="<?php echo $lang['TIME_REMAIN'] ?>" style="color:red" class="text-danger countdown" data-countdown="<?php
                                  if(intval($value['status']) === 0 ){
                                    echo $value['date_finish_forAdmin'];
                                  }
                                  if(intval($value['status']) === 1 ){
                                    echo $value['date_finish_forAdmin'];
                                  }
                                  if(intval($value['status']) === 2 ){
                                    echo $value['date_finish_r_wallet'];
                                  }
                              ?>">
                            </td> 
                     <!--         <?php if(intval($value['status']) === 0) { ?>
                      <td data-title="<?php echo $lang['action'] ?>">
                       
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
                        } ?>" href="<?php echo intval($value['status']) == 0 ? $self -> url -> link('account/price/payconfirm', 'token='.$value["pd_number"].'', 'SSL') : 'javascript:;' ?>">Detail</a>
                       
                        </td>
                         <?php } 
                        ?> 
                        -->
                        
                      
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