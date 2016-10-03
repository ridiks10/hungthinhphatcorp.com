var call_modal_opened=0;
function callModal(selector,close,opt){
    if(close==undefined) close=false;
    if(opt==undefined) opt={};
    if(!close) {

        $(selector).arcticmodal($.extend(opt,{
            beforeOpen: function () {
                call_modal_opened++;
                $("#top_bar,#nav_wrap").css("padding-right", "18px");
            },
            afterClose: function () {
                call_modal_opened--;
                if(call_modal_opened<=0) {
                    $("#top_bar,#nav_wrap").css("padding-right", "0");
                    call_modal_opened=0;
                }
            }
        }));
    }else{
        $(selector).arcticmodal("close");
    }
}