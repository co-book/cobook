<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Co-Book World!</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="resources/CoBookDesign/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/CoBookDesign/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/CoBookDesign/css/faqstyle.css" rel="stylesheet"  type="text/css" media="all" />
<link href="resources/CoBookDesign/css/single.css" rel='stylesheet' type='text/css' />
<link href="resources/CoBookDesign/css/contactstyle.css" rel="stylesheet"  type="text/css" media="all" />
<!-- news-css -->
<link href="resources/CoBookDesign/news-css/news.css" rel="stylesheet"  type="text/css" media="all" />
<!-- //news-css -->
<!-- list-css -->
<link href="resources/CoBookDesign/list-css/list.css" rel="stylesheet"  type="text/css" media="all" />
<!-- //list-css -->
<!-- font-awesome icons -->
<link href="resources/CoBookDesign/css/font-awesome.min.css" rel="stylesheet" />
<!-- //font-awesome icons -->
<!-- js -->
<script src="resources/CoBookDesign/js/jquery-2.1.4.min.js" type="text/javascript" ></script>
<!-- //js -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script src="resources/CoBookDesign/js/move-top.js" type="text/javascript" ></script>
<script src="resources/CoBookDesign/js/easing.js" type="text/javascript" ></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->


<script type="text/javascript">
$(document).ready(function(){
	//리스트
	$.ajax({
		type : "get",
		url : 'review/reviewList',
		dataType : 'html',
		success : function(data) {
			$('#review_reviewList').append(data);
		}
	});
	
	$.ajax({
		type : "get",
		url : 'review/lastedReviewList',
		dataType : 'html',
		success : function(data) {
			$('#review_lastedReviewList').append(data);
			
			//자바스크립트 추가
			function blinker() {
				$('.blinking').fadeOut(500);
				$('.blinking').fadeIn(500);
			}
			setInterval(blinker, 1000);
			
			function cycle($item, $cycler){
				setTimeout(cycle, 2000, $item.next(), $cycler);
				
				$item.slideUp(1000,function(){
					$item.appendTo($cycler).show();        
				});
			}
			cycle($('#cycler div:first'),  $('#cycler'));
			//자바스크립트 끝
		}
	});
	
	$.ajax({
		type : "get",
		url : 'review/bestReply',
		dataType : 'html',
		success : function(data) {
			$('#review_bestReply').append(data);
		}
	});
	
});

</script>
</head>
	
<body>
<!-- header login, wishList, navibar start -->
<c:import url="/WEB-INF/views/header.jsp" charEncoding="UTF-8" >
</c:import>
<!-- content start-->

<!-- faq-banner -->
	<div class="faq">
			<div class="container">
				<div class="agileits-news-top">
					<ol class="breadcrumb">
					  <li><a href="index.html">COBOOK</a></li>
					  <li class="active">리뷰게시판</li>
					</ol>
				</div>
				<div class="agileinfo-news-top-grids">
					<div class="col-md-8 wthree-top-news-left">
						<div class="wthree-news-left">
							<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
								<ul id="myTab" class="nav nav-tabs" role="tablist">
									<li role="presentation" class="active"><a href="#home1" id="home1-tab" role="tab" data-toggle="tab" aria-controls="home1" aria-expanded="true">최신 리뷰</a></li>
									<li role="presentation"><a href="#w3bsd" role="tab" id="w3bsd-tab" data-toggle="tab" aria-controls="w3bsd">인기리뷰</a></li>
								</ul>
								<div id="myTabContent" class="tab-content">
								<!-- 리뷰 리스트 -->
									<div id="review_reviewList"></div>

								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4 wthree-news-right">
						<!-- news-right-top -->
						<div class="news-right-top">
							<div class="wthree-news-right-heading">
								<h3>최근 리뷰</h3>
							</div>
							<div class="wthree-news-right-top">
								<div class="news-grids-bottom">
									<!-- date -->
									<div id="design" class="date">
										
										<!-- -->
										<div id ="review_lastedReviewList"> </div>
										<!--  -->
										
									</div>
									<!-- //date -->
								</div>
							</div>
						</div>
						<!-- //news-right-top -->
						<!-- news-right-bottom -->
						<div class="news-right-bottom">
							<div class="wthree-news-right-heading">
								<h3>실시간 댓글</h3>
							</div>
							<div class="news-right-bottom-bg">
								<!--  -->
								<div id="review_bestReply"> </div>
								<!--  -->
							</div>
						</div>
						<!-- //news-right-bottom -->
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
	</div>


<c:import url="/WEB-INF/views/footer.jsp" charEncoding="UTF-8"/>

</body>
</html>