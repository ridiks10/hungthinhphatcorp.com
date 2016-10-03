<?php 
   $self -> document -> setTitle($lang['heading_title']); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div id="content-wrapper">

   
<div class="row">
      <div class="col-sm-12">
        <div class="panel">
          <div class="panel-heading">
            <span class="panel-title"><?php echo $lang['heading_title'] ?></span>
          </div>
         
          <div class="panel-body" id="no-more-tables">
            <table class="table">
              <thead>
               <tr>
                  <th class="text-center"><?php echo $lang['NO'] ?>.</th>
                  <th>ID</th>
                  <th><?php echo $lang['USERNAME'] ?></th>
                  <!-- <th>Level</th> -->
                  <!-- <th><?php echo $lang['WALLET'] ?></th> -->
                  <th><?php echo $lang['TELEPHONE'] ?></th>
                  <th><?php echo $lang['EMAIL'] ?></th>
                  
                  <th>NGÀY THAM GIA</th>
                  <th>GÓI ĐẦU TƯ</th>
                  <th>ĐĂNG NHẬP</th>
               </tr>
              </thead>
              <tbody>
                <?php $count = 1; foreach ($refferals as $key => $value) { ?>
                  <tr>
                     <td data-title="<?php echo $lang['NO'] ?>." align="center"><?php echo $count ?></td>
                     <td data-title="ID"><?php echo $value['username'] ?></td>
                     <td data-title="<?php echo $lang['USERNAME'] ?>"><?php echo $value['firstname'] ?></td>
                     <!-- <td data-title="LEVEL">
                        <?php echo "L".(intval($value['level']) - 1) ?>
                     </td> -->
                     <!-- <td data-title="<?php echo $lang['WALLET'] ?>" >
                        <?php echo $value['wallet']; ?>
                     </td> -->
                     <td data-title="<?php echo $lang['TELEPHONE'] ?>" >
                        <?php echo $value['telephone']; ?>
                     </td>
                     <td data-title="<?php echo $lang['EMAIL'] ?>"><?php echo $value['email'] ?></td>
                    
                      <td data-title="NGÀY THAM GIA"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td>
                     <td data-title="GÓI ĐẦU TƯ"><?php echo number_format($self -> goidautu($value['customer_id'])) ?> VND</td>
                      <td data-title="ĐĂNG NHẬP"><?php echo date("d/m/Y H:i A", strtotime($value['date_add_login'])); ?></td>
                  </tr>
                  <?php $count++; } ?>
              </tbody>
            </table>
            <?php echo $pagination; ?>
          </div>
          
        </div>
      </div>
    </div>
  </div>
<?php echo $self->load->controller('common/footer') ?>