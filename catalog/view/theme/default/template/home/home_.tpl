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
                       
                     <div class="account_link"><a href="<?php echo $self -> url -> link('home/page/register', '', 'SSL'); ?>">Đăng ký</a></div>
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

 

 


 


 
<script>
    $(document).ready(function ()
    {
        var slide_count = $('#screen_one').find('input[type=hidden]').size();
        for (var i=0; i<slide_count; i++)
        {
            $('#main_pagination').append("<div class='main_pagination'/>");
        }
        $('.main_pagination').eq(1).addClass('active_main_pagination');
        $('.main_pagination').click(function ()
        {
            if (($('#screen_one_bg_mask').is(':animated') == false)&&($('#screen_one_bg_mask').is(':visible') == false))
            {
                var index = $(this).index();
                $('.active_main_pagination').removeClass('active_main_pagination');
                $(this).addClass('active_main_pagination');
                var bg = $('#screen_one').find('input[type=hidden]').eq(index).val();
                $('#screen_one_bg_mask').fadeIn();
                setTimeout(function ()
                {
                    $('#screen_one').css({'background':'url('+bg+')'});
                }, 800);
                setTimeout(function ()
                {
                    $('#screen_one_bg_mask').fadeOut();
                }, 1500);
            }
        });
    });

</script>
<style>
    #screen_one{
        background: url('catalog/view/theme/default/fre/images/slide_2.jpg') no-repeat;
        background-size: cover !important;
    }
</style>
<div id='screen_one'>
    <div id='screen_one_bg_mask'></div>
    <input type='hidden' value='catalog/view/theme/default/fre/images/slide_1.jpg'>
    <input type='hidden' value='catalog/view/theme/default/fre/images/slide_5.jpg'>
    <input type='hidden' value='catalog/view/theme/default/fre/images/slide_3.jpg'>
    <input type='hidden' value='catalog/view/theme/default/fre/images/slide_4.jpg'>
    <input type='hidden' value='catalog/view/theme/default/fre/images/slide_6.jpg'>
    <div class="wrapper">
        <div id='screen_one_text'>
            <h1>Đầu tư</h1><br>
            <h2>Vận tải tàu biển</h2><br>
            <h2>Bất động sản</h2><br>
            <!-- <h2>thu nhập cao</h2> -->
            <a href="<?php echo $self -> url -> link('account/login', '', 'SSL'); ?>" style="text-decoration: none"><div id='screen_one_button'><span>Đăng nhập</span></div></a>
        </div>
    </div>
    <img id='screen_one_mask' alt='' src='catalog/view/theme/default/fre/images/screen_one_mask.png'>
    <div id='main_pagination'></div>
</div>
<div id='screen_two'>
    <div class='wrapper'>
        <span class='company_name'>CÔNG TY TNHH TM SX VẬN TẢI BIỂN HTP</span>
        <div class='title_divider'></div>
        <h2>10 năm trong thị trường đầu tư</h2>
        <div class='screen_two_image'>
            <img alt='' src='catalog/view/theme/default/fre/images/screen_two_image.jpg'>
        </div>
        <p>Công ty của chúng tôi chuyên về đóng tàu vận tải biển quốc tế và đầu tư bất động sản khu vực nghỉ dưỡng trên toàn thế giới. Không có gì bí mật rằng khu vực này ít bị ảnh hưởng nhất đối với các thay đổi trong nền kinh tế thế giới. Mọi người luôn mơ ước về việc mua một ngôi nhà cạnh biển, điều mà không nghi ngờ gì nữa đã được phản ánh trong nhu cầu cho các dịch vụ mà chúng tôi cung cấp. Điều đáng lưu ý là chúng tôi tham gia việc triển khai xây dựng cả các công trình mới cũng như mua/bán các công trình hiện có. Chúng tôi cũng quan tâm đến việc cho thuê dài hạn/ngắn hạn các bất động sản dân cư và thương mại.</p>
       <!--  <div class='justify'>
            <div class='investition'>
                <h3>Đầu tư<br> vào bất động sản dân cư chính</h3>
                <div class='investition_divider'></div>
                <p>Công ty của chúng tôi rất quan tâm đến việc tham gia vào xây dựng các khu dân cư mới cho các khách hàng cá nhân trên toàn thế giới.</p>
            </div>
            <div class='investition'>
                <h3>Đầu tư<br> vào bất động sản dân cư phụ</h3>
                <div class='investition_divider'></div>
                <p>Một phần trăm lớn các khách hàng của chúng tôi quan tâm đến các đối tượng bất động sản dân cư hiện có.</p>
            </div>
            <div class='investition'>
                <h3>Đầu tư<br> vào bất động sản thương mại</h3>
                <div class='investition_divider'></div>
                <p>Một phòng ban chuyên biệt trong công ty của chúng tôi triển khai xây dựng các tổ hợp thương mại, khách sạn, trung tâm thương mại.</p>
            </div>
            <div class='investition'>
                <h3>Đầu tư<br> cho thuê</h3>
                <div class='investition_divider'></div>
                <p>Đừng quên về nhu cầu cho thuê lớn cho những ai đang tìm cách tiêu rất nhiều tiền bên bờ biển.</p>
            </div>
        </div> -->
    </div>
