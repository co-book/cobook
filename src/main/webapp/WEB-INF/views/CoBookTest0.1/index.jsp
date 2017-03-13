<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Co-Book World!</title>
<!-- for-mobile-apps -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="One Movies Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="text/javascript"
	src="/resources/CoBookTest0.1/js/jquery-2.1.4.min.js"></script>
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- 구글 스크립트 -->
<script src="/resources/js/google.js"></script>
<!-- 페이스북 스크립트 -->
<script src="/resources/js/index/facebook.js"></script>
<!-- //for-mobile-apps -->
<link href="/resources/CoBookTest0.1/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="/resources/CoBookTest0.1/css/login.css?ver=6"
	rel="stylesheet" type="text/css" media="all" />
<!--login CSS -->
<link href="/resources/CoBookTest0.1/css/style.css?ver=4"
	rel="stylesheet" type="text/css" media="all" />
<!-- ë©ì¸ì¶ê° -->
<link href="/resources/CoBookTest0.1/css/slider.css" rel="stylesheet"
	type="text/css" media="all" />
<!--  <link href="/resources/CoBookTest0.1/css/style2.css?ver=3" rel="stylesheet" type="text/css" media="all" /> -->
<!-- ë©ì¸ì¶ê° -->
<link rel="stylesheet"
	href="/resources/CoBookTest0.1/css/contactstyle.css" type="text/css"
	media="all" />
<link rel="stylesheet"
	href="/resources/CoBookTest0.1/css/faqstyle.css?ver=1" type="text/css"
	media="all" />
<link href="/resources/CoBookTest0.1/css/single.css" rel='stylesheet'
	type='text/css' />
<link href="/resources/CoBookTest0.1/css/medile.css?ver=2"
	rel='stylesheet' type='text/css' />

<!-- banner-slider -->
<link href="/resources/CoBookTest0.1/css/jquery.slidey.min.css?ver=3"
	rel="stylesheet">
<!-- //banner-slider -->
<!-- pop-up -->
<link href="/resources/CoBookTest0.1/css/popuo-box.css?ver=4"
	rel="stylesheet" type="text/css" media="all" />
<!-- //pop-up -->
<!-- font-awesome icons -->
<link rel="stylesheet"
	href="/resources/CoBookTest0.1/css/font-awesome.min.css" />
<!-- //font-awesome icons -->
<!-- js -->
<!-- <script type="text/javascript" src="/resources/CoBookTest0.1/js/jquery-1.9.0.min.js"></script> -->
<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script type="text/javascript"
	src="/resources/CoBookTest0.1/js/move-top.js"></script>
<script type="text/javascript"
	src="/resources/CoBookTest0.1/js/jquery.nivo.slider.js"></script>
<script type="text/javascript"
	src="/resources/CoBookTest0.1/js/easing.js"></script>
<!-- //js -->
<!-- banner-bottom-plugin -->
<link href="/resources/CoBookTest0.1/css/owl.carousel.css"
	rel="stylesheet" type="text/css" media="all">

<script src="/resources/CoBookTest0.1/js/owl.carousel.js"></script>
<script>
	$(document).ready(function() {
		$("#owl-demo").owlCarousel({

			autoPlay : 3000, //Set AutoPlay to 3 seconds

			items : 5,
			itemsDesktop : [ 640, 4 ],
			itemsDesktopSmall : [ 414, 3 ]

		});

	});
</script>

<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider();
	});
</script>
<script src="/resources/js/index/login.js"></script>
<!-- //banner-bottom-plugin -->
<link
	href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300'
	rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript"
	src="/resources/CoBookTest0.1/js/move-top.js"></script>
<script type="text/javascript"
	src="/resources/CoBookTest0.1/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<script>
	$(document).ready(function(c) {
		$('.sinup-close').on('click', function(c) {
			$('.setting').fadeOut('slow', function(c) {
				$('.setting').remove();
			});
		});
	});
