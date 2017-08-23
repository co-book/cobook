<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<link href="/cobook/resources/CoBookDesign/css/login.css" rel="stylesheet" type="text/css" media="all"/>
<link href="/cobook/resources/CoBookDesign/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/style.css"	rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/faqstyle.css"	rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/single.css"	rel='stylesheet' type='text/css' />
<link href="/cobook/resources/CoBookDesign/css/contactstyle.css"	rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/font-awesome.min.css" rel="stylesheet" />
<!-- news-css -->
<link href="/cobook/resources/CoBookDesign/news-css/news-ReviewList.css?ver=12" rel="stylesheet" type="text/css" media="all" />
<!-- //news-css -->
<!-- list-css -->
<link href="/cobook/resources/CoBookDesign/list-css/list.css" rel="stylesheet" type="text/css" media="all" />
<!-- //list-css -->
<!-- font-awesome icons -->

<!-- //font-awesome icons -->
<!-- js -->
<script src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js"	type="text/javascript"></script>
<!-- //js -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script src="/cobook/resources/CoBookDesign/js/move-top.js"
	type="text/javascript"></script>
<script src="/cobook/resources/CoBookDesign/js/easing.js"
	type="text/javascript"></script>
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


<script type="text/javascript">

//값 초기화 
var moreCnt = 1;
var searchType ='';

$(document).ready(function() {

	//최신 리뷰 먼저 불러옵니다. ;
	searchType='lasted'
	getReviewList();
	
	//오른쪽에 뜨는 최신 리뷰들을 가져옵니다.
	getLastedReviewList();

	

	
	//인기리뷰 클릭했을때
	$('#popularReview').click(function(){
		moreCnt = 1;
		searchType = 'popular';
		getReviewList();
	});
	
	//최신리뷰 클릭했을때
	$('#lastedReview').click(function(){
		moreCnt = 1;
		searchType = 'lasted';
		getReviewList();
	});
	//글쓰기 버튼 click
	/* if(member_no!=null){
		로그인 사용자만 보여야하나?
	} */
	$('#register').click(function () {
		if (member_no == null) {
			$("#myModal").modal();
		} else {	
			location.replace("/cobook/review/register");
		}
		
	});	
})

	
//처음 리스트 불러오는 이벤트 
var getReviewList = function(){
	$.ajax({
		type : "GET",
		url : "/cobook/review/getReviewList",
		data: {
			"searchType" : searchType,
			"moreCnt"	 : moreCnt
		},
		dataType : 'html',
		success : function(data) {
			$('#reviewList').html(data);
			$('.moreCntReview').click(function name() {
				moreCnt=moreCnt+1;
				$(this).css("display","none");
				getMoreList();
			});
		}
	});
}
//더보기로 리스트 불러오기
var getMoreList = function(){
	$.ajax({
		type : "GET",
		url : "/cobook/review/getReviewList",
		data: {
			"searchType" : searchType,
			"moreCnt"	 : moreCnt
		},
		dataType : 'html',
		success : function(data) {
			$('#reviewList').append(data);
			$('.moreCntReview').click(function name() {
				console.log("더보기더보기더보기");
				moreCnt=moreCnt+1;
				$(this).css("display","none");
				getMoreList();
			});
		}
	});
}
//오른쪽화면에 최신리뷰 뽑아오기
var getLastedReviewList = function(){
	$.ajax({
		type : "get",
		url : '/cobook/review/getLastedReviewList',
		dataType : 'html',
		success : function(data) {
			$('#review_lastedReviewList').append(data);

			//자바스크립트 추가
			function blinker() {
				$('.blinking').fadeOut(500);
				$('.blinking').fadeIn(500);
			}
			setInterval(blinker, 1000);

			function cycle($item, $cycler) {
				setTimeout(cycle, 2000, $item.next(), $cycler);

				$item.slideUp(1000, function() {
					$item.appendTo($cycler).show();
				});
			}
			cycle($('#cycler div:first'), $('#cycler'));
			
		}
	});
}
			

				
	
</script>
</head>

<body>
	<!-- header login, wishList, navibar start -->
	<c:import url="/WEB-INF/views/header.jsp" charEncoding="UTF-8">
		<c:param name="loginId" value="loginId" />
	</c:import>
	<!-- content start-->

	<!-- faq-banner -->
	<div class="faq">
		<div class="container">
			<div class="agileits-news-top">
				<ol class="breadcrumb">
					<li><a href="/cobook/">COBOOK</a></li>
					<li class="active">리뷰게시판</li>			
				</ol>
			</div>
			<div class="agileinfo-news-top-grids">
				<div class="col-md-8 wthree-top-news-left">
					<div class="wthree-news-left">
						<div class="bs-example bs-example-tabs" role="tabpanel"	data-example-id="togglable-tabs">
							<ul id="myTab" class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active">
									<a href="allReviewList"	id="lastedReview" role="tab" data-toggle="tab"
									aria-controls="reviewList" aria-expanded="true">최신 리뷰</a>
								</li>
								<li role="presentation">
									<a href="allReviewList"	id="popularReview" role="tab" data-toggle="tab" 
									 aria-controls="reviewList">인기리뷰</a>
								</li>
								<li role="presentation" style ='float: right;'>
									<a href="#" id="register" role="tab">글쓰기</a>
								</li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div role="tabpanel" class="tab-pane fade in active" id="allReviewList" aria-labelledby="home1-tab">
									<div id="reviewList" role="tabpanel" class="tab-pane fade in active" aria-labelledby="home1-tab">
 
									<!-- dddd -->
									</div>
								</div>
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
									<div id="review_lastedReviewList"></div>
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
							<div id="review_bestReply"></div>
							<!--  -->
						</div>
					</div>
					<!-- //news-right-bottom -->
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/footer.jsp" charEncoding="UTF-8" />

</body>
</html>