</div>
<div id='screen_three'>
    <div class='wrapper'>
        <span class='company_name'>CÔNG TY TNHH TM SX VẬN TẢI BIỂN HTP</span>
        <div class='title_divider'></div>
        <h2>Lợi thế khi làm việc với chúng tôi</h2>
        <div class='justify'>
            <div class='advantage'>
                <img alt='' src='catalog/view/theme/default/fre/images/advantage_1.jpg'>
                <span>ĐÁNG TIN CẬY</span>
                <p>Chúng tôi có rất nhiều kinh nghiệm trong kinh doanh quốc tế vì công ty của chúng tôi đã hoạt động trong hơn 10 năm.</p>
            </div>
            <div class='advantage'>
                <img alt='' src='catalog/view/theme/default/fre/images/advantage_2.jpg'>
                <span>TỰ TIN</span>
                <p>Chúng tôi chỉ làm việc với các dự án có tính thanh khoản cao và những nhà phát triển đáng tin cậy.</p>
            </div>
            <div class='advantage'>
                <img alt='' src='catalog/view/theme/default/fre/images/advantage_3.jpg'>
                <span>ĐỘC LẬP</span>
                <p>Bạn chỉ cần có Internet để làm việc với chúng tôi và bạn có thể đầu tư từ mọi nơi trên thế giới.</p>
            </div>
            <div class='advantage'>
                <img alt='' src='catalog/view/theme/default/fre/images/advantage_4.jpg'>
                <span>TỐC ĐỘ</span>
                <p>Cộng dồn lợi nhuận hàng ngày với một tùy chọn để rút tiền thu nhập nhanh.</p>
            </div>
            <div class='advantage'>
                <img alt='' src='catalog/view/theme/default/fre/images/advantage_5.jpg'>
                <span>HỖ TRỢ</span>
                <p>Chúng tôi luôn quan tâm đến những người mới tham gia lẫn những chuyên gia đã tham gia vào các dự án của chúng tôi.</p>
            </div>
            <div class='advantage'>
                <img alt='' src='catalog/view/theme/default/fre/images/advantage_6.jpg'>
                <span>KHẢ NĂNG THAM GIA</span>
                <p>Bạn có thể thử chỉ với 250 đô la Mỹ.</p>
            </div>
        </div>
    </div>
