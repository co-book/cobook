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
<link href="/cobook/resources/CoBookDesign/css/review-resiter-style.css?ver=1" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/contactstyle.css" type="text/css" media="all" />
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/faqstyle.css" type="text/css" media="all" />
						<!-- news-css -->
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/news-css/news.css" type="text/css" media="all" />
						<!-- list-css -->
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/list-css/list.css" type="text/css" media="all" />
						<!-- font-awesome icons -->
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/font-awesome.min.css" />
						<!--별점 css -->
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/star-rating.css?ver=9" media="all" type="text/css" />
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
<!-- start-smoth-scrolling -->
<script src="/cobook/resources/editor/dist/summernote.js"></script>
<script src="/cobook/resources/editor/dist/lang/summernote-ko-KR.js"></script>
<script src="/cobook/resources/js/editorFunction.js"></script>

	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script type="text/javascript">



	var ebook_no = 2//${evo.ebook_no};
	var parent_type="EBOOK";
	
	jQuery(document).ready(function($) {
		callSummernote();
		$(".member-nickname").prepend(nickname);
		$("#mypoint").prepend(myPoint);

		//////////////////대여//////////////////
		//대여하기 전
		//로그인 체크 , 대여하기 모달 Modal open
		//대여하기 전 로그인 체크
		var selectDay = $("#borrow option:selected").val();
		var price = $("#price").html();
		price =price.replace(",", "");
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
	

		//addWishList check는 서비스단에서 확인!
		$("#addWishList").click(function () {
			console.log("1");
			if (member_no==null) {
				console.log("12");
				$("#myModal").modal();
				console.log("123");
			}else {
				$.ajax({
					type:'GET',
					url:'/cobook/ebook/addWishList',
					data: {
						"member_no" : member_no,
						"ebook_no" : ebook_no
					},
					dataType : 'text' ,
				//	contentType:
					success : function(result,status) {
						console.log(result);
						console.log(status);
						if (result=="SUCCESS") {
							//성공시 요소 지움
							console.log("위시리스트에 추가!");
							
							alert("위시리스트에 추가 되었습니다");
						}else {
							alert("이미 등록된 책입니다");
						}
					}
				});
			}
		});	//addWishList
		
		
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
					<li class="active">글쓰기</li>
				</ol>
			</div>

			<div class="single-page-agile-info">

				<!-- /movie-browse-agile -->
				<div class="show-top-grids-w3lagile">
					<div class="single-left">
						<div class="song">
							<div class="song-info">
								<h3 align="left">타이틀</h3>
								<input type="text" name="your name" placeholder="제목" required="">
							</div>
						</div> 
						<div class="section group">
							<!-- <div class="cont-desc span_1_of_2"> -->
							<div class="product-details">
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
									<div class="share-desc">
										<div class="share">
											<p>대여기간 :</p>
											<!-- <input class="text_box" type="text"> -->
											 <select id="borrow">
												<option value="14">14일</option>
												<option value="30" selected="selected">30일</option>
												<option value="60">60일</option>
												<option value="365">1년</option>
											</select>
											<!-- <div class="dropdown">
											  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
											    대여기간
											    <span class="caret"></span>
											  </button>
											  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
											    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">14일</a></li>
											    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">30일</a></li>
											    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">60일</a></li>
											    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1년</a></li>
											  </ul>
											</div> -->
										</div>
										<div class="button" id="borrow-modal">
											<!--  data-toggle="modal" data-target="#coModal" -->
											<!-- <span id="borrow-start"><a>대여하기</a></span> -->
											<button id="borrow-start" class="borrow-button">대여하기</button>
											<!-- <input type="submit" value="대여하기" class="borrow-button">  -->
										</div>
										<div class="clear"></div>
									</div>
				<!-- modal -->
									<div class="modal fade" id="coModal" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header-single">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h3 class="modal-title member-nickname" id="member-nickname">님의 대여 내역입니다</h3>
												</div>
												<div class="modal-body">
													<table class="modal-table">
														<tr>
															<th><img src=" " style="max-width: 182px; max-height: 268px;"/></th>
															<th>
																<h2>타이틀</h2>
																<p>글쓴이</p> <a>대여기간</a> <input type="text" id="borrowDays" readonly="readonly">일
																<ul class="order">
																	<li>총주문금액 &nbsp; <fmt:formatNumber value="10000" pattern="##,###" /><a class="starAvg">원</a></li>
																	<li>무료이용권&nbsp; 0개</li>
																	<li>할인쿠폰&nbsp; 0개</li>
																	<li>포인트 상품권&nbsp; 0개</li>
																	<li>코북포인트 &nbsp; 0원</li>
																	<li>코북캐시 &nbsp; 0원</li>
																</ul> <br>
																<p class="member-nickname">님의 현재 포인트는 <a id="mypoint"></a>원 입니다</p>
															</th>
														</tr>
													</table>
												</div>
												<div class="modal-footer">
													<!-- <button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button> -->
													<ul class="modal-button">
														<li><button class="modal-charge" id="chargePoint" >충전하기</button> 
														<input type="submit" id="borrowEbook" value="대여하기" class="borrow-button">
													</ul>
												</div>
											</div>
										</div>

									</div> 
			<!-- modal end -->						
											<div class="wish-list">
												<ul>
													<li class="wish"><a href="#" id="addWishList" class="wish">Add to Wishlist</a></li>
													<!-- <li class="compare"><a href="#">Add to Compare</a></li> -->
												</ul>
											</div>
										</div>
										<div class="clear"></div>
									</div> <!-- product detail -->
									<div class="all-comments">
									<div class="product_desc">
										<h2>Details :</h2>
										<p><textarea id='summernote' name="contents" rows="" cols=""></textarea></p>
									</div>
									
								</div>
								<div class="clear"></div>
							</div>
		
							<div class="reply-control">
								<input type="text" id="starRating" class="kv-fa rating-loading"
									value="4" data-size="lg" title=""> <br>
								<textarea class="reply-textarea" rows="10" id="replyContents"
									placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 사용하시면 비공개 될 수 있습니다."></textarea>
								<button type="button" id="addReply" class="reply-regi">리뷰남기기</button>
							</div>
							
						</div>

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