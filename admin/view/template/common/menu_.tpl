<ul id="menu">
  <li id="dashboard"><a href="<?php echo $home; ?>"><i class="fa fa-dashboard fa-fw"></i> <span><?php echo $text_dashboard; ?></span></a></li>


  <li id="news" ><a href="<?php echo $simple_blog_article; ?>"><i class="fa fa-dashboard fa-fw"></i> <span>Tin Tức</span></a></li>
  <li id="mn_statistical" ><a href="<?php echo $thongke; ?>"><i class="fa fa-dashboard fa-fw"></i> <span> Statistical </span></a></li>
  <li id="mn_statistical" ><a href="<?php echo $dangky; ?>"><i class="fa fa-user fa-fw"></i> <span> Đăng Ký Thành Viên </span></a></li>
    <li id="mn_statistical" ><a href="<?php echo $personal; ?>"><i class="fa fa-user fa-fw"></i> <span> Cây nhị phân </span></a></li>
  <li id="mn_statistical" ><a href="<?php echo $upgrade; ?>"><i class="fa fa-user fa-fw"></i> <span> Nâng cấp gói đầu tư </span></a></li>

  <?php /* ?>
  <li id="news"><a class="parent"><i class="fa fa-puzzle-piece fa-fw"></i> <span><?php echo $text_simple_blog; ?></span></a>
    <ul>
      <li><a href="<?php echo $simple_blog_author; ?>"><?php echo $text_simple_blog_author; ?></a></li>
      <li><a href="<?php echo $simple_blog_category; ?>"><?php echo $text_simple_blog_category; ?></a></li>
      <li><a href="<?php echo $simple_blog_article; ?>"><?php echo $text_simple_blog_article; ?></a></li>
      <li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>
    </ul>
   </li>
   <?php */ ?>
  <?php /*?>
  <li id="catalog"><a class="parent"><i class="fa fa-tags fa-fw"></i> <span><?php echo $text_catalog; ?></span></a>
    <ul>
      <li><a href="<?php echo $category; ?>"><?php echo $text_category; ?></a></li>
      <li><a href="<?php echo $product; ?>"><?php echo $text_product; ?></a></li>
      <li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
      <li><a href="<?php echo $filter; ?>"><?php echo $text_filter; ?></a></li>
      <li><a class="parent"><?php echo $text_attribute; ?></a>
        <ul>
          <li><a href="<?php echo $attribute; ?>"><?php echo $text_attribute; ?></a></li>
          <li><a href="<?php echo $attribute_group; ?>"><?php echo $text_attribute_group; ?></a></li>
        </ul>
      </li>
      <li><a href="<?php echo $option; ?>"><?php echo $text_option; ?></a></li>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
      <li><a href="<?php echo $review; ?>"><?php echo $text_review; ?></a></li>
      <li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>
    </ul>
  </li>

  

  <li id="extension"><a class="parent"><i class="fa fa-puzzle-piece fa-fw"></i> <span><?php echo $text_extension; ?></span></a>
    <ul>
      <li><a href="<?php echo $installer; ?>"><?php echo $text_installer; ?></a></li>
      <li><a href="<?php echo $modification; ?>"><?php echo $text_modification; ?></a></li>
      <li><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li>
      <li><a href="<?php echo $shipping; ?>"><?php echo $text_shipping; ?></a></li>
      <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
      <li><a href="<?php echo $total; ?>"><?php echo $text_total; ?></a></li>
      <li><a href="<?php echo $feed; ?>"><?php echo $text_feed; ?></a></li>
      <li><a href="<?php echo $fraud; ?>"><?php echo $text_fraud; ?></a></li>
      
  	<?php if ($openbay_show_menu == 1) { ?>
      <li><a class="parent"><?php echo $text_openbay_extension; ?></a>
        <ul>
          <li><a href="<?php echo $openbay_link_extension; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
          <li><a href="<?php echo $openbay_link_orders; ?>"><?php echo $text_openbay_orders; ?></a></li>
          <li><a href="<?php echo $openbay_link_items; ?>"><?php echo $text_openbay_items; ?></a></li>
          <?php if ($openbay_markets['ebay'] == 1) { ?>
          <li><a class="parent"><?php echo $text_openbay_ebay; ?></a>
            <ul>
              <li><a href="<?php echo $openbay_link_ebay; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
              <li><a href="<?php echo $openbay_link_ebay_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
              <li><a href="<?php echo $openbay_link_ebay_links; ?>"><?php echo $text_openbay_links; ?></a></li>
              <li><a href="<?php echo $openbay_link_ebay_orderimport; ?>"><?php echo $text_openbay_order_import; ?></a></li>
            </ul>
          </li>
          <?php } ?>
          <?php if ($openbay_markets['amazon'] == 1) { ?>
          <li><a class="parent"><?php echo $text_openbay_amazon; ?></a>
            <ul>
              <li><a href="<?php echo $openbay_link_amazon; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
              <li><a href="<?php echo $openbay_link_amazon_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
              <li><a href="<?php echo $openbay_link_amazon_links; ?>"><?php echo $text_openbay_links; ?></a></li>
            </ul>
          </li>
          <?php } ?>
          <?php if ($openbay_markets['amazonus'] == 1) { ?>
          <li><a class="parent"><?php echo $text_openbay_amazonus; ?></a>
            <ul>
              <li><a href="<?php echo $openbay_link_amazonus; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
              <li><a href="<?php echo $openbay_link_amazonus_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
              <li><a href="<?php echo $openbay_link_amazonus_links; ?>"><?php echo $text_openbay_links; ?></a></li>
            </ul>
          </li>
          <?php } ?>
          <?php if ($openbay_markets['etsy'] == 1) { ?>
          <li><a class="parent"><?php echo $text_openbay_etsy; ?></a>
            <ul>
              <li><a href="<?php echo $openbay_link_etsy; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
              <li><a href="<?php echo $openbay_link_etsy_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
              <li><a href="<?php echo $openbay_link_etsy_links; ?>"><?php echo $text_openbay_links; ?></a></li>
            </ul>
          </li>
          <?php } ?>
        </ul>
      </li>
      <?php } ?>
    </ul>
  </li>
  <?php */?>

  <li id="sale"><a href="<?php echo $customer; ?>"><i class="fa fa-user fa-fw"></i> <span>Danh Sách Thành Viên</span></a>
  <!-- <li><a href="<?php echo $auto_walet_c; ?>"><i class="fa fa-book fa-fw" aria-hidden="true"></i> <span id="auto_walet_c" >Tự động tính phần trăm</span></a> -->
  <!-- <li id="system"><a href="<?php echo $statistical;?>"><i class="fa fa-cog fa-fw"></i> <span>Thống kê</span></a> -->

  <!-- <li id="sale"><a href="<?php echo $customer; ?>"><i class="fa fa-user fa-fw"></i> <span><?php echo $text_customer; ?></span></a> -->
  <!-- <li><a href="<?php echo $auto_walet_c; ?>"><i class="fa fa-book fa-fw" aria-hidden="true"></i> <span id="auto_walet_c" >Tự động tính phần trăm</span></a> -->
  <li id="system"><a href="<?php echo $statistical;?>"><i class="fa fa-book fa-fw" aria-hidden="true"></i> <span>Thống kê</span></a>

  </li>
     <?php /*?>

    <ul>
   
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $order_recurring; ?>"><?php echo $text_order_recurring; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>


      <li><a href="<?php echo $customer; ?>"><?php echo $text_customer; ?></a>
        <ul>
          <li><a href="<?php echo $customer; ?>"><?php echo $text_customer; ?></a></li>
          
          <li><a href="<?php echo $customer_group; ?>"><?php echo $text_customer_group; ?></a></li>
          <li><a href="<?php echo $custom_field; ?>"><?php echo $text_custom_field; ?></a></li>
          <li><a href="<?php echo $customer_ban_ip; ?>"><?php echo $text_customer_ban_ip; ?></a></li>
        
        </ul>
      </li>

      <li><a class="parent"><?php echo $text_voucher; ?></a>
        <ul>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $voucher_theme; ?>"><?php echo $text_voucher_theme; ?></a></li>
        </ul>
      </li>
      <li><a class="parent"><?php echo $text_paypal ?></a>
        <ul>
          <li><a href="<?php echo $paypal_search ?>"><?php echo $text_paypal_search ?></a></li>
        </ul>
      </li>
     
    </ul>
     <?php */?>