</div>
<div id='screen_four'>
    <div class='wrapper'>
        <span class='company_name'>CÔNG TY TNHH TM SX VẬN TẢI BIỂN HTP</span>
        <div class='title_divider'></div>
        <h2>Các gói ký quỹ</h2>
        <p>Chọn tùy chọn phù hợp nhất cho bạn. Số lần ký quỹ là không giới hạn.</p>
        <div class='justify'>

             

             
                 
                <div class='deposite deposite_red'>
                    <span class='deposite_title'>90 days</span>
                    <div class='deposite_time_wrap'>
                        <span class='deposite_time_wrap_text'>2% per day</span>
                        <div class='deposite_time'>
                            
                            <span class='deposite_time_text'>5,000,000</span>
                        </div>
                    </div>
                    <div class='deposite_time_triangle'>
                    </div>
                    <div class='deposite_info'>
                        <span>Tối thiểu USD</span>
                        <span>Tối đa USD</span>
                        <span>2% per day</span>
                    </div>
                    <a href="#" style="text-decoration: none"><div class='deposite_registry'>Đầu tư</div></a>
                </div>
             
                 
                <div class='deposite deposite_orange'>
                    <span class='deposite_title'>90 days</span>
                    <div class='deposite_time_wrap'>
                        <span class='deposite_time_wrap_text'>2% per day</span>
                        <div class='deposite_time'>
                            
                            <span class='deposite_time_text'>20,000,000</span>
                        </div>
                    </div>
                    <div class='deposite_time_triangle'>
                    </div>
                    <div class='deposite_info'>
                        <span>Tối thiểu USD</span>
                        <span>Tối đa USD</span>
                        <span>2% per day</span>
                    </div>
                    <a href="#" style="text-decoration: none"><div class='deposite_registry'>Đầu tư</div></a>
                </div>
             
                 
                <div class='deposite deposite_green'>
                    <span class='deposite_title'>90 days</span>
                    <div class='deposite_time_wrap'>
                        <span class='deposite_time_wrap_text'>2% per day</span>
                        <div class='deposite_time'>
                            
                            <span class='deposite_time_text'>50,000,000</span>
                        </div>
                    </div>
                    <div class='deposite_time_triangle'>
                    </div>
                    <div class='deposite_info'>
                        <span>Tối thiểu USD</span>
                        <span>Tối đa USD</span>
                        <span>2% per day</span>
                    </div>
                    <a href="#" style="text-decoration: none"><div class='deposite_registry'>Đầu tư</div></a>
                </div>
             
                 
                <div class='deposite deposite_cyan'>
                    <span class='deposite_title'>90 days</span>
                    <div class='deposite_time_wrap'>
                        <span class='deposite_time_wrap_text'>2% per day</span>
                        <div class='deposite_time'>
                            
                            <span class='deposite_time_text'>100,000,000</span>
                        </div>
                    </div>
                    <div class='deposite_time_triangle'>
                    </div>
                    <div class='deposite_info'>
                        <span>Tối thiểu USD</span>
                        <span>Tối đa USD</span>
                        <span>2% per day</span>
                    </div>
                    <a href="#" style="text-decoration: none"><div class='deposite_registry'>Đầu tư</div></a>
                </div>
                  <div class='deposite deposite_red'>
                    <span class='deposite_title'>90 days</span>
                    <div class='deposite_time_wrap'>
                        <span class='deposite_time_wrap_text'>2% per day</span>
                        <div class='deposite_time'>
                            
                            <span class='deposite_time_text'>500,000,000</span>
                        </div>
                    </div>
                    <div class='deposite_time_triangle'>
                    </div>
                    <div class='deposite_info'>
                        <span>Tối thiểu USD</span>
                        <span>Tối đa USD</span>
                        <span>2% per day</span>
                    </div>
                    <a href="#" style="text-decoration: none"><div class='deposite_registry'>Đầu tư</div></a>
                </div>
                  <div class='deposite deposite_cyan'>
                    <span class='deposite_title'>90 days</span>
                    <div class='deposite_time_wrap'>
                        <span class='deposite_time_wrap_text'>2% per day</span>
                        <div class='deposite_time'>
                            
                            <span class='deposite_time_text'>1,000,000,000</span>
                        </div>
                    </div>
                    <div class='deposite_time_triangle'>
                    </div>
                    <div class='deposite_info'>
                        <span>Tối thiểu USD</span>
                        <span>Tối đa USD</span>
                        <span>2% per day</span>
                    </div>
                    <a href="#" style="text-decoration: none"><div class='deposite_registry'>Đầu tư</div></a>
                </div>
             

        </div>
    </div>
</div>

<div id='screen_five'>
    <div id='digit_1' class='digit'>
        <span>530</span>
        <span><a href="#" target="_blank" style="color:#fff">Đánh giá tích cực</a></span>
    </div>
    <div id='digit_2' class='digit'>
        <span>22</span>
        <span>Những ngày chúng tôi làm việc với cá nhân</span>
    </div>
    <div id='digit_3' class='digit'>
        <span>1923</span>
        <span>Nhà đầu tư</span>
    </div>
    <div id='digit_4' class='digit'>
        <span>1983</span>
        <span>Ký quỹ</span>
    </div>
    <div id='digit_5' class='digit'>
        <span>93681.14</span>
        <span>Số tiền ký quỹ, $</span>
    </div>
    <div id='digit_6' class='digit'>
        <span>42066.91</span>
        <span>Số tiền thanh toán, $</span>
    </div>

