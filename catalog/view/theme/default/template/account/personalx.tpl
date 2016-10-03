<?php echo $header; ?>
<?php echo $column_left; ?>

<div class="wraper container-fluid">
  <div class="page-title">
    <h3 class="title"><?php echo $lang['heading_title'] ?></h3>
  </div>
  <!-- Form-validation -->
  <div class="row">
    <div class="col-md-12">
   
      <div class="panel panel-default tab-content">
        <!-- <div class="panel-heading">
          <h3 class="panel-title">Downline Tree</h3>
        </div> -->
        <div id="tab-binary" class="tab-pane panel-body active">
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="container-fluid">
                <fieldset>
                  <div class="personal_contain" style="margin-top:10px;" >
                    <div class="tootbar-top">
                      <ul class="list-unstyled">
                        <li style="margin-bottom:15px;">
                          <a class="btn-tree" href="javascript:void(0)" onclick='click_node(
                          <?php echo intval($idCustomer); ?>)'> <span class="btn btn-default" style="font-weight:700"><?php echo $lang['top'] ?></span> </a>
                        
                          <a class="btn-tree" href="javascript:void(0)" onclick='click_back()'> <span class="btn btn-default" style="font-weight:700">Back</span> </a>
                        </li>
                        
                      </ul>
                    </div>
                    <div class="clr"></div>
                    <div class="personal-tree" style="text-align: center; min-height:300px; margin-top: 40px;">
                      <img src="
                      <?php echo $self -> config -> get('config_ing_loading'); ?>" />
                    </div>
                    
                  </div>
                </fieldset>
              
              </div>
             
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- End Row -->
  </div>
</div>
<?php $js="$(document).ready(function(){

      $('#tt').tree({
        dnd: true,

        lines: true,

        animate: true,

        url: '" .$base. "index.php?route=account/personal/getJsonBinaryTree&id_user=".intval($idCustomer). "',
      });

    });"; 
?>
<script type="text/javascript">
    <?php echo $js; ?>
    $('#tt').css({'text-align': 'left'});
</script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/tooltipster.bundle.min.css" />
<script type="text/javascript" src="catalog/view/javascript/tooltipster.bundle.min.js"></script>
<script type="text/javascript">

(function($) {

jQuery.fn.show_tree = function(node) {  

    positon = node.iconCls.split(" ");

    var line_class = positon[1]+'line '+'linefloor'+node.fl;
    var level_active = positon[0]+'iconLevel';

    var node_class = positon[1]+'_node '+'nodefloor'+node.fl;
    var html = '<div class=\''+line_class+'\'></div>';
// onclick=\'click_node('+node.id+')\' value=\''+node.id+'\'
    x_p = "<p>ID: "+node.username+"<p>";
    x_p += "<p>Tên: "+node.account_holder+"<p>";
    
     // x_p += "<p>Email: "+node.email+"<p>";
    // x_p += "<p>Phone: "+node.telephone+"<p>";
    x_p += "<p>Ngày ĐK: "+node.date_added+"<p>";
 x_p += "<p>Đầu tư: "+node.totalPD+"<p>";
    x_p += "<p>Doanh số trái: "+node.leftPD+" </p>";
    x_p += "<p>Doanh số phải: "+node.rightPD+"</p>";
console.log(node)

    html += !node.empty 
        ? '<div class=\''+node_class+' '+level_active+'\'><a data-html="true" data-toggle="tooltip" rel="tooltip" data-placement="top" data-title="<p>'+x_p+'</p>" class="binaryTree" style="display:block"   \'><i class="fa fa-user type-'+node.level+'" onclick=\'click_node('+node.id+')\' value=\''+node.id+'\' aria-hidden="true"></i></a>' 
        : '<div class=\''+node_class+'\'><a data-toggle="tooltip" data-placement="top" style="display:block" title="Add new user"><i class="fa fa-plus-square type-add"></i></a>';

    html += '<div id=\''+node.id+'\' ></div>';

    html += '</div>';

    $(this).append(html);

    node.children && $.each( node.children, function( key, value ) {
       $('#'+node.id).show_tree(value);

        $('[data-toggle="popover"]').popover();
    });



};


jQuery.fn.show_infomation = function(node) {  

  $.getJSON(
      "index.php?route=account/personalx/getInfoUser&id="+node,
    function(data){
    $(this).find('dd').html('');      

      if(data.id !=0){

        $.each(data, function (k,v){
        $('#ajax_'+k).html(v);

      });     

      }

    }
  );

};

// xay dung cay voi id truyen vo

jQuery.fn.build_tree = function(id, method) {   

    $('.personal-tree').html('<img src="<?php echo $self -> config -> get('config_ing_loading'); ?>"  />');

    $.ajax({

      url: "index.php?route=account/personalx/"+method,

      dataType: 'json',

      data: {id_user : id},

      success: function(json_data){

        var rootnode = json_data[0];
         $('.personal-tree').html('');

         $('.personal-tree').show_tree(rootnode);

         $('.personal_contain').show_infomation(rootnode.id);

         $('#current_top').html("Goto "+rootnode.name + "\'s");

      }

    }); 

};

})(jQuery);
  var click_node_add =  function (p_binary, positon){
    var link = '<?php echo $self -> url -> link('account/personalx/add_customer', '', 'SSL'); ?>';
    link += '&p_binary=' + p_binary;
    link += '&postion='+ positon;
    link += '&token='+ '<?php echo $customer_code; ?>';
    location.href = link;
    
  };
   function click_node(id){
    jQuery(document).build_tree(id,'getJsonBinaryTree_Admin');
    $('.tooltip').hide();
    !_.contains(window.arr_lick, id) && window.arr_lick.push(id);
   }
   window.arr_lick = [];
   function click_back(){
      if(window.arr_lick.length === 0){
        click_node(<?php echo intval($idCustomer); ?>);

      }else{
        window.arr_lick = _.initial(window.arr_lick);
        typeof _.last(window.arr_lick) !== 'undefined' ? click_node(_.last(window.arr_lick)) : click_node(<?php echo intval($idCustomer); ?>);
      }
   }

function upto_level(id){

  var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

  jQuery(document).build_tree(top,'getJsonBinaryTreeUplevel');

}

function goto_bottom_left(id){

  jQuery(document).build_tree(id,'goBottomLeft');

}

function goto_bottom_right(id){

  jQuery(document).build_tree(id,'goBottomRight');

}

function goto_bottom_left_oftop(id){

  var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

  jQuery(document).build_tree(top,'goBottomLeft');

}

function goto_bottom_right_oftop(id){

  var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

  jQuery(document).build_tree(top,'goBottomRight');

}

jQuery(document).ready(function($) {
  click_node(<?php echo intval($idCustomer);?>);
});

</script>

<?php echo $footer; ?>
