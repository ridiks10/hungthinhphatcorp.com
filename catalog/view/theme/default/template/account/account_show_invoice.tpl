<?php 
   $self -> document -> setTitle('Confirm: '.($invoice['amount'] / 100000000).' BTC');
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div id="content-wrapper">
   <div class="row">
     
      <div class="col-md-6">
         <div class="panel">
            <div class="panel-heading">
               <span class="panel-title">Please confirm: <code><?php echo ($invoice['amount'] / 100000000) ?> BTC </code></span>
            </div>
            <div class="panel-body">
               <h3>Blockchain QR code</h3>
               <br/>
               <img src="https://chart.googleapis.com/chart?chs=200x200&amp;chld=L|1&amp;cht=qr&amp;chl=bitcoin:<?php echo $invoice['input_address'] ?>?amount=<?php echo ($invoice['amount'] / 100000000) ?>"/>
               <br/>
               <h3>Blockchain Wallet</h3>
               <br/>
               <code><?php echo $invoice['input_address'] ?></code>
               <br/>
               <br/>
               <code id="websocket">Received: 0 BTC</code>
            </div>
         </div>
      </div>
    
      <div class="col-md-6">
         <div class="panel">
            <div class="panel-heading">
               <span class="panel-title">Detail Payment</span>
            </div>
            <div class="panel-body">
               <?php if ($invoice) { ?>
               
               <div id="detail-payment" class="provide-info" style="background:none; min-height:105px" data-id="<?php echo $invoice['invoice_id_hash'] ?>" data-link="<?php echo $self->url->link('account/account/detail_payment', '', 'SSL'); ?>">

               </div>
               <?php } ?>
            </div>
         
         </div>
      </div>
   </div>
</div>
<?php if(!$notCreate) { ?>
<script type="text/javascript">
   var str = 'We are waiting for 3 confirmation from <a style="color: #f0ad4e;" href="https://blockchain.info/" target="_blank">blockchain.info</a>';
   $('#websocket').html(str);
</script>
<?php }?>
<?php 
   echo $self -> load -> controller('common/footer'); 
   ?>