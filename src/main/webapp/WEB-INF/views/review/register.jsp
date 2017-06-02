<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Co-Book</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>

						<!-- //for-mobile-apps -->
<link href="/cobook/resources/CoBookDesign/css/bootstrap.css?ver=3" rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/login.css?ver=1" rel="stylesheet" type="text/css" media="all"/>
<link href="/cobook/resources/CoBookDesign/css/style.css?ver=3" rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/medile.css?ver=1" rel='stylesheet' type='text/css' />
<link href="/cobook/resources/CoBookDesign/css/single.css?ver=6" rel='stylesheet' type='text/css' />
<link href="/cobook/resources/CoBookDesign/css/review-resiter-style.css?ver=11" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/contactstyle.css" type="text/css" media="all" />
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/faqstyle.css" type="text/css" media="all" />
						<!-- news-css -->
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/news-css/news.css" type="text/css" media="all" />
						<!-- list-css -->
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/list-css/list.css" type="text/css" media="all" />
						<!-- font-awesome icons -->
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/font-awesome.min.css" />
						<!--별점 css -->
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/star-rating-bookreview.css?ver=4" media="all" type="text/css" />
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/star-theme.css?ver=10" media="all" type="text/css" />
						<!-- js -->
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>//js -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/move-top.js"></script>
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/easing.js"></script>
						<!-- 별점 js -->
<script src="/cobook/resources/CoBookDesign/js/star-rating.js?ver=8" type="text/javascript"></script>
<script src="/cobook/resources/CoBookDesign/js/star-theme.js?ver=5" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- <link href="/cobook/resources/test/mypage.css?ver=3" rel="stylesheet" type="text/css">
 --><!-- start-smoth-scrolling -->
<script src="/cobook/resources/editor/dist/summernote.js"></script>
<script src="/cobook/resources/editor/dist/lang/summernote-ko-KR.js"></script>
<script src="/cobook/resources/js/editorFunction.js"></script>

	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script type="text/javascript">



	var ebook_no = 2//${evo.ebook_no};
	var parent_type="EBOOK";
	
	jQuery(document).ready(function($) {
		callSummernote();
		$("#searchEbook").click(function () {
			$("#searchEbookModal").modal();
		});

		//////////////////대여//////////////////
		//대여하기 전
		//로그인 체크 , 대여하기 모달 Modal open
		//대여하기 전 로그인 체크
		var selectDay = $("#borrow option:selected").val();
		var up = $("#up").hide();
		
		$("#borrow-modal").click(function () {
			//선택한 날짜 , 가격 , member nickname
			selectDay = $("#borrow option:selected").val();
			price = $("#price").html();
			price = price.replace(",", "");
			$("#borrowDays").val(selectDay);

			if (member_no == null) {
				$("#myModal").modal();
			} else {
				$("#coModal").modal();
				
			}
		});	//end

		
		
	});

</script>
<!-- start-smoth-scrolling -->
<link href="/cobook/resources/CoBookDesign/css/owl.carousel.css"
	rel="stylesheet" type="text/css" media="all">
<script src="/cobook/resources/CoBookDesign/js/owl.carousel.js"></script>
<script>
	
</script>