</div>
<div id='screen_six'>
    <div class='wrapper'>
        <span class='company_name'>CÔNG TY TNHH TM SX VẬN TẢI BIỂN HTP</span>
        <div class='title_divider'></div>
        <h2>Cách chúng tôi hoạt động</h2>
        <div id='how_we_work'>
            <div id='six_grid'></div>
            <div class='justify'>
                <div id='how_we_registry'>
                    <div class='how_we_rect'>
                        <img alt='' src='catalog/view/theme/default/fre/images/how_we_1.png'>
                    </div>
                    <span>Đăng ký</span>
                    <span>01</span>
                    <p>Để truy cập tài khoản của mình, bạn cần đăng ký; việc này mất chưa đầy một phút.</p>
                </div>
                <div id='how_we_balance'>
                    <div class='how_we_rect'>
                        <img alt='' src='catalog/view/theme/default/fre/images/how_we_2.png'>
                    </div>
                    <span>Nạp tiền số dư</span>
                    <span>02</span>
                    <p>Chọn một cách thuận tiện để nạp tiền tài khoản của bạn. Tự động bổ sung 24 giờ một ngày, 7 ngày một tuần.</p>
                </div>
                <div id='how_we_deposite'>
                    <div class='how_we_rect'>
                        <img alt='' src='catalog/view/theme/default/fre/images/how_we_3.png'>
                    </div>
                    <span>Chọn phương thức tiện lợi để nạp tiền vào số dư tài khoản của bạn. Tài khoản được nạp lại tự động 24 giờ một ngày, 7 ngày một tuần.</span>
                    <span>03</span>
                    <p>Trên quỹ nhận được, bạn có thể tạo ra một tiền gửi phù hợp cho bạn.</p>
                </div>
                <div id='how_we_money'>
                    <div class='how_we_rect'>
                        <img alt='' src='catalog/view/theme/default/fre/images/how_we_4.png'>
                    </div>
                    <span>Nhận lợi nhuận</span>
                    <span>04</span>
                    <p>Trong vòng một ngày, bạn sẽ được đánh giá trên lợi nhuận mà bạn có thể mang lại một cách thuận tiện cho bạn.</p>
                </div>
            </div>
        </div>
        <div id='screen_six_image'>
            <img alt='' src='catalog/view/theme/default/fre/images/screen_six_image.jpg'>
        </div>
        <div id='six_button_view'><span>Chỉ trong 24 giờ bạn sẽ được ghi có lợi nhuận mà bạn có thể rút theo bất kỳ cách nào mà bạn thấy tiện lợi nhất.</span><div id='view_triangle'></div></div>
        <a href="#" style="text-decoration: none"><div id='six_button_registry'><span>Đăng ký</span><div id='registry_triangle'></div></div></a>
    </div>
</div>
<div id='screen_seven'>
    <div class='wrapper'>
        <h2>Máy tính ký quỹ</h2>
        <form class='justify'>
            <img alt='' src='catalog/view/theme/default/fre/images/calc_icon.png'>
            <div id='calc_summ_block' class='calc_block' style="overflow: inherit;">
                <span>Nhập số tiền ký quỹ</span>
                <input type='text' id='calc_summ' value="" placeholder="0.00">
                <div id="calc_help" style="font-size: 12px;line-height: normal"></div>
            </div>
            <div id='calc_plan_block' class='calc_block'>
                <span>Chọn gói cước</span>
                <select id="calc_dp">
                     
                        <option value='{"dp_min_sum":"10.00","dp_max_sum":"50.00","dp_percent":"20.00","dp_days":"10"}'>10 days</option>
                     
                        <option value='{"dp_min_sum":"10.00","dp_max_sum":"50.00","dp_percent":"44.00","dp_days":"20"}'>20 days</option>
                     
                        <option value='{"dp_min_sum":"51.00","dp_max_sum":"10000.00","dp_percent":"450.00","dp_days":"150"}'>150 days</option>
                     
                        <option value='{"dp_min_sum":"500.00","dp_max_sum":"20000.00","dp_percent":"800.00","dp_days":"200"}'>200 days</option>
                     
                </select>
            </div>
            <div id='calc_profit_block' class='calc_block'>
                <span>Tín dụng hàng tuần</span>
                <span id='calc_profit' class='animate'>0.00</span>
            </div>
            <div id='calc_total_profit_block' class='calc_block'>
                <span>Số tiền thanh toán</span>
                <span id='calc_total_profit' class='animate2'>0.00</span>
            </div>
        </form>
    </div>
