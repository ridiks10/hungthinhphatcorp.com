<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<!--[if gt IE 9]><!--> <html class="gt-ie8 gt-ie9 not-ie"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<link rel="icon" href="catalog/view/theme/default/img/favicon.png">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
	<title> <?php echo $title; ?> </title>
		<meta http-equiv="cache-control" content="no-cache"/>
		<base href="<?php echo $base; ?>" />
		<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; ?>" />
		<?php } ?>
		<?php if ($keywords) { ?>
		<meta name="keywords" content="<?php echo $keywords; ?>" />
		<?php } ?>
	<!-- Open Sans font from Google CDN -->
	<!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300&amp;subset=latin" rel="stylesheet" type="text/css"> -->

		<script src="catalog/view/javascript/jquery/underscorejs/underscorejs.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/jquery/jquery.easyui.min.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/jquery/jquery-ui.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/jquery/jquery.quick.pagination.min.js" type="text/javascript"></script>
	<script src="catalog/view/theme/default/assets/javascripts/bootstrap.min.js" type="text/javascript"></script>
	<script src="catalog/view/theme/default/assets/javascripts/landerapp.min.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/loading.js" type="text/javascript"></script>
		<script src="catalog/view/theme/default/assets/javascripts/owl.carousel.js"></script>
  <script type="text/javascript" src="catalog/view/theme/default/assets/javascripts/jquery.simplyscroll.js"></script>
	<!-- stylesheets -->
	<link href="catalog/view/theme/default/assets/stylesheets/bootstrap.min.css" rel="stylesheet" type="text/css">

  <link href="catalog/view/theme/default/assets/stylesheets/landerapp.min.css" rel="stylesheet" type="text/css">
  <link href="catalog/view/theme/default/assets/stylesheets/widgets.min.css" rel="stylesheet" type="text/css">
  <link href="catalog/view/theme/default/assets/stylesheets/pages.min.css" rel="stylesheet" type="text/css">
  <link href="catalog/view/theme/default/assets/stylesheets/rtl.min.css" rel="stylesheet" type="text/css">
  <link href="catalog/view/theme/default/assets/stylesheets/themes.min.css" rel="stylesheet" type="text/css">
	<link href="catalog/view/theme/default/assets/stylesheets/stylesheet.css" rel="stylesheet" type="text/css">
	
	  <link href="catalog/view/theme/default/assets/stylesheets/jquery.simplyscroll.css" rel="stylesheet" type="text/css">
  <link href="catalog/view/theme/default/assets/stylesheets/owl.carousel.css" rel="stylesheet">
  <link href="catalog/view/theme/default/assets/stylesheets/owl.theme.css" rel="stylesheet">
  <link href="catalog/view/theme/default/assets/stylesheets/owl.transitions.css" rel="stylesheet">
		<link href="catalog/view/theme/default/stylesheet/tree.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/fakeloader.css" rel="stylesheet">
		<link href="catalog/view/theme/default/stylesheet/icon.css" rel="stylesheet">

	<!--[if lt IE 9]>
		<script src="assets/javascripts/ie.min.js"></script>
	<![endif]-->
	<?php foreach ($styles as $style) { ?>
		<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
		<?php } ?>
		<script src="catalog/view/javascript/common.js" type="text/javascript"></script>

		<?php foreach ($scripts as $script) { ?>
		<script src="<?php echo $script; ?>" type="text/javascript"></script>
		<?php } ?>
		<?php echo $google_analytics; ?>
		<script type="text/javascript">
			window.funLazyLoad = {
				start : function() {
					$("#fakeloader").fakeLoader({
						timeToHide : 99999999999, //Time in milliseconds for fakeLoader disappear
						zIndex : "999", //Default zIndex
						spinner : "spinner2",
						bgColor : "rgba(0,0,0,0.5)", //Hex, RGB or RGBA colors
					});
				},
				reset : function() {
					$("#fakeloader").hide();
				},
				show : function() {
					$("#fakeloader").show();
				}
			}

		</script>
	<script type="text/javascript">

  (function($) {
      $(function() {
              $("#scroller").simplyScroll();
      });
   })(jQuery);
    
  </script>
  <script>
    jQuery(document).ready(function() {
      jQuery("#owl-demo").owlCarousel({
        autoPlay : 3000,
        stopOnHover : true,
        navigation:true,
        paginationSpeed : 1000,
        goToFirstSpeed : 2000,
        singleItem : true,
        autoHeight : true,
        pagination :false,
        navigationText : ["<",">"],
        transitionStyle:"fade"
      });
    });
</script>
		<script src="catalog/view/javascript/jquery.form.min.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/alertifyjs/alertify.js" type="text/javascript"></script>	
		<link href="catalog/view/theme/default/css/al_css/alertify.css" rel="stylesheet">
		<script src="catalog/view/javascript/changeLang.js" type="text/javascript"></script>
	</head>

<body class="theme-default main-menu-animated page-pricing <?php echo $class ?>">

<script>var init = [];</script>

<div id="main-wrapper">

    <div id="fakeloader"></div>
  <div id="main-navbar" class="navbar navbar-inverse" role="navigation">
    <!-- Main menu toggle -->
    <button type="button" id="main-menu-toggle"><i class="navbar-icon fa fa-bars icon"></i><span class="hide-menu-text">HIDE MENU</span></button>
    <div class="navbar-inner">
      <!-- Main navbar header -->
      <div class="navbar-header">
        <!-- Logo -->
        <a href="#" class="navbar-brand">
          Hungthinhphatcorp.com
        </a>
        <!-- Main navbar toggle -->
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar-collapse"><i class="navbar-icon fa fa-bars"></i></button>
      </div> <!-- / .navbar-header -->
      <div id="main-navbar-collapse" class="collapse navbar-collapse main-navbar-collapse">
        <div>
          <div class="right clearfix">
            <ul class="nav navbar-nav pull-right right-navbar-nav">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle user-menu" data-toggle="dropdown">
                  <img src="catalog/view/theme/default/assets/images/1.jpg" alt="">
                  <span><?php// echo $username; ?></span> <i class="fa fa-caret-down" aria-hidden="true"></i>
                </a>
                <ul class="dropdown-menu">
                  <li><a href="<?php echo $self -> url -> link('account/setting', '', 'SSL'); ?>"><i class="dropdown-icon fa fa-cog"></i>&nbsp;&nbsp;Settings</a></li>
                  <li class="divider"></li>
                  <li><a href="<?php echo $self -> url -> link('account/logout', '', 'SSL'); ?>"><i class="dropdown-icon fa fa-power-off"></i>&nbsp;&nbsp;Log Out</a></li>
                </ul>
              </li>
              
            </ul>
          </div> 
        </div>
      </div>
    </div> 
  </div>

