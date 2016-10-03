<?php 
   $self -> document -> setTitle('Lịch Sử Giao Dịch'); 
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
         <?php if(count($histotys) > 0){ ?>
          <div class="panel-body" id="no-more-tables">
            <table class="table">
              <thead>
                <tr>
                   <th class="text-center"><?php echo $lang['column_no'] ?></th>
                    <th>Loại Hoa Hồng</th>
                    <th><?php echo $lang['column_date_added'] ?></th>
                    <th><?php echo $lang['column_amount'] ?></th>
                    <th><?php echo $lang['column_description'] ?></th>
                </tr>
              </thead>
              <tbody>
                <?php $number = 1; foreach ($histotys as $key => $value) {?>
                  <tr>
                       <td data-title="<?php echo $lang['column_no'] ?>." align="center"><?php echo $number ?></td>
                      <td data-title="Loại Hoa Hồng"><?php echo $value['wallet'] ?></td>
                      <td data-title="<?php echo $lang['column_date_added'] ?>"><?php echo date("d/m/Y", strtotime($value['date_added'])); ?></td>
                      <td data-title="<?php echo $lang['column_amount'] ?>"><?php echo $value['text_amount'] ?></td>
                      <td data-title="<?php echo $lang['column_description'] ?>">
                          <?php echo $value['system_decsription'] ?>
                      </td>
                  </tr>
              <?php $number++; } ?>
              </tbody>
            </table>
            <?php echo $pagination; ?>
          </div>
           <?php } ?>
        </div>
      </div>
    </div>
        

  </div>

<?php echo $self->load->controller('common/footer') ?>