<!--   </li>
  <li id="news"><a class="parent" href="<?php echo $information; ?>"><i class="fa fa-puzzle-piece fa-fw"></i> <span>Thông báo</span></a>
   </li> -->
  <?php /*?>

      <?php /*?>
 <li id="reports"><a href="<?php echo $report_customer_profit; ?>"><i class="fa fa-bar-chart-o fa-fw"></i> <span>Report Hoa hồng</span></a>
 <li id="reports"><a href="<?php echo $report_customer_activity; ?>"><i class="fa fa-bar-chart-o fa-fw"></i> <span>Report Doanh số</span></a>
 <li id="reports"><a href="<?php echo $report_customer_package; ?>"><i class="fa fa-bar-chart-o fa-fw"></i> <span>Report doanh số gói con F1</span></a>
  
  <li id="reports"><a href="<?php echo $report_customer_package; ?>"><i class="fa fa-bar-chart-o fa-fw"></i> <span>Report doanh số</span></a>
  <li><a class="parent"><i class="fa fa-share-alt fa-fw"></i> <span><?php echo $text_marketing; ?></span></a>
    <ul>
      <li><a href="<?php echo $marketing; ?>"><?php echo $text_marketing; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $coupon; ?>"><?php echo $text_coupon; ?></a></li>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
    </ul>
  </li>
  <?php */?>
  <li id="system"><a class="parent"><i class="fa fa-cog fa-fw"></i> <span><?php echo $text_system; ?></span></a>
    <ul>
      <li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
      <?php /*?>
      <li><a class="parent"><?php echo $text_design; ?></a>
        <ul>
          <li><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li>
          <li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li>
        </ul>
      </li>
      <?php */?>
      <li><a class="parent"><?php echo $text_users; ?></a>
        <ul>
          <li><a href="<?php echo $user; ?>"><?php echo $text_user; ?></a></li>
          <li><a href="<?php echo $user_group; ?>"><?php echo $text_user_group; ?></a></li>
      <?php /*?>    <li><a href="<?php echo $api; ?>"><?php echo $text_api; ?></a></li> <?php */?>
        </ul>
      </li>
      
      <li><a class="parent"><?php echo $text_localisation; ?></a>
        <ul>
          <li><a href="<?php echo $location; ?>"><?php echo $text_location; ?></a></li>
          <li><a href="<?php echo $language; ?>"><?php echo $text_language; ?></a></li>
        
          <li><a href="<?php echo $currency; ?>"><?php echo $text_currency; ?></a></li>
          <li><a href="<?php echo $stock_status; ?>"><?php echo $text_stock_status; ?></a></li>
          <li><a href="<?php echo $order_status; ?>"><?php echo $text_order_status; ?></a></li>
          <li><a class="parent"><?php echo $text_return; ?></a>
            <ul>
              <li><a href="<?php echo $return_status; ?>"><?php echo $text_return_status; ?></a></li>
              <li><a href="<?php echo $return_action; ?>"><?php echo $text_return_action; ?></a></li>
              <li><a href="<?php echo $return_reason; ?>"><?php echo $text_return_reason; ?></a></li>
            </ul>
          </li>
          <li><a href="<?php echo $country; ?>"><?php echo $text_country; ?></a></li>
          <li><a href="<?php echo $zone; ?>"><?php echo $text_zone; ?></a></li>
          <li><a href="<?php echo $geo_zone; ?>"><?php echo $text_geo_zone; ?></a></li>
          <li><a class="parent"><?php echo $text_tax; ?></a>
            <ul>
              <li><a href="<?php echo $tax_class; ?>"><?php echo $text_tax_class; ?></a></li>
              <li><a href="<?php echo $tax_rate; ?>"><?php echo $text_tax_rate; ?></a></li>
            </ul>
          </li>
          <li><a href="<?php echo $length_class; ?>"><?php echo $text_length_class; ?></a></li>
          <li><a href="<?php echo $weight_class; ?>"><?php echo $text_weight_class; ?></a></li>
          
        </ul>
      </li>
 
    </ul>
  </li> 
  <?php /*?>
  <li id="tools"><a class="parent"><i class="fa fa-wrench fa-fw"></i> <span><?php echo $text_tools; ?></span></a>
    <ul>
      <li><a href="<?php echo $upload; ?>"><?php echo $text_upload; ?></a></li>
      <li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li>
      <li><a href="<?php echo $error_log; ?>"><?php echo $text_error_log; ?></a></li>
    </ul>
  </li>
  <li id="reports"><a class="parent"><i class="fa fa-bar-chart-o fa-fw"></i> <span><?php echo $text_reports; ?></span></a>
    <ul>
      <li><a class="parent"><?php echo $text_sale; ?></a>
        <ul>
          <li><a href="<?php echo $report_sale_order; ?>"><?php echo $text_report_sale_order; ?></a></li>
          <li><a href="<?php echo $report_sale_tax; ?>"><?php echo $text_report_sale_tax; ?></a></li>
          <li><a href="<?php echo $report_sale_shipping; ?>"><?php echo $text_report_sale_shipping; ?></a></li>
          <li><a href="<?php echo $report_sale_return; ?>"><?php echo $text_report_sale_return; ?></a></li>
          <li><a href="<?php echo $report_sale_coupon; ?>"><?php echo $text_report_sale_coupon; ?></a></li>
        </ul>
      </li>
      <li><a class="parent"><?php echo $text_product; ?></a>
        <ul>
          <li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
          <li><a href="<?php echo $report_product_purchased; ?>"><?php echo $text_report_product_purchased; ?></a></li>
        </ul>
      </li>
      <li><a class="parent"><?php echo $text_customer; ?></a>
        <ul>
          <li><a href="<?php echo $report_customer_online; ?>"><?php echo $text_report_customer_online; ?></a></li>
          <li><a href="<?php echo $report_customer_activity; ?>"><?php echo $text_report_customer_activity; ?></a></li>
          <li><a href="<?php echo $report_customer_order; ?>"><?php echo $text_report_customer_order; ?></a></li>
          <li><a href="<?php echo $report_customer_reward; ?>"><?php echo $text_report_customer_reward; ?></a></li>
          <li><a href="<?php echo $report_customer_credit; ?>"><?php echo $text_report_customer_credit; ?></a></li>
        </ul>
      </li>
      <li><a class="parent"><?php echo $text_marketing; ?></a>
        <ul>
          <li><a href="<?php echo $report_marketing; ?>"><?php echo $text_marketing; ?></a></li>
          <li><a href="<?php echo $report_affiliate; ?>"><?php echo $text_report_affiliate; ?></a></li>
          <li><a href="<?php echo $report_affiliate_activity; ?>"><?php echo $text_report_affiliate_activity; ?></a></li>
        </ul>
      </li>
    </ul>
  </li>
  <?php */?>
</ul>
<script type="text/javascript">
  jQuery('#auto_walet_c').click(function(){
    url = jQuery(this).parent().attr('href');
    jQuery.ajax({
      url : url,
        type : "post",
        dataType:"text",
        data : {   
        },
        success : function (result){
            if (result == "done")
            {
              alert("Tính phần trăm thành công.")
            }
        }
    });
    return false;
  });
</script>