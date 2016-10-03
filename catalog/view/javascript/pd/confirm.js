$(function() {

	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah').attr('src', e.target.result).show().css({'width': '100%'});
            }

            reader.readAsDataURL(input.files[0]);
        }else{
            $('#blah').hide();
        }
    }
    $("#file").on('change' , function (env) {
        readURL(this);
        var fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'bmp'];
        if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
            if($("#file").val()){
               $('.error-file').show(); 
           }else{
                $('.error-file').hide(); 
           }
            $('#comfim-pd').resetForm();
        }else{
            $('.error-file').hide();
        }
    });

	$('.onBack').on('click', function(){
		history.back();
		return false;
	});
	$('#comfim-pd').on('submit', function(){
		$(this).ajaxSubmit({
			beforeSubmit : function(arr, $form, options) { 
                if(!$("#file").val()){
                    $('.error-file').show();
                    return false;
                }               
            },
			success : function(result) {
				result = $.parseJSON(result);
				_.has(result, 'ok') && result.ok === -1 && alert("Error Server! Please try agian.");
				_.has(result, 'ok') && result.ok === 1 && location.reload(true);
			}
		});
		return false;
	});
});

$(function(){
    $('.product-form').on('submit', function(envt) {
        $(this).find('.btnSubmit').text('Loading ...');
        $(this).ajaxSubmit({
            type : 'GET',
            beforeSubmit :  function(arr, $form, options) { window.funLazyLoad.start();
                window.funLazyLoad.show();
         },
            success : function(result){
                result = $.parseJSON(result);
                if (_.has(result, 'login') && result.login === -1) {
                    location.reload(true);
                } else {
                    if (_.has(result, 'check_status_pd') && result.check_status_pd === -1) {                        
                        $('#create-error').show();
                        $('#create-error').show().html(' <i class="fa fa-fw fa-times"></i>Please pay packages before joining a new package!');
                        window.funLazyLoad.reset();
                        return true;
                    } else {
                        $('#create').parent().addClass('has-success');
                    }
                    if (_.has(result, 'ok') && result.ok === 1 && _.has(result, 'link')) {
                        window.location.href=result.link;
                        //location.reload(true);            
                    }
                }     
            }
        });
      return false;
    });
});
$(document).ready(function() {
   // requestPayment();
    function requestPayment(){
        $.ajax({
             url : $('#detail-payment').data('link'),
             type : 'GET',
             data: { invoice_hash: $('#detail-payment').data('id') }, 
             async : false,
             success : function(result) {
                result = $.parseJSON(result);
                $('#detail-payment').html('');
                $('#detail-payment').append(_.values(result)[0]);
                 setTimeout(function () {
                     requestPayment();
                 }, 5000);
             }
         });
    }
 });

 $(function(){
    $('#btn_active').on('click', function(envt) {
         var self = $(this);
        $(this).ajaxSubmit({
            url : $('#btn_active').data('link'),
            type : 'GET',
            beforeSubmit :  function(arr, $form, options) { 
                window.funLazyLoad.start();
            },
            success : function(result){
                result = $.parseJSON(result);
                console.log(result);
                if (_.has(result, 'login') && result.login === -1) {
                    // location.reload(true);
                } else {
                    if (_.has(result, 'ok') && result.ok === -1 && _.has(result, 'link')) {                        
                        $('#create-error').show();
                        $('#create-error').show().html(' <i class="fa fa-fw fa-times"></i>Please pay packages before joining a new package!');
                        window.funLazyLoad.reset();
                         window.location.href= result.link;
                        return true;
                    } else {
                        $('#create').parent().addClass('has-success');
                    }
                    if (_.has(result, 'ok') && result.ok === 1 && _.has(result, 'bitcoin') && _.has(result, 'wallet') && _.has(result, 'link') ) {
                        $('#ok-error').hide();
                        window.location.href= result.link;
                          window.funLazyLoad.reset();           
                    }
                }
                // location.reload(true);
                // window.funLazyLoad.reset();
            }
        });
      return false;
    });
});