</script>
</head>
<body>
<!-- 페이스북 sdk로드 스크립트 -->
	<script>
	
	window.fbAsyncInit = function() {
		FB.init({
			appId : '135805423595994',
			xfbml : true,
			version : 'v2.8'
		});

		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});

	};
	
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		
	</script>
	<!-- header ì ê¹¨ì§?-->
	<div class="header">
		<div class="container">
			<div class="w3layouts_logo">
				<a href="index.html"><h1>
						CoBook<span></span>
					</h1></a>
			</div>
			<div class="w3_search">
				<form action="#" method="post">
					<input type="text" name="Search" placeholder="Search" required="">
					<input type="submit" value="Go">
				</form>
			</div>
			<div class="w3l_sign_in_register">
				<ul>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Wish List <span class="badge">2</span></a>
						<ul class="dropdown-menu multi-column columns-2">
							<li>
								<div class="wishlist_dropdown">
									<ul class="multi-column-dropdown">
										<li><a href="#">1ê¶</a></li>
										<li><a href="#">ë±íì´ì´ìì ì¸í°ë·°</a></li>
										<div class="dropdown-divider">
											<a></a>
										</div>
										<li><a href="#">Action</a></li>
										<li><a href="#">Biography</a></li>

									</ul>
								</div>
								<div class="clearfix"></div>
							</li>
						</ul></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //header -->

	<!-- bootstrap-pop-up -->
	<div class="modal video-modal fade" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					Hello, CoBook!
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<section>
					<div class="modal-body">
						<div class="w3_login_module">
							<div class="module form-module">
								<div class="toggle">
									<i class="fa fa-times fa-pencil"></i>
									<div class="tooltip">Sign Up!</div>
								</div>
								<div class="form">
									<h3>Login to your account</h3>
									<form class="login" action="/member/loginPOST" method="post">
										<input type="text" id="email" name="email" placeholder="email"
											required=""> <input type="password" id="password"
											name="password" placeholder="Password" required=""> <input
											type="button" id="loginBtn" value="Login">
									</form>
								</div>
								<!-- <div class="social-icons">
									<div class="login-button">
											<a class="fa" href="#"><i class="anc-fa"></i><span>Facebook</span><div class="clear"></div></a> 
											<a class="go" href="#"><i class="anc-go"></i><span>Google+</span><div class="clear"></div></a>
										<div class="clear"></div>
									</div>
								</div> -->
								<div class="form">
									<h3>Create an account</h3>
									<form class="login" action="#" method="post">
										<input type="text" name="Username" placeholder="Username"
											required=""> <input type="password" name="Password"
											placeholder="Password" required=""> <input
											type="email" name="Email" placeholder="Email Address"
											required=""> <input type="text" name="Phone"
											placeholder="Phone Number" required=""> <input
											type="submit" value="Register">
									</form>
								</div>
								<div class="social-icons">
									<div class="login-button">
										<div id="fb-root"></div>
										<a class="fa" id="fBtn" href="#"><i class="anc-fa"></i><span>Facebook</span></a>

										<div class="clear"></div>
										<!--</a>  -->
										<a class="go" id="authorize-button" href="#"><i
											class="anc-go"></i><span>Google+</span> <!-- <button id="authorize-button">구글 버튼</button> -->
											<div class="clear"></div></a>
										<div class="clear"></div>
									</div>
								</div>
								<div class="cta">
									<a href="#">Forgot your password?</a>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script>
		$('.toggle').click(function() {
			// Switches the Icon
			$(this).children('i').toggleClass('fa-pencil');
			// Switches the forms  
			$('.form').animate({
				height : "toggle",
				'padding-top' : 'toggle',
				'padding-bottom' : 'toggle',
				opacity : "toggle"
			}, "slow");
		});

		// 회원가입 창으로 넘어가는 메서드
		function openJoin() {
			$('.toggle').toggle(function() {
				// Switches the Icon
				$(this).children('i').toggleClass('fa-pencil');
				// Switches the forms  
				$('.form').animate({
					height : "toggle",
					'padding-top' : 'toggle',
					'padding-bottom' : 'toggle',
					opacity : "toggle"
				}, "slow");
			});
		}
	</script>
	<!-- nav -->
	<div class="movies_nav">
		<div class="container">
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right"
					id="bs-example-navbar-collapse-1">
					<nav>
						<ul class="nav navbar-nav">
							<li class="active"><a href="index.html">Home</a></li>
							<li class="dropdown"><a href="genres.html"
								class="dropdown-toggle" data-toggle="dropdown">Genres <b
									class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<li>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<li><a href="genres.html">Action</a></li>
												<li><a href="genres.html">Biography</a></li>
												<li><a href="genres.html">Crime</a></li>
												<li><a href="genres.html">Family</a></li>
												<li><a href="horror.html">Horror</a></li>
												<li><a href="genres.html">Romance</a></li>
												<li><a href="genres.html">Sports</a></li>
												<li><a href="genres.html">War</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<li><a href="genres.html">Adventure</a></li>
												<li><a href="comedy.html">Comedy</a></li>
												<li><a href="genres.html">Documentary</a></li>
												<li><a href="genres.html">Fantasy</a></li>
												<li><a href="genres.html">Thriller</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<li><a href="genres.html">Animation</a></li>
												<li><a href="genres.html">Costume</a></li>
												<li><a href="genres.html">Drama</a></li>
												<li><a href="genres.html">History</a></li>
												<li><a href="genres.html">Musical</a></li>
												<li><a href="genres.html">Psychological</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</li>
								</ul></li>
							<li><a href="/news">Review</a></li>
							<li><a href="/list">Mybook</a></li>
							<li><a href="#">About</a></li>
							<li><a href="contact.html">Contact</a></li>
							<li><a href="#">MyPage</a></li>
						</ul>
					</nav>
				</div>
			</nav>
		</div>
	</div>
	<!-- //nav -->
	<!-- banner -->
	<div id="slidey" style="display: none;">
		<ul>
			<li><img src="/resources/CoBookTest0.1/images/5-1.jpg" alt=" ">
				<p class='title'>Tarzan</p>
				<p class='description'>Tarzan, having acclimated to life in
					London, is called back to his former home in the jungle to
					investigate the activities at a mining encampment.</p></li>
			<li><img src="/resources/CoBookTest0.1/images/2-1.jpg" alt=" ">
				<p class='title'>Maximum Ride</p>
				<p class='description'>Six children, genetically cross-bred with
					avian DNA, take flight around the country to discover their
					origins. Along the way, their mysterious past is ...</p></li>
			<li><img src="/resources/CoBookTest0.1/images/3-1.jpg" alt=" ">
				<p class='title'>Independence</p>
				<p class='description'>The fate of humanity hangs in the balance
					as the U.S. President and citizens decide if these aliens are to be
					trusted ...or feared.</p></li>
			<li><img src="/resources/CoBookTest0.1/images/4-1.jpg" alt=" ">
				<p class='title'>Central Intelligence</p>
				<p class='description'>Bullied as a teen for being overweight,
					Bob Stone (Dwayne Johnson) shows up to his high school reunion
					looking fit and muscular. Claiming to be on a top-secret ...</p></li>
			<li><img src="/resources/CoBookTest0.1/images/6.jpg" alt=" ">
				<p class='title'>Ice Age</p>
				<p class='description'>In the film's epilogue, Scrat keeps
					struggling to control the alien ship until it crashes on Mars,
					destroying all life on the planet.</p></li>
		</ul>
	</div>
	<script src="/resources/CoBookTest0.1/js/jquery.slidey.js"></script>
	<script src="/resources/CoBookTest0.1/js/jquery.dotdotdot.min.js"></script>
	<script type="text/javascript">
		$("#slidey").slidey({
			interval : 8000,
			listCount : 5,
			autoplay : false,
			showList : true
		});
		$(".slidey-list-description").dotdotdot();
	</script>
	<!-- //banner -->

	<!-- banner-bottom -->
	<div class="banner-bottom">
		<div class="container">
			<div class="w3_agile_banner_bottom_grid">
				<div id="owl-demo" class="owl-carousel owl-theme">
					<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/anna.jpg"
								title="album-name" class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">ìëì¹´ë ë¦¬ë</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/hist.jpg"
								title="album-name" class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">ì¤ë¯¼ìì ì¡°ì ìì¡°ì¤ë¡</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/harry.jpg"
								title="album-name" class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">HarryPoter</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/GRIT.jpg"
								title="album-name" class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">GRIT</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/retail.jpg"
								title="album-name" class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">í¸ìì ì¸ê°</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/what.jpg"
								title="album-name" class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">êµ­ê°ë ë¬´ìì¸ê°</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/sorry.jpg"
								title="album-name" class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">í ë¨¸ëê° ë¯¸ìíë¤ê³ 
											ì í´ë¬ë¬ì´ì</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/flu.jpg" title="album-name"
								class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">íë£¨ì¸í¸</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/nemesis.jpg"
								title="album-name" class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">nemesis</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //banner-bottom -->

	<!-- general -->
	<div class="general">
		<h4 class="latest-text w3_latest_text">Featured Movies</h4>
		<div class="container">
			<div class="bs-example bs-example-tabs" role="tabpanel"
				data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#home"
						id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
						aria-expanded="true">Featured</a></li>
					<li role="presentation"><a href="#profile" role="tab"
						id="profile-tab" data-toggle="tab" aria-controls="profile"
						aria-expanded="false">Top viewed</a></li>
					<li role="presentation"><a href="#rating" id="rating-tab"
						role="tab" data-toggle="tab" aria-controls="rating"
						aria-expanded="true">Top Rating</a></li>
					<li role="presentation"><a href="#imdb" role="tab"
						id="imdb-tab" data-toggle="tab" aria-controls="imdb"
						aria-expanded="false">Recently Added</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade active in" id="home"
						aria-labelledby="home-tab">
						<div class="w3_agile_featured_movies">
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="single.html" class="hvr-shutter-out-horizontal"><img
									src="/resources/CoBookTest0.1/images/m15.jpg"
									title="album-name" class="img-responsive" alt=" " />
									<div class="w3l-action-icon">
										<i class="fa fa-play-circle" aria-hidden="true"></i>
									</div> </a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6>
											<a href="single.html">Godâs Compass</a>
										</h6>
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>2016</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-half-o"
														aria-hidden="true"></i></a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="ribben">
									<p>NEW</p>
								</div>
							</div>
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="single.html" class="hvr-shutter-out-horizontal"><img
									src="/resources/CoBookTest0.1/images/m2.jpg" title="album-name"
									class="img-responsive" alt=" " />
									<div class="w3l-action-icon">
										<i class="fa fa-play-circle" aria-hidden="true"></i>
									</div> </a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6>
											<a href="single.html">Bad Moms</a>
										</h6>
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>2016</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="ribben">
									<p>NEW</p>
								</div>
							</div>
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="single.html" class="hvr-shutter-out-horizontal"><img
									src="/resources/CoBookTest0.1/images/m5.jpg" title="album-name"
									class="img-responsive" alt=" " />
									<div class="w3l-action-icon">
										<i class="fa fa-play-circle" aria-hidden="true"></i>
									</div> </a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6>
											<a href="single.html">Jason Bourne</a>
										</h6>
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>2016</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-half-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="ribben">
									<p>NEW</p>
								</div>
							</div>
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="single.html" class="hvr-shutter-out-horizontal"><img
									src="/resources/CoBookTest0.1/images/m16.jpg"
									title="album-name" class="img-responsive" alt=" " />
									<div class="w3l-action-icon">
										<i class="fa fa-play-circle" aria-hidden="true"></i>
									</div> </a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6>
											<a href="single.html">Rezort</a>
										</h6>
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>2016</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-half-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="ribben">
									<p>NEW</p>
								</div>
							</div>
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="single.html" class="hvr-shutter-out-horizontal"><img
									src="/resources/CoBookTest0.1/images/m17.jpg"
									title="album-name" class="img-responsive" alt=" " />
									<div class="w3l-action-icon">
										<i class="fa fa-play-circle" aria-hidden="true"></i>
									</div> </a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6>
											<a href="single.html">Peter</a>
										</h6>
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>2016</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="ribben">
									<p>NEW</p>
								</div>
							</div>
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="single.html" class="hvr-shutter-out-horizontal"><img
									src="/resources/CoBookTest0.1/images/m18.jpg"
									title="album-name" class="img-responsive" alt=" " />
									<div class="w3l-action-icon">
										<i class="fa fa-play-circle" aria-hidden="true"></i>
									</div> </a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6>
											<a href="single.html">ISRA 88</a>
										</h6>
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>2016</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="ribben">
									<p>NEW</p>
								</div>
							</div>
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="single.html" class="hvr-shutter-out-horizontal"><img
									src="/resources/CoBookTest0.1/images/m1.jpg" title="album-name"
									class="img-responsive" alt=" " />
									<div class="w3l-action-icon">
										<i class="fa fa-play-circle" aria-hidden="true"></i>
									</div> </a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6>
											<a href="single.html">War Dogs</a>
										</h6>
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>2016</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-half-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="ribben">
									<p>NEW</p>
								</div>
							</div>
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="single.html" class="hvr-shutter-out-horizontal"><img
									src="/resources/CoBookTest0.1/images/m14.jpg"
									title="album-name" class="img-responsive" alt=" " />
									<div class="w3l-action-icon">
										<i class="fa fa-play-circle" aria-hidden="true"></i>
									</div> </a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6>
											<a href="single.html">The Other Side</a>
										</h6>
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>2016</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-half-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="ribben">
									<p>NEW</p>
								</div>
							</div>
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="single.html" class="hvr-shutter-out-horizontal"><img
									src="/resources/CoBookTest0.1/images/m19.jpg"
									title="album-name" class="img-responsive" alt=" " />
									<div class="w3l-action-icon">
										<i class="fa fa-play-circle" aria-hidden="true"></i>
									</div> </a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6>
											<a href="single.html">Civil War</a>
										</h6>
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>2016</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-half-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="ribben">
									<p>NEW</p>
								</div>
							</div>
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="single.html" class="hvr-shutter-out-horizontal"><img
									src="/resources/CoBookTest0.1/images/m20.jpg"
									title="album-name" class="img-responsive" alt=" " />
									<div class="w3l-action-icon">
										<i class="fa fa-play-circle" aria-hidden="true"></i>
									</div> </a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6>
											<a href="single.html">The Secret Life of Pets</a>
										</h6>
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>2016</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-half-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="ribben">
									<p>NEW</p>
								</div>
							</div>
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="single.html" class="hvr-shutter-out-horizontal"><img
									src="/resources/CoBookTest0.1/images/m21.jpg"
									title="album-name" class="img-responsive" alt=" " />
									<div class="w3l-action-icon">
										<i class="fa fa-play-circle" aria-hidden="true"></i>
									</div> </a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6>
											<a href="single.html">The Jungle Book</a>
										</h6>
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>2016</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-half-o"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-o"
														aria-hidden="true"></i></a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="ribben">
									<p>NEW</p>
								</div>
							</div>
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="single.html" class="hvr-shutter-out-horizontal"><img
									src="/resources/CoBookTest0.1/images/m22.jpg"
									title="album-name" class="img-responsive" alt=" " />
									<div class="w3l-action-icon">
										<i class="fa fa-play-circle" aria-hidden="true"></i>
									</div> </a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6>
											<a href="single.html">Assassin's Creed 3</a>
										</h6>
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>2016</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star"
														aria-hidden="true"></i></a></li>
												<li><a href="#"><i class="fa fa-star-half-o"
														aria-hidden="true"></i></a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="ribben">
									<p>NEW</p>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="profile"
						aria-labelledby="profile-tab">
						<div class="col-md-2 w3l-movie-gride-agile">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/m22.jpg" title="album-name"
								class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">Assassin's Creed 3</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
						<div class="col-md-2 w3l-movie-gride-agile">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/m2.jpg" title="album-name"
								class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">Bad Moms</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
						<div class="col-md-2 w3l-movie-gride-agile">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/m9.jpg" title="album-name"
								class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">Central Intelligence</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="rating"
						aria-labelledby="rating-tab">
						<div class="col-md-2 w3l-movie-gride-agile">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/m7.jpg" title="album-name"
								class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">Light B/t Oceans</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
						<div class="col-md-2 w3l-movie-gride-agile">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/m11.jpg" title="album-name"
								class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">X-Men</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
						<div class="col-md-2 w3l-movie-gride-agile">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/m8.jpg" title="album-name"
								class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">The BFG</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
						<div class="col-md-2 w3l-movie-gride-agile">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/m17.jpg" title="album-name"
								class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">Peter</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="imdb"
						aria-labelledby="imdb-tab">
						<div class="col-md-2 w3l-movie-gride-agile">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/m22.jpg" title="album-name"
								class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">Assassin's Creed 3</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
						<div class="col-md-2 w3l-movie-gride-agile">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/m2.jpg" title="album-name"
								class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">Bad Moms</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
						<div class="col-md-2 w3l-movie-gride-agile">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/m9.jpg" title="album-name"
								class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">Central Intelligence</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
						<div class="col-md-2 w3l-movie-gride-agile">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/m10.jpg" title="album-name"
								class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">Don't Think Twice</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
						<div class="col-md-2 w3l-movie-gride-agile">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img
								src="/resources/CoBookTest0.1/images/m23.jpg" title="album-name"
								class="img-responsive" alt=" " />
								<div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true"></i>
								</div> </a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6>
										<a href="single.html">Dead Island 2</a>
									</h6>
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //general -->
	<!-- Latest-tv-series -->
	<div class="Latest-tv-series">
		<h4 class="latest-text w3_latest_text w3_home_popular">Most
			Popular Movies</h4>
		<div class="container">
			<section class="slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<div class="agile_tv_series_grid">
								<div class="col-md-6 agile_tv_series_grid_left">
									<div class="w3ls_market_video_grid1">
										<img src="/resources/CoBookTest0.1/images/h1-1.jpg" alt=" "
											class="img-responsive" /> <a class="w3_play_icon"
											href="#small-dialog"> <span
											class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
										</a>
									</div>
								</div>
								<div class="col-md-6 agile_tv_series_grid_right">
									<p class="fexi_header">the conjuring 2</p>
									<p class="fexi_header_para">
										<span class="conjuring_w3">Story Line<label>:</label></span>
										720p,Bluray HD Free Movie Downloads, Watch Free Movies Online
										with high speed Free Movie Streaming | MyDownloadTube Lorraine
										and Ed Warren go to north London to help a single...
									</p>
									<p class="fexi_header_para">
										<span>Date of Release<label>:</label></span> Jun 10, 2016
									</p>
									<p class="fexi_header_para">
										<span>Genres<label>:</label>
										</span> <a href="genres.html">Drama</a> | <a href="genres.html">Adventure</a>
										| <a href="genres.html">Family</a>
									</p>
									<p class="fexi_header_para fexi_header_para1">
										<span>Star Rating<label>:</label></span> <a href="#"><i
											class="fa fa-star" aria-hidden="true"></i></a> <a href="#"><i
											class="fa fa-star" aria-hidden="true"></i></a> <a href="#"><i
											class="fa fa-star-half-o" aria-hidden="true"></i></a> <a href="#"><i
											class="fa fa-star-o" aria-hidden="true"></i></a> <a href="#"><i
											class="fa fa-star-o" aria-hidden="true"></i></a>
									</p>
								</div>
								<div class="clearfix"></div>
								<div class="agileinfo_flexislider_grids">
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m22.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">Assassin's Creed 3</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-half-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m2.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">Bad Moms</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m9.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">Central Intelligence</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-half-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m7.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">Light B/t Oceans</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-half-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m11.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">X-Men</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-half-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m17.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">Peter</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</li>
						<li>
							<div class="agile_tv_series_grid">
								<div class="col-md-6 agile_tv_series_grid_left">
									<div class="w3ls_market_video_grid1">
										<img src="/resources/CoBookTest0.1/images/h2-1.jpg" alt=" "
											class="img-responsive" /> <a class="w3_play_icon1"
											href="#small-dialog1"> <span
											class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
										</a>
									</div>
								</div>
								<div class="col-md-6 agile_tv_series_grid_right">
									<p class="fexi_header">a haunting in cawdor</p>
									<p class="fexi_header_para">
										<span class="conjuring_w3">Story Line<label>:</label></span>
										Vivian Miller, sent to a rehabilitation programme for young
										offenders, where a theatre camp is used as an alternative to
										jail time. After she views tape ...
									</p>
									<p class="fexi_header_para">
										<span>Date of Release<label>:</label></span> Oct 09, 2015
									</p>
									<p class="fexi_header_para">
										<span>Genres<label>:</label>
										</span> <a href="genres.html">Thriller</a> | <a href="genres.html">Horror</a>
									</p>
									<p class="fexi_header_para fexi_header_para1">
										<span>Star Rating<label>:</label></span> <a href="#"><i
											class="fa fa-star" aria-hidden="true"></i></a> <a href="#"><i
											class="fa fa-star" aria-hidden="true"></i></a> <a href="#"><i
											class="fa fa-star" aria-hidden="true"></i></a> <a href="#"><i
											class="fa fa-star-half-o" aria-hidden="true"></i></a> <a href="#"><i
											class="fa fa-star-o" aria-hidden="true"></i></a>
									</p>
								</div>
								<div class="clearfix"></div>
								<div class="agileinfo_flexislider_grids">
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m2.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">Bad Moms</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m9.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">Central Intelligence</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-half-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m7.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">Light B/t Oceans</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-half-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m11.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">X-Men</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-half-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m17.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">Peter</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m21.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">The Jungle Book</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-half-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</li>
						<li>
							<div class="agile_tv_series_grid">
								<div class="col-md-6 agile_tv_series_grid_left">
									<div class="w3ls_market_video_grid1">
										<img src="/resources/CoBookTest0.1/images/h3-1.jpg" alt=" "
											class="img-responsive" /> <a class="w3_play_icon2"
											href="#small-dialog2"> <span
											class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
										</a>
									</div>
								</div>
								<div class="col-md-6 agile_tv_series_grid_right">
									<p class="fexi_header">civil war captain America</p>
									<p class="fexi_header_para">
										<span class="conjuring_w3">Story Line<label>:</label></span>
										After the Avengers leaves some&nbsp;collateral damage,
										political pressure mounts to install a system of
										accountability.&nbsp;The new status quo deeply divides ...
									</p>
									<p class="fexi_header_para">
										<span>Date of Release<label>:</label></span> May 06, 2016
									</p>
									<p class="fexi_header_para">
										<span>Genres<label>:</label>
										</span> <a href="genres.html">Action</a> | <a href="genres.html">Adventure</a>
									</p>
									<p class="fexi_header_para fexi_header_para1">
										<span>Star Rating<label>:</label></span> <a href="#"><i
											class="fa fa-star" aria-hidden="true"></i></a> <a href="#"><i
											class="fa fa-star" aria-hidden="true"></i></a> <a href="#"><i
											class="fa fa-star" aria-hidden="true"></i></a> <a href="#"><i
											class="fa fa-star-o" aria-hidden="true"></i></a> <a href="#"><i
											class="fa fa-star-o" aria-hidden="true"></i></a>
									</p>
								</div>
								<div class="clearfix"></div>
								<div class="agileinfo_flexislider_grids">
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m2.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">Bad Moms</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m9.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">Central Intelligence</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-half-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m7.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">Light B/t Oceans</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-half-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m11.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">X-Men</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-half-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m17.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">Peter</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img
											src="/resources/CoBookTest0.1/images/m20.jpg"
											title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon">
												<i class="fa fa-play-circle" aria-hidden="true"></i>
											</div> </a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6>
													<a href="single.html">The Secret Life of Pets</a>
												</h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-half-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</section>
			<!-- flexSlider -->
			<link rel="stylesheet"
				href="/resources/CoBookTest0.1/css/flexslider.css" type="text/css"
				media="screen" property="" />
			<script defer src="/resources/CoBookTest0.1/js/jquery.flexslider.js"></script>
			<script type="text/javascript">
				$(window).load(function() {
					$('.flexslider').flexslider({
						animation : "slide",
						start : function(slider) {
							$('body').removeClass('loading');
						}
					});
				});
			</script>
			<!-- //flexSlider -->
		</div>
	</div>
	<!-- pop-up-box -->
	<script src="/resources/CoBookTest0.1/js/jquery.magnific-popup.js"
		type="text/javascript"></script>
	<!--//pop-up-box -->
	<div id="small-dialog" class="mfp-hide">
		<iframe
			src="https://player.vimeo.com/video/164819130?title=0&byline=0"></iframe>
	</div>
	<div id="small-dialog1" class="mfp-hide">
		<iframe src="https://player.vimeo.com/video/148284736"></iframe>
	</div>
	<div id="small-dialog2" class="mfp-hide">
		<iframe
			src="https://player.vimeo.com/video/165197924?color=ffffff&title=0&byline=0&portrait=0"></iframe>
	</div>
	<script>
		$(document).ready(function() {
			$('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
				type : 'inline',
				fixedContentPos : false,
				fixedBgPos : true,
				overflowY : 'auto',
				closeBtnInside : true,
				preloader : false,
				midClick : true,
				removalDelay : 300,
				mainClass : 'my-mfp-zoom-in'
			});

		});
	</script>
	<!-- //Latest-tv-series -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="w3ls_footer_grid">
				<div class="col-md-6 w3ls_footer_grid_left">
					<div class="w3ls_footer_grid_left1">
						<!-- <h2>Subscribe to us</h2>
						<div class="w3ls_footer_grid_left1_pos">
							<a href="index.html"><h2>CoBook<span></span></h2></a>
						</div> -->
					</div>
				</div>
				<div class="col-md-6 w3ls_footer_grid_right">
					<a href="index.html"><h2>
							CoBook<span></span>
						</h2></a>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-5 w3ls_footer_grid1_left">
				<p>
					&copy; 2016 One Movies. All rights reserved | Design by <a
						href="http://w3layouts.com/">W3layouts</a>
				</p>
			</div>
			<div class="col-md-7 w3ls_footer_grid1_right">
				<ul>
					<li><a href="genres.html">Movies</a></li>
					<li><a href="faq.html">FAQ</a></li>
					<li><a href="horror.html">Action</a></li>
					<li><a href="genres.html">Adventure</a></li>
					<li><a href="comedy.html">Comedy</a></li>
					<li><a href="icons.html">Icons</a></li>
					<li><a href="contact.html">Contact Us</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //footer -->
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/CoBookTest0.1/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".dropdown").hover(function() {
				$('.dropdown-menu', this).stop(true, true).slideDown("fast");
				$(this).toggleClass('open');
			}, function() {
				$('.dropdown-menu', this).stop(true, true).slideUp("fast");
				$(this).toggleClass('open');
			});
		});
	</script>
	<!-- //Bootstrap Core JavaScript -->
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<script async defer src="https://apis.google.com/js/api.js"
		onload="this.onload=function(){};handleClientLoad()"
		onreadystatechange="if (this.readyState === 'complete') this.onload()">
		
	</script>
	<!-- //here ends scrolling icon -->
</body>
</html>