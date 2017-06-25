<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Co-Book World!</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //for-mobile-apps -->
<link href="/cobook/resources/CoBookDesign/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet"
	href="/cobook/resources/CoBookDesign/css/faqstyle.css" type="text/css"
	media="all" />
<link href="/cobook/resources/CoBookDesign/css/medile.css"
	rel='stylesheet' type='text/css' />
<link href="/cobook/resources/CoBookDesign/css/single.css"
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="/cobook/resources/CoBookDesign/css/contactstyle.css"
	type="text/css" media="all" />
<!-- news-css -->
<link rel="stylesheet"
	href="/cobook/resources/CoBookDesign/css/news.css" type="text/css"
	media="all" />
<!-- //news-css -->
<!-- list-css -->
<link rel="stylesheet"
	href="/cobook/resources/CoBookDesign/list-css/list.css?ver=5" type="text/css"
	media="all" />
<!-- //list-css -->
<!-- font-awesome icons -->
<link rel="stylesheet"
	href="/cobook/resources/CoBookDesign/css/font-awesome.min.css" />
<!-- //font-awesome icons -->
<!-- js -->
<script type="text/javascript"
	src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<link
	href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300'
	rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript"
	src="/cobook/resources/CoBookDesign/js/move-top.js"></script>
<script type="text/javascript"
	src="/cobook/resources/CoBookDesign/js/easing.js"></script>
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
<!-- tables -->
<link rel="stylesheet" type="text/css"
	href="/cobook/resources/CoBookDesign/list-css/table-style.css" />
<link rel="stylesheet" type="text/css"
	href="/cobook/resources/CoBookDesign/list-css/basictable.css" />
<script type="text/javascript"
	src="/cobook/resources/CoBookDesign/list-js/jquery.basictable.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#table').basictable();

		/* $('#table-breakpoint').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint1').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint2').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint3').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint4').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint5').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint6').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint7').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint8').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint9').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint10').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint11').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint12').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint13').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint14').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint15').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint16').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint17').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint18').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint19').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint20').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint21').basictable({
		"src/main/java"	breakpoint : 768
		});
		$('#table-breakpoint22').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint23').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint24').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint25').basictable({
			breakpoint : 768
		});
		$('#table-breakpoint26').basictable({
			breakpoint : 768
		}); */
		
		var getMybookList = function (con) {
			$.ajax({
				type : "GET",
				url : '/cobook/mybook/mybookAllList',
				dataType : 'html',
				data : {
					"con" : con
				},
				success : function(data) {
					$('#mybookListCall').html(data);
				}
			});
		}
		
		getMybookList();
		
		$("#myTab").on("click", "li a", function name() {
			
			var keyword = $(this).text();
			getMybookList(keyword);	
		});
	});
</script>
<!-- //tables -->
</head>

<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/header.jsp" charEncoding="UTF-8">
		<c:param name="loginId" value="loginId" />
	</c:import>
	<!-- //header -->

	<!-- bootstrap-pop-up -->

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
	</script>

	<!-- faq-banner -->
	<div class="faq">
		<h4 class="latest-text w3_faq_latest_text w3_latest_text">개인 소설</h4>
		<div class="container">
			<div class="agileits-news-top1">
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active">List</li>
				</ol>
			</div>
			<div class="bs-example bs-example-tabs" role="tabpanel"
				data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a class="mybookTab"
						role="tab" data-toggle="tab" aria-controls="home"
						aria-expanded="true">전체</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="a">ㄱ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="b">ㄴ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="c">ㄷ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="d">ㄹ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="e">ㅁ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="f">ㅂ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="g">ㅅ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="h">ㅇ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="i">ㅈ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="j">ㅊ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="k">ㅋ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="l">ㅌ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="m">ㅍ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="n">ㅎ</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="o">ABC</a></li>
					<li role="presentation"><a class="mybookTab" role="tab"
						data-toggle="tab" aria-controls="p">123</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="home"
						aria-labelledby="home-tab"></div>
					<div id="mybookListCall"></div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/footer.jsp" charEncoding="UTF-8" />

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
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
	<!-- //here ends scrolling icon -->
</body>
</html>