<?php 
   $self -> document -> setTitle('Detail');
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div id="content-wrapper">

   <div class="row">
      <!-- <div class="col-md-6">
         <div class="panel">
            <div class="panel-heading">
               <span class="panel-title">Please confirm: <code><?php echo ($bitcoin / 100000000) ?> BTC </code></span>
            </div>
            <div class="panel-body">
               <h3>Blockchain QR code</h3>
               <br/>
               <img src="https://chart.googleapis.com/chart?chs=200x200&amp;chld=L|1&amp;cht=qr&amp;chl=bitcoin:<?php echo $wallet ?>?amount=<?php echo ($bitcoin / 100000000) ?>"/>
               <br/>
               <h3>Blockchain Wallet</h3>
               <br/>
               <code><?php echo $wallet ?></code>
               <br/>
               <br/>
               <code id="websocket">Received: 0 BTC</code>
            </div>
         </div>
      </div> -->
      <div class="col-md-6">
         <div class="">
            <!-- <div class="panel-heading">
               <span class="panel-title">Detail Payment</span>
            </div> -->
           
           <!--  <div class="panel-body" id="detail-payment" data-id="<?php echo $invoice_hash; ?>" data-link="<?php echo $self->url->link('account/price/detail_payment', '', 'SSL'); ?>">
            </div> -->
            <div class="panel-heading">
               <span class="panel-title">Detail Package</span>
            </div>
            <div class="">
               <?php if (intval($package) == 1) { ?>
                  <div class="deposite deposite_red">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('5000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('7200000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('1800000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>

              
            </div>
               <?php } ?>
               <?php if (intval($package) == 2) { ?>
                 <div class="deposite deposite_orange">
                    <span class="deposite_title">90 days</span>
                    <div class="deposite_time_wrap">
                        <span class="deposite_time_wrap_text">2% per day</span>
                        <div class="deposite_time">
                            <span class="deposite_time_digit"><?php echo number_format('20000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                        </div>
                    </div>
                    <div class="deposite_time_triangle">
                    </div>
                    <div class="deposite_info">
                       <span>Profit / 90 days: <?php echo number_format('28000000') ?> VNĐ</span>
                        <span>Reinvestment / days: <?php echo number_format('7200000') ?> VNĐ</span>
                        <span>2% per day</span>
                    </div>

               </div>
               <?php } ?>
               <?php if (intval($package) == 3) { ?>
                  <div class="deposite deposite_green">
                    <span class="deposite_title">90 days</span>
                    <div class="deposite_time_wrap">
                        <span class="deposite_time_wrap_text">2% per day</span>
                        <div class="deposite_time">
                            <span class="deposite_time_digit"><?php echo number_format('50000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                        </div>
                    </div>
                    <div class="deposite_time_triangle">
                    </div>
                    <div class="deposite_info">
                        <span>Profit / 90 days: <?php echo number_format('72000000') ?> VNĐ</span>
                        <span>Reinvestment / days: <?php echo number_format('18000000') ?> VNĐ</span>
                        <span>2% per day</span>
                    </div>

                  </div>
               <?php } ?>
               <?php if (intval($package) == 4) { ?>
 <div class="deposite deposite_cyan">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('100000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('144000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('36000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>

           </div>
               <?php } ?>
               <?php if (intval($package) == 5) { ?>
               <div class="deposite deposite_blue">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('500000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('720000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('180000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>

           </div>
               <?php } ?>
               <?php if (intval($package) == 6) { ?>
                   <div class="deposite deposite_purple">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('1000000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('1440000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('360000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
             
           </div>
               <?php } ?>
              
            </div>
         </div>
      </div>
     
         
      
   </div>
   
</div>

 <script type="text/javascript">
//    var str = 'We are waiting for 3 confirmation from <a style="color: #f0ad4e;" href="https://blockchain.info/" target="_blank">blogchain.info</a>';
//    $('#websocket').html(str);
// </script>

<?php 
   echo $self -> load -> controller('common/footer'); 
   ?>