</div>

<script language="JavaScript">



    var bool = 0;
    var bool2 = 0;
    var bool3 = 0;
    $(document).ready(function ()
    {
        var calcback=function(){
            var dp=$.parseJSON($("#calc_dp option:selected").val());
            var sum=parseFloat($("#calc_summ").val());
            if(sum>0 && !isNaN(sum)){
                if(sum>=dp.dp_min_sum && sum<=dp.dp_max_sum) {
                    $("#calc_help").html("");
                    $("#calc_profit").html(parseFloat(sum * ((dp.dp_percent<=100?1:0) + dp.dp_percent / 100) / dp.dp_days).toFixed(2));
                    $("#calc_total_profit").html(parseFloat(sum * ((dp.dp_percent<=100?1:0) + dp.dp_percent / 100)).toFixed(2));
                }else{
                    $("#calc_profit").html(0);
                    $("#calc_total_profit").html(0);
                    $("#calc_help").html("Số tiền ký quỹ phải từ {0} đến {1}".replace("{0}",dp.dp_min_sum+" USD").replace("{1}",dp.dp_max_sum+" USD"));
                }
            }else{
                $("#calc_help").html("");
            }
        };
        $("#calc_summ").keyup(calcback);
        $("#calc_dp").change(calcback);

        $('#screen_one h1, #screen_one h2, #screen_one_button').css({'transform':'translate3d(0px,0px,0px)'});
        var clientHeight = $(window).height();
        if (clientHeight > 900)
        {
            $('#screen_two .company_name, #screen_two .title_divider, #screen_two h2').css({'transform':'scale(1)'});
            $('.screen_two_image img').css({'opacity':'1'});
            $('.screen_two_image + p').css({'transform':'translate3d(0px,0px,0px)'});
        }
    });
    $(window).scroll(function ()
    {
        var scrolled = $(window).scrollTop();
        var screen_two_pos = $('#screen_two').offset().top;
        var screen_three_pos = $('#screen_three').offset().top;
        var screen_four_pos = $('#screen_four').offset().top;
        var screen_five_pos = $('#screen_five').length?$('#screen_five').offset().top:0;
        var screen_six_pos = $('#screen_six').offset().top;
        var screen_seven_pos = $('#screen_seven').offset().top;
        var screen_eight_pos = $('#screen_eight').offset().top;
        $('#screen_one h1, #screen_one h2, #screen_one_button').css({'transform':'translate3d(0px,0px,0px)'});
        if (scrolled >= screen_two_pos-500)
        {
            $('#screen_two .company_name, #screen_two .title_divider, #screen_two h2').css({'transform':'scale(1)'});
            $('.screen_two_image img').css({'opacity':'1'});
            $('.screen_two_image + p').css({'transform':'translate3d(0px,0px,0px)'});
            $('.investition').eq(0).css({'transform':'scale(1)', 'transition-delay': '2s'});
            $('.investition').eq(1).css({'transform':'scale(1)', 'transition-delay': '2.25s'});
            $('.investition').eq(2).css({'transform':'scale(1)', 'transition-delay': '2.5s'});
            $('.investition').eq(3).css({'transform':'scale(1)', 'transition-delay': '2.75s'});
        }
        if (scrolled >= screen_three_pos-500)
        {
            $('#screen_three .company_name, #screen_three .title_divider, #screen_three h2').css({'transform':'scale(1)'});
            $('.advantage').eq(0).css({'transform':'scale(1)', 'transition-delay': '1.5s'});
            $('.advantage').eq(1).css({'transform':'scale(1)', 'transition-delay': '1.75s'});
            $('.advantage').eq(2).css({'transform':'scale(1)', 'transition-delay': '2s'});
            $('.advantage').eq(3).css({'transform':'scale(1)', 'transition-delay': '2.25s'});
            $('.advantage').eq(4).css({'transform':'scale(1)', 'transition-delay': '2.5s'});
            $('.advantage').eq(5).css({'transform':'scale(1)', 'transition-delay': '2.75s'});
        }
        if (scrolled >= screen_four_pos-500)
        {
            $('#screen_four .company_name, #screen_four .title_divider, #screen_four h2').css({'transform':'scale(1)'});
            $('#screen_four h2 + p').css({'transform':'translate3d(0px,0px,0px)'});
            $('.deposite').css({'transform':'scale(1)'});
            bool3++;
            for(var j=0;j<3;j++)
            {
                var amount = $('.deposite_time_digit').eq(j).text();
                var element = $('.deposite_time_digit').eq(j);
                digit_animate(amount, element, bool3);
            }
        }
        if (screen_five_pos>0 && scrolled >= screen_five_pos-500)
        {
            $('.digit span:first-child, .digit span:last-child').css({'transform':'scale(1)'});
            bool2++;
            for(var j=0;j<6;j++)
            {
                var amount = $('.digit').eq(j).find('span:first-child').text();
                var element = $('.digit').eq(j).find('span:first-child');
                digit_animate(amount, element, bool2);
            }
        }
        if (scrolled >= screen_six_pos-500)
        {
            $('#screen_six .company_name, #screen_six .title_divider, #screen_six h2, #six_button_registry, #six_button_view').css({'transform':'scale(1)'});
            $('#six_grid').css({'width':'1170px'});
            $('#how_we_registry, #how_we_balance, #how_we_deposite, #how_we_money').css({'opacity':'1'});

        }
        if (scrolled >= screen_seven_pos-500)
        {
            $('#screen_seven h2').css({'transform':'scale(1)'});
            $('#screen_seven form').css({'transform':'translate3d(0px,0px,0px)'});
            bool++;
            start_timer(bool);
        }
        if (scrolled >= screen_eight_pos-500)
        {
            $('#screen_eight .company_name, #screen_eight .title_divider, #screen_eight h2').css({'transform':'scale(1)'});
        }
    });
    function start_timer(bool)
    {
        if (bool == 1)
        {
            var animate_text = $('.animate').text();
            $({numberValue: 0}).animate({numberValue: animate_text},
                {
                    duration: 6000,
                    easing: 'linear',
                    step: function() {
                        $('.animate').text(Math.ceil(this.numberValue));
                    }
                });
            var animate_text2 = $('.animate2').text();
            $({numberValue: 0}).animate({numberValue: animate_text2},
                {
                    duration: 6000,
                    easing: 'linear',
                    step: function() {
                        $('.animate2').text(Math.ceil(this.numberValue));
                    }
                });
        }
    }
    function digit_animate(amount, element, bool2)
    {
        if (bool2 == 1)
        {
            $({numberValue: 0}).animate({numberValue: amount},
                {
                    duration: 7000,
                    easing: 'linear',
                    step: function()
                    {
                        $(element).text(Math.ceil(this.numberValue));
                    }
                });
        }
    }
