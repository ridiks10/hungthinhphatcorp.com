<?php 
$self->document->setTitle('Tổng thể');
echo $self->load->controller('common/header'); echo $self->load->controller('common/column_left');

?>
<script type="text/javascript">
// (function(){ var widget_id = 'Kj5usLKKyh';var d=document;var w=window;function l(){
// var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);}if(d.readyState=='complete'){l();}else{if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();</script>
<div id="content-wrapper">
<div class="overlay">
 



  <!-- / .page-header -->
  <div class="row">
    <div class="col-md-12">
    
      <div class="row">
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter blues">
           <h3></h3>
            <span class="m-0 counter pd-count" data-link="<?php echo $self->url->link('account/dashboard/countPD', '', 'SSL'); ?>">loading ...
            </span> 
            <i class="fa fa-eur red">
            </i>
            <h6>
             <?php echo $lang['provideDonation']; ?>
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter purples">
            <h3></h3>
            <span class="m-0 counter c-wallet" data-link="<?php echo $self->url->link('account/dashboard/getCWallet', '', 'SSL'); ?>">loading ...
            </span> 
            <i class="fa fa-eur red">
            </i>
            <h6>
              Hoa hồng trực tiếp
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter blues">
            <h3></h3>
            <span class="m-0 counter r-wallet" data-link="<?php echo $self->url->link('account/dashboard/getRWallet', '', 'SSL'); ?>">loading ...
            </span> 
            <i class="fa fa-eur red">
            </i>
            <h6>
              <?php echo $lang['r_wallet'] ?>
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter oranges">
            <h3>
            </h3>
            <span class="m-0 counter m-wallet" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/getMWallet', '', 'SSL'); ?>">
            </span> 
           <i class="fa fa-eur red">
            </i>
            <h6>
               <?php echo $lang['m_wallet']; ?>
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter blues">
            <h3>
            </h3>
            <span class="total_ch_wallet" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/total_ch_wallet', '', 'SSL'); ?>"></span>
             <i class="fa fa-eur red">
            </i>
            <h6>
              Cộng hưởng
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6 ">
          <div class="stats-counter blues">
            <div class="col-xs-6 stats-counter blues_new">
                <span class="total_left" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/total_binary_left', '', 'SSL'); ?>"></span>
            </div>
             <div class="col-xs-6 stats-counter  blues_new">
                <span class="total_right" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/total_binary_right', '', 'SSL'); ?>"></span>
            </div>
            <div class="clearfix"></div>
            <i class="fa fa-eur red"></i>
            <h6>
              Thành viên trái / phải
            </h6> 
          </div>
         <!--  <div class="stats-counter cyans">
            <h3>
            </h3>
            <span class="m-0 counter total_pd_left" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/total_pd_left', '', 'SSL'); ?>"></span>
            <i class="fa fa-eur red">
            </i>
            <h6>
             Nhánh phải
            </h6> 
          </div> -->
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6 ">
          <div class="stats-counter blues">
            <div class="col-xs-6 stats-counter blues_new">
                <span class="m-0 counter total_pd_left" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/total_pd_left', '', 'SSL'); ?>"></span>
            </div>
             <div class="col-xs-6 stats-counter  blues_new">
                <span class="m-0 counter total_pd_right" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/total_pd_right', '', 'SSL'); ?>"></span>
            </div>
            <div class="clearfix"></div>
            <i class="fa fa-eur red"></i>
            <h6>
              Doanh số trái / phải
            </h6> 
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter blues">
            <h3>
            </h3>
            <span class="m-0 counter hoahongconghuong" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/hoahongconghuong', '', 'SSL'); ?>"></span>
            <i class="fa fa-eur red">
            </i>
            <h6>
              Hoa hồng nhánh yếu
             <?php //echo $lang['binary_right'] ?>
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <!-- <div class="col-md-3 col-sm-6">
          <div class="stats-counter reds">
            <h3>
            </h3>
           
              
            <i class="fa fa-eur red">
            </i>
            <h6>  Hoa hồng cân cặp
                  <?php //echo $lang['binary_btc_right'] ?>              
            </h6> 
          </div>
          Stats Counter    
        </div> -->
        
      
      
      </div>
    </div>
    <!-- /6. $EASY_PIE_CHARTS -->
    <div class="col-md-12">
          <div class="widget-area new-member-frame">
            <div class="ribbon-wrapper">
              <div class="ribbon-design red">Xin Chào
              </div>
            </div>
            <h4>ID Mới Gia Nhập Hưng Thịnh Phát
            </h4>
         
            <div class="simply-scroll simply-scroll-container">
              <div class="simply-scroll-clip">
                <ul id="scroller" class="simply-scroll-list" style="width: 4080px;">
                <?php 
                  foreach ($getall_user as $value) {
                ?>
                  <li>
                    <table width="200" border="0">
                      <tbody>
                        <tr>
                          <td rowspan="2" width="100" align="center"> 
                            <img class="img-reposive" src="catalog/view/theme/default/img/flagicon/<?php echo $value['name'];?>.png" >
                          </td>
                          <td align="left" valign="bottom">
                            <font face="Cambria, Hoefler Text, Liberation Serif, Times, Times New Roman, serif" size="2px">
                              <strong><?php echo $value['username'];?>
                              </strong>
                            </font>
                          </td>
                        </tr>
                        <tr>
                          <td align="left" valign="top">Hưng Thịnh Phát
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </li>
                 
                  <?php } ?>
                    
                </ul>
              </div>
        
          </div>
        </div>
    </div>
  </div>
  <!-- /9. $UNIQUE_VISITORS_STAT_PANEL -->
  <div class="clearfix" style="margin-right: 20px; margin-bottom:20px;">
  </div>
  
</div> 
<script type="text/javascript">
      if (location.hash === '#success') {
         alertify.set('notifier','delay', 100000000);
         alertify.set('notifier','position', 'top-right');
         alertify.success('Create user successfull !!!');
      }
      
   </script>
<?php echo $self->load->controller('common/footer') ?>

