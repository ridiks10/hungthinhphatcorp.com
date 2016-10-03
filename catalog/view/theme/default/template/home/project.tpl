 <!Doctype html>
<html xmlns="http://www.w3.org/1999/html">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <title>ĐẦU TƯ TÀU BIỂN</title>

    <script src="catalog/view/theme/default/fre/javascript/jquery-2.2.3.min.js"></script>
    <script src="catalog/view/theme/default/fre/javascript/modal/jquery.arcticmodal-0.3.min.js"></script>
    <script src="catalog/view/theme/default/fre/javascript/scripts.js"></script>
    <script src="catalog/view/theme/default/fre/javascript/func.js"></script>

    <link rel="stylesheet" href="catalog/view/theme/default/fre/stylesheet/styles.css" type="text/css">
    <link rel="stylesheet" href="catalog/view/theme/default/fre/stylesheet/modal/jquery.arcticmodal-0.3.css">
    <link rel="stylesheet" href="catalog/view/theme/default/fre/stylesheet/modal/themes/simple.css">
    <link type="image/x-icon" rel="shortcut icon" href="catalog/view/theme/default/fre/images/favicon.ico"/>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, intial-scale=1">
    
<meta name="keywords" content="investment" />
<meta name="description" content="investment" /> 

    <base >

     
</head>
<body>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','../www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-80541744-3', 'auto');
  ga('send', 'pageview');

</script> 


 

    <header>
        <div id='top_bar'>
            <div class='wrapper justify'>
                <!-- <div id='language'>Ngôn ngữ trang web - Tiếng Việt 
                    <span class='font_awesome'></span>
                    <ul id='language_popup'>
                         
                            <li>
                                <a class='current_language' ><img src='catalog/view/theme/default/fre/images/vi.jpg'>Tiếng Việt 
                                </a></li>
                         
                            <li>
                                <a href="#"><img src='catalog/view/theme/default/fre/images/en.jpg'>English 
                                </a></li>
                         
                    </ul>
                </div> -->
                <!-- <div id='top_bar_action_wrap'>
                     
                         
                        <div id='top_bar_action_text'>Trang Tin Tức đã được dich sang tiếng Việtnam 
                            <a href='news/6.html'>Đọc...</a></div>
                     
                </div> -->
                <div id='socials'>
                    <a class='font_awesome' title="Skype chat" href="#" target="_blank"> </a>
                    <a class='font_awesome' title="Twitter" href="#" target="_blank"></a>
                    <a class='font_awesome' title="Vkontakte" href="#" target="_blank"></a>
                    <a class='font_awesome' title="Facebook" href='#' target="_blank"></a>
                    <a class='font_awesome' title="Telegram" href='#' target="_blank"> </a>
                </div>
                <div id='authorization'>
                     
                        <div class="account_link">
                            <a href='<?php echo $self -> url -> link('account/login', '', 'SSL'); ?>'>Đăng nhập</a></div>
                        
                     
                </div>
            </div>
        </div>
        <div id='nav_wrap'>
            <div class='wrapper justify'>
                <a id='logo' href='<?php echo $self -> url -> link('home/page', '', 'SSL'); ?>'>
                <!-- <img src='catalog/view/theme/default/fre/images/logo.png'> -->
               HUNGTHINHPHATCORP.COM
            </a>
                <div id='phone_menu' class='font_awesome'></div>
                <script>
                    $(document).ready(function () {
                        $('#phone_menu').click(function () {
                            $('header nav').slideToggle();
                        });
                    });
                </script>
                <nav>
                    <ul id="navbar_list">
                        <li>
                            <a class="<?php echo $route === 'home/page/news' ? "active_page " : ''  ?>" href="<?php echo $self -> url -> link('home/page/news', '', 'SSL'); ?>">Tin tức</a>
                        </li>
                         
                        <li >
                            <a class="<?php echo $route === 'home/page/project' ? "active_page " : ''  ?>" href="<?php echo $self -> url -> link('home/page/project', '', 'SSL'); ?>">Các dự án của chúng tôi</a>
                        </li>
                         <li >
                            <a class="<?php echo $route === 'home/page/faq' ? "active_page " : ''  ?>" href="<?php echo $self -> url -> link('home/page/faq', '', 'SSL'); ?>">Hỏi và đáp</a>
                        </li>
                         <li>
                            <a class="<?php echo $route === 'home/page/about' ? "active_page " : ''  ?>" href="<?php echo $self -> url -> link('home/page/about', '', 'SSL'); ?>">Giới thiệu về công ty</a>
                        </li>
                         
                         <li>
                            <a class="<?php echo $route === 'home/page/parther' ? "active_page " : ''  ?>" href="<?php echo $self -> url -> link('home/page/parther', '', 'SSL'); ?>">Chương trình liên kết</a>
                        </li>
                        <li>
                            <a class="<?php echo $route === 'home/page/contact' ? "active_page " : ''  ?>" href="<?php echo $self -> url -> link('home/page/contact', '', 'SSL'); ?>">Liên hệ</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <script language="JavaScript">
        var active_href = '';
        if (active_href == '') active_href = window.location.pathname;
        $("#navbar_list a[href='" + active_href + "']").addClass("active_page");
    </script>

 
    <div style="display: none;">
        <div class="box-modal" id="auth_modal">
            <div class="box-modal_close arcticmodal-close font_awesome"> </div>
             