</script>
<div id='screen_eight'>
    <div class='wrapper'>
        <span class='company_name'>CÔNG TY TNHH TM SX VẬN TẢI BIỂN HTP</span>
        <div class='title_divider'></div>
        <h2>Liên hệ</h2>
    </div>


     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYpNL7q1nL29FafMzm9mlmxDLbM8EnPGA"></script>
                    <script language="JavaScript">
                        var map;
                        egglabs = new google.maps.LatLng(10.717768, 106.727672);
                        mapCoordinates = new google.maps.LatLng(10.717768, 106.727672);
                        var marker = new google.maps.Marker({
                            position: egglabs,
                            map: map
                        });
                        function addMarker(feature) {
                            var marker = new google.maps.Marker({
                                position: egglabs,
                                map: map
                            });
                        }
                        function initialize()
                        {
                            var mapOptions = {
                                backgroundColor: "#ffffff",
                                zoom: 18,
                                disableDefaultUI: true,
                                center: mapCoordinates,
                                mapTypeId: google.maps.MapTypeId.TERRAIN,
                                scrollwheel: false
                            };
                            map = new google.maps.Map(document.getElementById('map'),mapOptions);
                            addMarker();
                        }
                        google.maps.event.addDomListener(window, 'load', initialize);
                    </script>
                    <div id='map'>
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
