<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1>Lịch sử giao dịch</h1>

  </div>
</div>
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title pull-left">Lịch sử giao dịch</h3>
      
      <div class="clearfix">
          
      </div>
    </div>
    <div class="panel-body">
       <div class="navbar-form">
        <div class="row">
          <div class="row">
            <div class="col-md-3">
                <input style="width: 270px;" class="form-control" id="name" type="text" name="name" value="" placeholder="Họ tên">
                <ul id="suggesstion-box" class="list-group"></ul>
            </div>
            <div class="col-md-3" style="margin-left:10px;">
              <input style="width: 270px; " type="text" autocomplete="off" class="form-control" id="p_node" name="p_node" placeholder="Username">
            <ul id="suggesstion-box_username" class="list-group"></ul>
            </div>
            
            </div>
          </div>
        </div>
        <div class="clearfix" style="margin-top:10px;"></div>
     	<table class="table table-bordered table-hover">
     		<thead>
     			<tr>
     				<th>TT</th>
     				<th>Username</th>
     				<th>Họ Tên</th>
            <th>Gói đầu tư</th>
            <th>Ngày đầu tư</th>
            <th>Tổng nhánh trái / phải</th>
     				<th>Người bảo trợ</th>
            <th>Lịch sử</th>
     				<th>Sửa</th>
     			</tr>
     		</thead>
     		<tbody id="list">
          
     		</tbody>
     	</table>
    </div>
  </div>
</div>
<style type="text/css" media="screen">
  ul#suggesstion-box li:hover {
    cursor: pointer;
    background-color: #E27225;
    color: #fff;
  }
  ul#suggesstion-box_username li:hover {
    cursor: pointer;
    background-color: #E27225;
    color: #fff;
  }
  ul#suggesstion-box{
     position: absolute;
    width: 270px;
  }
  ul#suggesstion-box_username{
     position: absolute;
    width: 270px;
  }
  #content .panel-body{
    min-height: 530px;
  }
 
</style>
<script type="text/javascript">
  jQuery('#btn-filter').click(function(){
    var name = jQuery('#name').val();
    
    $.ajax({
      url : "<?php echo $link_search; ?>",
      type : "post",
      dataType:"html",
      data : {
          'name': name
      },
      success : function (result){
        $('#list').html(result);
      }
    
    });

        
    }); 
    $("#name").keyup(function(){
        $.ajax({
        type: "POST",
        url: "<?php echo $getaccount;?>",
        data:'keyword='+$(this).val(),        
        success: function(data){
            $("#suggesstion-box").show();
            $("#suggesstion-box").html(data);
            $("#name").css("background","#FFF");            
        }
        });
    });
    $("#p_node").keyup(function(){
        $.ajax({
        type: "POST",
        url: "<?php echo $getaccount_username;?>",
        data:'keyword='+$(this).val(),        
        success: function(data){
            $("#suggesstion-box_username").show();
            $("#suggesstion-box_username").html(data);
            $("#p_node").css("background","#FFF");            
        }
        });
    });
    function selectU(val) {
        $("#name").val(val);
        $("#suggesstion-box").hide();
        $.ajax({
        url : "<?php echo $link_search; ?>",
        type : "post",
        dataType:"html",
        data : {
            'name': val
        },
        success : function (result){
          $('#list').html(result);
        }
      
      });
    }
    function selectU_username(val) {
        $("#p_node").val(val);
        $("#suggesstion-box_username").hide();
        $.ajax({
        url : "<?php echo $link_search_username; ?>",
        type : "post",
        dataType:"html",
        data : {
            'name': val
        },
        success : function (result){
          $('#list').html(result);
        }
      
      });
    }
  
</script>
<?php echo $footer; ?>