</head>
<body>
	<!-- header login, wishList, navibar start -->
	<c:import url="/WEB-INF/views/header.jsp" charEncoding="UTF-8">
		<c:param name="loginId" value="loginId" />

	</c:import>
	<!-- //bootstrap-pop-up -->


	<!-- single -->
	<div class="single-page-agile-main">
		<div class="container">
			<!-- /w3l-medile-movies-grids -->
			<div class="agileits-single-top">
				<ol class="breadcrumb">
					<li><a href="/cobook/review">책 리뷰</a></li>
					<li class="title-input-li" style="width:94%;">
					<input class="title-input" type="text" name="your name" placeholder="제목" required="" style="width:94%;">
					</li>
				</ol>
			</div>

			<div class="single-page-agile-info">

				<!-- /movie-browse-agile -->
				<div class="show-top-grids-w3lagile">
					<div class="single-left">
						<div class="section group">
							<!-- <div class="cont-desc span_1_of_2"> -->
							<div class="product-details">
								
								
							 	<div class="grid images_3_of_2">
							 
									<div id="searchEbook" class="imgdiv">
										<a href="#">
											<span class="glyphicon glyphicon-plus-sign"  aria-hidden="true"></span>
										</a>
									</div>
								
								</div>
								<div class="desc span_3_of_2">
									<h2>리뷰할 책을 선택하여주세요!</h2>
								</div>
							 
								
								<%-- 
								<div class="grid images_3_of_2">
				
									<img src="/cobook/resources/ebook/cover/novel/novel25.jpg" alt="" />
								</div>
								<div class="desc span_3_of_2">
									<h2>책정보</h2>
									<p>글쓴이 | 번역자</p>

									<div class="detail-stars">
										<ul class="detail-ratings">
										<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
										<li class="starAvg">5점| (0명)</li>
										</ul>
									</div>
									<br> <br>
									<div class="price">
										<p>
											대여가: <span id="price"><fmt:formatNumber
													value="10000" pattern="##,###" /></span><a class="starAvg">원</a>
										</p>
									</div>

									<div class="available">
										<ul>
											<li><span>도서정보:</span> &nbsp;출판사 | 2017-02-10 |epub| 100mb</li>
											<li><span>지원기기:</span>&nbsp; Android | ios | PC | Mac</li>
											<li><span>듣기가능:</span>&nbsp; 듣기가능</li>
										</ul>
									</div>
								</div>  --%>
																	
				<!-- modal -->
									 <div class="modal fade" id="searchEbookModal" role="dialog">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header-single">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h3 class="modal-title member-nickname">리뷰할 도서를 선택하세요! </h3>
												</div>
												<div class="modal-body">
													<div class="modal_search">
												
										<span class='green_window'>
											<input type='text' class='input_text' />
										</span>	
										<a href="#">
											<span class="glyphicon glyphicon-search"  aria-hidden="true"></span>
										</a>
			</div>	
													<div class="row placeholders">
            <div class="col-xs-6 col-sm-3 my_ebook">
              <img src="/cobook/resources/test/anna.jpg">
              <h5>안나카레리나</h5>
              <span class="text-muted">톨스토이</span>
            </div>
            <div class="col-xs-6 col-sm-3 my_ebook">
              <img src="/cobook/resources/test/kaf.jpg" >
              <h5>변신.시골의사</h5>
              <span class="text-muted">프란츠 카프카</span>
            </div>
            <div class="col-xs-6 col-sm-3 my_ebook">
              <img src="/cobook/resources/test/ove.jpg">
              <h5>오베라는 남자</h5>
              <span class="text-muted">프레드릭 배크만</span>
            </div>
            <div class="col-xs-6 col-sm-3 my_ebook">
              <img src="/cobook/resources/test/sorry.jpg">
              <h5>할머니가 미안하다고 전해달랬어요</h5>
              <span class="text-muted">프레드릭 배크만</span>
            </div>
          </div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
													<!-- <ul class="modal-button">
														<li><button class="modal-charge" id="chargePoint" >충전하기</button> 
														<input type="submit" id="borrowEbook" value="대여하기" class="borrow-button">
													</ul> -->
												</div>
											</div>
										</div>

									</div>  
			<!-- modal end -->		
										<div class="clear"></div>
									</div> <!-- product detail -->
								<div class="all-comments">
									<div class="product_desc">
										<h2><a>남잭슨</a>의 별점은 :</h2>
										<input type="text" id="starRating" class="kv-fa rating-loading" value="4" data-size="lg" title=""> <br>
										<p><textarea id='summernote' name="contents" rows="" cols=""></textarea></p>
									</div>
									
								</div>
								<div class="clear"></div>
							</div>
		
							
							
						</div>

					</div>
											<div class="button registerBtn"  >
											<button id="registerBtn" class="borrow-button">글쓰기</button>
											<!-- <input type="submit" value="대여하기" class="borrow-button">  -->
										</div>
					<div class="clearfix"></div>
				</div>

			</div>
		</div>
	</div>

	<!-- footer -->

	<c:import url="/WEB-INF/views/footer.jsp" charEncoding="UTF-8" />

	<!-- Bootstrap Core JavaScript -->
	<script src="/cobook/resources/CoBookDesign/js/bootstrap.min.js"></script>
	<script>
			$(document).ready(
					function() {
						$(".dropdown").hover(
								function() {
									$('.dropdown-menu', this).stop(true, true)
											.slideDown("fast");
									$(this).toggleClass('open');
								},
								function() {
									$('.dropdown-menu', this).stop(true, true)
											.slideUp("fast");
									$(this).toggleClass('open');
								});
					});
			
			$(document).on('ready', function () {
		        
		        $('.kv-fa').rating({
		            theme: 'krajee-fa',
		            filledStar: '<i class="fa fa-star"></i>',
		            emptyStar: '<i class="fa fa-star-o"></i>'
		        });

		        $('.rating,.kv-gly-star,.kv-uni-star,.kv-fa,.kv-svg').on(
		                'change', function () {
		                    console.log('Rating selected: ' + $(this).val());
		                });
		    	console.log($('.rating,.kv-gly-star,.kv-gly-heart,.kv-uni-star,.kv-uni-rook,.kv-fa,.kv-fa-heart,.kv-svg,.kv-svg-heart').val());
		        if($('.rating,.kv-gly-star,.kv-gly-heart,.kv-uni-star,.kv-uni-rook,.kv-fa,.kv-fa-heart,.kv-svg,.kv-svg-heart').val()==0){
		        
		        }
		    });
			
		</script>

</body>
</html>