<form method="POST" action="#" formcacher >
    <div style="margin-top:15px">
        <div class='form_input'>
            <input name="user_login" type="text" placeholder="Đăng nhập *">
        </div>
        <div class='form_input'>
            <input name="user_pass" type="password" placeholder="Mật khẩu *">
        </div>
        <button class="form_button" type="submit">Đăng nhập</button>
        <button class="form_button" type="button" style="background-color: orange;float:right" onclick="#';">Tôi quên mật khẩu của mình</button>
    </div>
</form> 
        </div>
    </div>
 

 
    <div id='contacts_header'>
        <div class='wrapper'>
            <h1 id='inner_page_title'>Các dự án của chúng tôi</h1>
             
                <p>Trên trang này, bạn có thể làm quen với danh mục đầu tư của chúng tôi. Tại đây, bạn sẽ tìm thấy các đối tượng mà chúng tôi đã hoặc đang tham gia.</p>
             
        </div>
    </div>
 


<div>
     
    <noscript><div class="alert alert-danger">
    <span class="font_awesome"> </span> Investment <a href='#' target=_blank >Investment</a> 
</div></noscript>
</div>


<div id='gallery_screen'>
    <div class='wrapper'>

        <h2>Các dự án hiện tại đang được xây dựng</h2>
        <div class='gallery_filters wait' data-target=".gallery.wait">
            <div class='gallery_filter active_gallery_filter' data-filter="all">Tất cả các dự án</div>
            <div class='gallery_filter' data-filter="tai">Dự Án Cát Bà</div>
            <div class='gallery_filter' data-filter="spanish">NHÀ XƯỞNG</div>
            <div class='gallery_filter' data-filter="india">TÀU VẬN TẢI</div>
             <div class='gallery_filter' data-filter="dominika">Khu nghỉ dưỡng cao cấp </div>
     
            <div class='gallery_filter' data-filter="kipr">KHU CASINO CAO CẤP</div> 
        </div>
    </div>
    <script>
        $(document).ready(function ()
        {
            $('html').on('click','.gallery_zoom', function()
            {
                var link = $(this).parents('.gallery_slide').find('a').attr('href');
                $("<div id='popup_mask'/>").css({'position':'absolute','display':'none','z-index':'20','background':'rgba(1,1,1,0.5)'}).prependTo('body');
                $("<img id='zoomed_img' src='"+link+"'>").css({'position':'fixed','display':'none','z-index':'21'}).prependTo('body');

                $('#zoomed_img').on('load', function ()
                {
                    var img_width = $(this).width();
                    var img_height = $(this).height();
                    var clientWidth = $(window).width();
                    var clientHeight = $(window).height();
                    var documentHeight = $(document).height();
                    $('#popup_mask').css({'width':clientWidth,'height':documentHeight}).fadeIn();
                    $(this).css({'left':(clientWidth/2-img_width/2), 'top':(clientHeight/2-img_height/2)}).fadeIn();
                });
                return false;
            });
            $('html').on('click', '#popup_mask, #zoomed_img', function ()
            {
                $('#zoomed_img, #popup_mask').fadeOut();
                setTimeout(function ()
                {
                    $('#zoomed_img, #popup_mask').remove();
                },500);
            });

            gallery_filter=function(){
                var filters=$(this);
                var target=$(filters.attr("data-target"));
                if(target.length) {
                    filters.find(".gallery_filter").click(function () {
                        filters.find(".active_gallery_filter").removeClass("active_gallery_filter");
                        $(this).addClass("active_gallery_filter");
                        if($(this).attr("data-filter")!='all') {
                            target.find(".gallery_slide").hide();
                            target.find(".gallery_slide."+$(this).attr("data-filter")).show();
                        }else{
                            target.find(".gallery_slide").show();
                        }
                    });
                }
            }
            $(".gallery_filters.wait").each(gallery_filter);
            $(".gallery_filters.end").each(gallery_filter);
        });
    </script>
    <div id='gallery_one'>
        <div class='gallery wait'>
            <div class='gallery_slide tai'>
                <iframe width="100%" height="100%" src="https://www.youtube.com/embed/26DMXoYpFWY" frameborder="0" allowfullscreen></iframe>
           
            </div>
            <div class='gallery_slide tai'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/venuscb_.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/venuscb.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Venus Cát Bà</span>
                        <p>Dự án Venus Cát Bà.</p>
                    </div>
                </div>
            </div>
           <div class='gallery_slide tai'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/catba.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/catba.jpg'>
                    <div class='gallery_zoom'>
                    </div></a>
                    <div class='gallery_text'>
                        <span>Cát bà</span>
                        <p>Dự án cát bà</p>
                    </div>
                </div>
            </div>
             <div class='gallery_slide tai'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/catba1.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/catba1.jpg'>
                    <div class='gallery_zoom'>
                    </div></a>
                    <div class='gallery_text'>
                        <span>Cát bà</span>
                        <p>Dự án cát bà</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide spanish'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/nhaxuong.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/nhaxuong.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Nhà xưởng</span>
                        <p>Nhà xưởng.</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide spanish'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/nhaxuong1.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/nhaxuong1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Nhà xưởng</span>
                        <p>Nhà xưởng.</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide spanish'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/nhaxuong2.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/nhaxuong2.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Nhà xưởng</span>
                        <p>Nhà xưởng.</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide spanish'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/nhaxuong3.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/nhaxuong3.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Nhà xưởng</span>
                        <p>Nhà xưởng.</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide india'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/tau.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/tau.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Tàu vận tải</span>
                        <p>Tàu vận tải</p>
                    </div>
                </div>
            </div>
             <div class='gallery_slide india'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/tau1.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/tau1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Tàu vận tải</span>
                        <p>Tàu vận tải</p>
                    </div>
                </div>
            </div>
            <!-- 
            <div class='gallery_slide india'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/5-1_small.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/5-1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Ấn Độ</span>
                        <p>Khu dân cư này tọa lạc trên một ngọn đồi nhìn ra Bãi biển Palolem, cách chợ Canacona hoặc Chaudi 2km</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide kipr'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/6-1_small.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/6-1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Síp</span>
                        <p>Khu dân cư «Renaissance Residence» tọa lạc phần phía đông của đảo trong khu vực Iskele, nổi tiếng vì các bãi biển đầy cát và cơ sở hạ tầng nghỉ dưỡng phong phú, bao gồm cả giải trí.</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide kipr'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/7-1_small.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/7-1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Síp</span>
                        <p>Khu dân cư «Eden Beach Apartments» được xây dựng ở Síp nằm giữa thành phố Limassol, chỉ cách bãi biễn xinh đẹp hai bước chân.</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide dominika'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/8-1_small.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/8-1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Cộng hòa Dominica</span>
                        <p>các căn hộ hai phòng ngủ trong khu phức hợp theo phong cách Victoria được xây dựng tuyệt đẹp tọa lạc gần bãi biển thơ mộng Sosua.</p>
                    </div>
                </div>
            </div> -->
        </div>
    </div>
    <div class='wrapper'>
        <h2>Các dự án đã sẵn sàng</h2>
        <div class='gallery_filters end' data-target=".gallery.end">
            <div class='gallery_filter active_gallery_filter' data-filter="all">Tất cả các dự án</div>
            <div class='gallery_filter' data-filter="tai">Dự Án Cát Bà</div>
            <div class='gallery_filter' data-filter="spanish">NHÀ XƯỞNG</div>
            <div class='gallery_filter' data-filter="india">TÀU VẬN TẢI</div>
            <div class='gallery_filter' data-filter="dominika">Khu nghỉ dưỡng cao cấp </div>
             <div class='gallery_filter' data-filter="kipr">KHU CASINO CAO CẤP</div> 
        </div>
    </div>
    <div id='gallery_one'>
        <div class='gallery end'>
            <div class='gallery_slide tai'>
                <iframe width="100%" height="100%" src="https://www.youtube.com/embed/26DMXoYpFWY" frameborder="0" allowfullscreen></iframe>
           
            </div>
            <div class='gallery_slide tai'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/venuscb_.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/venuscb.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Venus Cát Bà</span>
                        <p>Dự án Venus Cát Bà.</p>
                    </div>
                </div>
            </div>
             <div class='gallery_slide tai'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/catba.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/catba.jpg'>
                    <div class='gallery_zoom'>
                    </div></a>
                    <div class='gallery_text'>
                        <span>Cát bà</span>
                        <p>Dự án cát bà</p>
                    </div>
                </div>
            </div>
             <div class='gallery_slide tai'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/catba1.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/catba1.jpg'>
                    <div class='gallery_zoom'>
                    </div></a>
                    <div class='gallery_text'>
                        <span>Cát bà</span>
                        <p>Dự án cát bà</p>
                    </div>
                </div>
            </div>
             <div class='gallery_slide spanish'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/nhaxuong.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/nhaxuong.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Nhà xưởng</span>
                        <p>Nhà xưởng.</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide spanish'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/nhaxuong1.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/nhaxuong1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Nhà xưởng</span>
                        <p>Nhà xưởng.</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide spanish'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/nhaxuong2.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/nhaxuong2.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Nhà xưởng</span>
                        <p>Nhà xưởng.</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide spanish'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/nhaxuong3.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/nhaxuong3.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Nhà xưởng</span>
                        <p>Nhà xưởng.</p>
                    </div>
                </div>
            </div>
             <div class='gallery_slide india'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/tau.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/tau.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Tàu vận tải</span>
                        <p>Tàu vận tải</p>
                    </div>
                </div>
            </div>
             <div class='gallery_slide india'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/tau1.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/tau1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Tàu vận tải</span>
                        <p>Tàu vận tải</p>
                    </div>
                </div>
            </div>
    <!--         
            <div class='gallery_slide india'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/15-1_small.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/15-1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Ấn Độ</span>
                        <p>Villa Rosa nằm gần các cửa hàng và bãi biển nổi tiếng của Candolim и Sinquerim.</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide bolgaria'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/16-1_small.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/16-1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Bulgari</span>
                        <p>Khu dân cư “Aphrodite Gardens.” Bờ biển đầy nắng, căn hộ sang trọng tuyệt đẹp dọc bờ biển</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide franc'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/17-1_small.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/17-1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Pháp</span>
                        <p>Khu dân cư «Royal Baumette» nằm tại Riviera Pháp trong một thành phố nhỏ San Rafael dọc vịnh Agay yên tĩnh </p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide franc'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/18-1_small.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/18-1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Pháp</span>
                        <p>Khu dân cư The Antibes Plaza nằm trên Riviera Pháp trong thành phố cổ Antibes, cách biển 5 phút đi bộ</p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide kipr'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/19-1_small.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/19-1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Síp</span>
                        <p>Khu dân cư «Akamantis Gardens» tọa lạc trên bờ biển tây bắc của Síp trong một khu vực xinh đẹp và yên tĩnh, xung quanh là những lùm cây cam chanh. </p>
                    </div>
                </div>
            </div>
            <div class='gallery_slide dominika'>
                <img alt='' src='catalog/view/theme/default/fre/images/projects/20-1_small.jpg'>
                <div class='gallery_mask'>
                    <a href='catalog/view/theme/default/fre/images/projects/20-1.jpg'><div class='gallery_zoom'>
                        </div></a>
                    <div class='gallery_text'>
                        <span>Cộng hòa Dominica</span>
                        <p>Khu căn hộ trên bờ biển Sosua, với một bể bơi lớn và bể sục; có bãi biển riêng, khu đậu xe và phòng giặt là</p>
                    </div>
                </div>
            </div> -->
        </div>
    </div>
