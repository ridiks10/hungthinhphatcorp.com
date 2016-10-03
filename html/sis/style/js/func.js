
$('document').ready(function() {
     var Zobj=$("[Ztext]");
	 if(Zobj){
	   Zobj.each(function(i){
	     $(this).attr("Zhref",$(this).attr("href"));
	     $(this).attr("href","JavaScript://");
	     $(this).click(function(){
		      TConfirm($(this).attr("Ztext"),$(this).attr("Zhref"))
	     });
	   });
	 }
     CheckAll = function(name,obj){
         $("input[type='checkbox'][name^="+name+"]").attr('checked',obj.checked);
     }
	 WinOpn = function(href,w,h,n){
		 window.open(href,n,'width='+w+',height='+h);
	 }
	 TConfirm = function(text,url){
		 if(confirm(text)){
			 window.location=url;
		 }
	 }
	 CSelect = function(obj){
		 obj.focus(); 
		 obj.select(); 
	 }

});

function createCookie(name,value,time) {
    if (time) {
        var date = new Date();
        date.setTime(date.getTime()+(time*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name,"",-1);
}
