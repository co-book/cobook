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
<link href="/cobook/resources/CoBookDesign/news-css/news-ReviewList.css?ver=10" rel="stylesheet" type="text/css" media="all" />
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

$(document).ready(function() {
	var moreCnt = 1;
	var searchType ='';
	
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
					console.log("더보기더보기더보기");
					moreCnt=moreCnt+1;
					$(this).css("display","none");
					getMoreList();
				});
			}
		});
	}
	
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
	//최신 리뷰 먼저 불러옵니다. 
	getReviewList('lasted');
	
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
	
			
})
				/* $.ajax({
					type : "get",
					url : '/cobook/review/lastedReviewList',
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
						//자바스크립트 끝
					}
				}); */
/* 
				// 인기리뷰 클릭버튼 이벤트처리
				$("#w3bsd-tab").on("click", function() {
					page = 1;
					console.log("인기리뷰 클릭");
					console.log("인기 page초기화 : " + page);
					console.log(popularityURL);
					getReviewList(popularityURL, '#review_reviewList', 'html');
					// 페이지 체크해서 더보기 버튼 유무 확인
					listenerBtn(page);
				});
				
				// 최신리뷰 버튼 처리
				$("#home1-tab").on("click", function(){
					page  = 1;
					console.log("최신리뷰 클릭");
					getReviewList(listURL, "#review_reviewList", 'html');
					// 페이지 체크해서 더보기 버튼 유무 확인
					listenerBtn(page);
				});
				
				// 더보기 버튼을 눌럿을때 최신더보기인지,인기더보기인지 구분
				$("#paging").on("click", ".moreBtn", function(){

					var isActive =$("#home1-tab").attr("aria-expanded");
					console.log("엑티브 상태 체크: "+isActive);
					if(isActive == "true"){
						page++;
						var url = '/cobook/review/reviewList?page=' + page
						+ "&perPageNum=" + perPageNum + "&searchType="
						+ searchType + "&keyword=" + keyword;						
						console.log("최신 더보기 클릭 :" + page);
						console.log("최신 url값 : " + url);
						getReviewList(url, "#review_reviewList", 'append');
					}else{
						page++;
						var url = '/cobook/review/popularityList?page=' + page
						+ "&perPageNum=" + perPageNum + "&searchType="
						+ searchType + "&keyword=" + keyword;
						console.log("인기 더보기 클릭: " + page);
						console.log("인기 url값 : " + url);
						getReviewList(url, "#review_reviewList", 'append');
						
					}
					// 페이지 체크해서 더보기 버튼 유무 확인
					listenerBtn(page);
					
				});
				
				// 현재 페이지를 체크해서 더보기 버튼 유무 확인
				function listenerBtn(page){
					console.log("페이지 체크: " + page);
					var btn = "<button class='moreBtn'>더보기</button>";
					if(totalPage > page){
						
						$("#paging").html(btn);
					}else{
						$("#paging").html("");
					}
					
				}
				
				
				// AJAX 공통함수
				
				// append OR html 방식인지 선택
				function settingHtml(target, method, data){
					
					if(method == 'append'){
						$(target).append(data);
					}else{
						$(target).html(data);
					}
				} */
				
	
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
									aria-controls="home1" aria-expanded="true">최신 리뷰</a>
								</li>
								<li role="presentation">
									<a href="allReviewList"	id="popularReview" role="tab" data-toggle="tab" 
									 aria-controls="w3bsd">인기리뷰</a>
								</li>
							</ul>
							<div id="myTabContent" class="tab-content">
								
								<div role="tabpanel" class="tab-pane fade in active" id="allReviewList" aria-labelledby="home1-tab">
									<div id="reviewList"></div>
								</div>
								<div id="paging"></div>
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