</div>
 


<div  id='inner_page_map_screen'>
    <div class='wrapper'>
        <span class='company_name'>CÔNG TY TNHH SX TM VẬN TẢI BIỂN HTP</span>
        <div class='title_divider'></div>
        <h2>&nbsp;</h2>
    </div>


     


    <script type="text/javascript">

        $(document).ready(function ()
        {

            $('#inner_page_title, #inner_page_title + p, #inner_page_content h3, #regal_page_content h3').css({'transform':'scale(1)'});
            $('#regal_page_content form').css({'transform':'translate3d(0px, 0px, 0px)'});

            $(window).scroll(function ()
            {
                var scrolled = $(window).scrollTop();
                var screen_eight_pos = $('#inner_page_map_screen').offset().top;
                if (scrolled >= screen_eight_pos-1000)
                {
                    $('#inner_page_map_screen .company_name, #inner_page_map_screen .title_divider, #inner_page_map_screen h2').css({'transform':'scale(1)'});
                }
            });

        });

        $( document ).ajaxStart(function() {
            callModal("#ajaxLoading",false,{closeOnEsc: false,closeOnOverlayClick: false});
        }).ajaxStop(function(){
            callModal("#ajaxLoading",true);
        });


    </script>

</div>
<footer>
    <div class='wrapper'>
        <div>CÔNG TY TNHH TM SX VẬN TẢI BIỂN HƯNG THỊNH PHÁT</div>
        <div>Số 8 Mỹ Phú 2C, Khu Mỹ Phú 2, P. Tân Phú, Q.7, TP.HCM</div>
        <span>©  2016. All Rights Reserved.</span>
        <!-- <div id='payment'></div> -->
    </div>
</footer>

<div style="display: none;">
    <div class="box-modal" id="ajaxLoading" style="padding: 30px 20px;">
        <h2>Tải xuống</h2>
        <div align='center'>
            <img src="catalog/view/theme/default/fre/images/loading.gif">
        </div>
    </div>
</div>

<!-- Start SiteHeart code -->


</body>

</html>
