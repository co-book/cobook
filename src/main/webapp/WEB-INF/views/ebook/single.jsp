<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Co-Book World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
	
<!-- //for-mobile-apps -->
<link href="/cobook/resources/CoBookDesign/css/bootstrap.css?ver=3" rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/login.css?ver=3" rel="stylesheet" type="text/css" media="all"/><!--login CSS -->
<link href="/cobook/resources/CoBookDesign/css/style.css?ver=3" rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/medile.css?ver=1" rel='stylesheet' type='text/css' />
<link href="/cobook/resources/CoBookDesign/css/single.css?ver=6" rel='stylesheet' type='text/css' />
<link href="/cobook/resources/CoBookDesign/css/single-style.css?ver=4" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/contactstyle.css" type="text/css" media="all" />
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/faqstyle.css" type="text/css" media="all" />
<!-- news-css -->
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/news-css/news.css" type="text/css" media="all" />
<!-- //news-css -->
<!-- list-css -->
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/list-css/list.css" type="text/css" media="all" />
<!-- //list-css -->
<!-- font-awesome icons -->
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/font-awesome.min.css" />
<!--별점 css -->
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/star-rating.css?ver=9" media="all" type="text/css"/>
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/star-theme.css?ver=10" media="all" type="text/css"/>
<!-- js -->
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js"></script>

<!-- <script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>//js -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/move-top.js"></script>
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/easing.js"></script>
<!-- 별점 js -->
<script src="/cobook/resources/CoBookDesign/js/star-rating.js?ver=8" type="text/javascript"></script>
<script src="/cobook/resources/CoBookDesign/js/star-theme.js?ver=5" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- start-smoth-scrolling -->

<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
		
		
		
/* 		$("button[name='comment']").click(function () {
			if($("#reply-comment").css("display") == "none")
					{
				console.log(this);
						$("#reply-comment").show();
					}else {
						$("#reply-comment").hide();
						console.log("hide??");
					}
		}); 
		 $(".single-button").closest("div").click(function () {
		*/
		
		 $(".single-button").click(function () {
			 if($("#reply-comment").css("display") == "none")
					{
						$(this).next("#reply-comment").toggle();
					}else {
						$(this).next("#reply-comment").toggle();
					} 
		}); 
			
			var up = $("#up").hide();
		$(".comment-regi").click(function () {
			 $("#comment-up").add(up).show();
		}); 
	});
	

</script>
<!-- start-smoth-scrolling -->
<link href="/cobook/resources/CoBookDesign/css/owl.carousel.css" rel="stylesheet" type="text/css"
	media="all">
<script src="/cobook/resources/CoBookDesign/js/owl.carousel.js"></script>
<script>
	$(document).ready(function() {
		$("#owl-demo").owlCarousel({

			autoPlay : 3000, //Set AutoPlay to 3 seconds

			items : 5,
			itemsDesktop : [ 640, 5 ],
			itemsDesktopSmall : [ 414, 4 ]

		});

	});
</script>
<!-- <script src="js/simplePlayer.js"></script>
<script>
	$("document").ready(function() {
		$("#video").simplePlayer();
	});
</script> -->

</head>
<body>
	<!-- header login, wishList, navibar start -->
<c:import url="/WEB-INF/views/header.jsp" charEncoding="UTF-8" >
	<c:param name="loginId" value="loginId" />
</c:import>
<!-- //bootstrap-pop-up -->

	
	<!-- single -->
	<div class="single-page-agile-main">
		<div class="container">
			<!-- /w3l-medile-movies-grids -->
			<div class="agileits-single-top">
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active">Single</li>
				</ol>
			</div>
			
			<div class="single-page-agile-info">
			
				<!-- /movie-browse-agile -->
				<div class="show-top-grids-w3lagile">
					<div class="col-sm-8 single-left">
						<div class="song">
							<div class="song-info">
								<h3>A MAN CALLED OVE</h3>
							</div>
						</div> <!-- song -->
							<div class="section group">
								<!-- <div class="cont-desc span_1_of_2"> -->
									<div class="product-details">
										<div class="grid images_3_of_2">
											<img src="/cobook/resources/CoBookDesign/images/ove.jpg" alt="" />
										</div>
										<div class="desc span_3_of_2">
											<h2>A MAN CALLED OVE</h2>
											<p>프레드릭 배크만 | 최민우역</p>
											<div class="detail-stars">
												<ul class="detail-ratings">
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
											<p></p>
											<div class="price">
												<p>
													Price: <span>$500</span>
												</p>
											</div>
											<div class="available">
												<ul>
													<li><span>도서정보:</span> &nbsp;다산책방 | 2015년 05월 15일 출간 | EPUB | 20.3 MB </li>
													<li><span>지원기기:</span>&nbsp; 5lbs</li>
													<li><span>듣기가능:</span>&nbsp; 566</li>
												</ul>
											</div>
											<div class="share-desc">
												<div class="share">
													<p>대여기간 :</p>
													<!-- <input class="text_box" type="text"> -->
													<select name="borrow">
														<option value="14days">14일</option>
														<option value="30days" selected="selected">30일</option>
														<option value="60days">60일</option>
														<option value="1year">1년</option>
													</select>
												</div>
												<div class="button" data-toggle="modal" data-target="#coModal">
													<span><a href="#">대여하기</a></span>
												</div>
												<div class="clear"></div>
											</div>
									<!-- modal -->
									<div class="modal fade" id="coModal" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header-single">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h3 class="modal-title">dal2sis님의 대여 내역입니다</h3>
												</div>
												<div class="modal-body">
													<table class="modal-table">
														<tr>
																<th><img src="/cobook/resources/CoBookDesign/images/ove.jpg" alt=""/></th>
																<th>
																<h2>오베라는 남자</h2>
																<p>프레드릭 배크만</p>
																<a>대여기간</a> 30일
																<ul class="order">
																<li>총주문금액 &nbsp; 4900원</li>
																<li>무료이용권&nbsp; 0개</li>
																<li>할인쿠폰&nbsp; 0개</li>
																<li>포인트 상품권&nbsp; 0개</li>
																<li>코북포인트 &nbsp; 0원</li>
																<li>코북캐시 &nbsp; 0원</li>
																<li><a>총결제금액</a>&nbsp; 4900원</li>
																</ul>
																<br>
																<p>dal2sis님의 현재 포인트는 3000원 입니다</p>
																</th>
														</tr>
													</table>
												</div>
												<div class="modal-footer">
													<!-- <button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button> -->
														<ul class="modal-button">
															<li><button class="modal-charge">충전하기</button>
															<button class="modal-borrow">대여하기</button></li>					
														</ul>
												</div>
											</div>
										</div>
									</div> 
									<!-- modal end -->
											<div class="wish-list">
												<ul>
													<li class="wish"><a href="#">Add to wishlist</a></li>
													<li class="compare"><a href="#">Add to Compare</a></li>
												</ul>
											</div>
										</div>
										<div class="clear"></div>
									</div> <!-- product detail -->
									<div class="all-comments">
									<div class="product_desc">
										<h2>Details :</h2>
										<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
	           							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
									</div>
									</div>
									<br></br>
									<br></br>
									<h3>이 책을 평가해주세요!</h3>
									<div class="reply-control">
									<input type="text" class="kv-fa rating-loading" value="4" data-size="lg" title="">
        							<br>
									<textarea class="reply-textarea" rows="10" id="reply" placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 사용하시면 비공개 될 수 있습니다."></textarea>
									<button type="button" class="reply-regi">리뷰남기기</button>
									</div>
									<br></br>
									<br></br>
									<h3>리뷰</h3>
															<!-- first list start -->
									<div id="wrap-media-list">
									<div class="media_list">		
										<div class="media-left">
											<div class="detail-stars">
												<ul class="detail-ratings">
													<li><a href="#"><i class="fa fa-star"
															aria-hidden="true"></i></a></li>
													<li><a href="#"><i class="fa fa-star"
															aria-hidden="true"></i></a></li>
													<li><a href="#"><i class="fa fa-star"
															aria-hidden="true"></i></a></li>
													<li><a href="#"><i class="fa fa-star"
															aria-hidden="true"></i></a></li>
													<li><a href="#"><i class="fa fa-star-half-o"
															aria-hidden="true"></i></a></li><br>
													<li>dal2sis</li><br>
													<li>2017-03-26</li>
												</ul>
											</div>
										</div>
										<div class="media-body-single">
											<div class="single-reply-remove">
												<button type="button" class="reply-remove">
													<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
												</button>
											</div>
											<br>
											<p>흐라발의 소설은 완벽하게 역설적이다. 무한한 욕망과 유한한 만족감 사이에서 탁월하게 균형을 맞추고 있는 그의 글은,
											순리를 따르면서도 지극히 반항적이며 지혜를 잃지 않으면서도 끊임없이 고뇌한다.</p>
											<br>
											<div class="single-button"  name="comment-btn">
												<button type="button" class="btn btn-default btn-sm" id="comment">
	  											<span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 댓글
												</button>
												<button type="button" class="btn btn-default btn-sm" id="thumbs">
	  											<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 0
	  											</button>
											</div>
											
											<div class="reply-comment" id="reply-comment">
												<div class="comment-up" id="comment-up">
													<p>흐라발의 매력에 퐁당퐁당 내맘을 받아줭!</p>
													<p>nam*** /2017-04-03/ <a>삭제</a></p>
												</div>
												<textarea class="comment-textarea" rows="5" id="comment-area" placeholder="이 곳에 댓글을 남겨주세요"></textarea>
												<button type="button" class="comment-regi">등록하기</button>
											</div>
										</div>
									</div>	
														<!-- first list end -->
									
									<div class="media_list">
										<div class="media-left">
											<div class="detail-stars">
												<ul class="detail-ratings">
													<li><a href="#"><i class="fa fa-star"
															aria-hidden="true"></i></a></li>
													<li><a href="#"><i class="fa fa-star"
															aria-hidden="true"></i></a></li>
													<li><a href="#"><i class="fa fa-star"
															aria-hidden="true"></i></a></li>
													<li><a href="#"><i class="fa fa-star"
															aria-hidden="true"></i></a></li>
													<li><a href="#"><i class="fa fa-star-half-o"
															aria-hidden="true"></i></a></li><br>
													<li>namjackson</li><br>
													<li>2017-04-04</li>
												</ul>
											</div>
										</div>
										<div class="media-body-single">
											<div class="single-reply-remove">
												<button type="button" class="reply-remove">
													<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
												</button>
											</div>
											<br>
											<p>깊이를 헤아릴 수 없을 정도로 경이로운 테드 창의 이야기들은 스위스 시계처럼 정교하게 째깍째깍
											나아가다가 당신의 인식 안에서 충격적이고 파괴적으로 폭발한다.</p>
											<br>
											<div class="single-button">
												<button type="button" class="btn btn-default btn-sm" id="comment" name="comment">
	  											<span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 댓글
												</button>
												<button type="button" class="btn btn-default btn-sm" id="thumbs">
	  											<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 0
	  											</button>
											</div>
											<div class="reply-comment" id="reply-comment">
												<div class="comment-up">
													<p id="up">님아 어디서 약을 팔어</p>
													<p>chacha /2017-04-05/ <a>삭제</a></p>
												</div>
												<textarea class="comment-textarea" rows="5" id="comment-area" placeholder="이 곳에 댓글을 남겨주세요"></textarea>
												<button type="button" class="comment-regi">등록하기</button>
											</div>
										</div>
									</div>
									</div>
									<div class="reply-more">
										<button type="button" class="btn-more">+ 더 보기</button>
									</div>
								<!-- </div> -->
							</div>
							<!-- <div class="song-grid-right"></div>
							<div class="clearfix"></div>-->
						</div>
						<div class="col-md-4 single-right">
							<h3>Up Next</h3>
							<div class="single-grid-right">
								<div class="single-right-grids">
									<div class="col-md-4 single-right-grid-left">
										<a href="single.html"><img src="/cobook/resources/CoBookDesign/images/harry.jpg" alt="" /></a>
									</div>
									<div class="col-md-8 single-right-grid-right">
										<a href="single.html" class="title"> Nullam interdum metus</a>
										<p class="author">
											<a href="#" class="author">John Maniya</a>
										</p>
										<p class="views">2,114,200 views</p>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="single-right-grids">
									<div class="col-md-4 single-right-grid-left">
										<a href="single.html"><img src="/cobook/resources/CoBookDesign/images/hist.jpg" alt="" /></a>
									</div>
									<div class="col-md-8 single-right-grid-right">
										<a href="single.html" class="title"> Nullam interdum metus</a>
										<p class="author">
											<a href="#" class="author">John Maniya</a>
										</p>
										<p class="views">2,114,200 views</p>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="single-right-grids">
									<div class="col-md-4 single-right-grid-left">
										<a href="single.html"><img src="/cobook/resources/CoBookDesign/images/kaf.jpg" alt="" /></a>
									</div>
									<div class="col-md-8 single-right-grid-right">
										<a href="single.html" class="title"> Nullam interdum metus</a>
										<p class="author">
											<a href="#" class="author">John Maniya</a>
										</p>
										<p class="views">2,114,200 views</p>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="single-right-grids">
									<div class="col-md-4 single-right-grid-left">
										<a href="single.html"><img src="/cobook/resources/CoBookDesign/images/flu.jpg" alt="" /></a>
									</div>
									<div class="col-md-8 single-right-grid-right">
										<a href="single.html" class="title"> Nullam interdum metus</a>
										<p class="author">
											<a href="#" class="author">John Maniya</a>
										</p>
										<p class="views">2,114,200 views</p>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="single-right-grids">
									<div class="col-md-4 single-right-grid-left">
										<a href="single.html"><img src="/cobook/resources/CoBookDesign/images/GRIT.jpg" alt="" /></a>
									</div>
									<div class="col-md-8 single-right-grid-right">
										<a href="single.html" class="title"> Nullam interdum metus</a>
										<p class="author">
											<a href="#" class="author">John Maniya</a>
										</p>
										<p class="views">2,114,200 views</p>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="single-right-grids">
									<div class="col-md-4 single-right-grid-left">
										<a href="single.html"><img src="/cobook/resources/CoBookDesign/images/nemesis.jpg" alt="" /></a>
									</div>
									<div class="col-md-8 single-right-grid-right">
										<a href="single.html" class="title"> Nullam interdum metus</a>
										<p class="author">
											<a href="#" class="author">John Maniya</a>
										</p>
										<p class="views">2,114,200 views</p>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="single-right-grids">
									<div class="col-md-4 single-right-grid-left">
										<a href="single.html"><img src="/cobook/resources/CoBookDesign/images/retail.jpg" alt="" /></a>
									</div>
									<div class="col-md-8 single-right-grid-right">
										<a href="single.html" class="title"> Nullam interdum metus</a>
										<p class="author">
											By <a href="#" class="author">John Maniya</a>
										</p>
										<p class="views">2,114,200 views</p>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="single-right-grids">
									<div class="col-md-4 single-right-grid-left">
										<a href="single.html"><img src="/cobook/resources/CoBookDesign/images/m15.jpg" alt="" /></a>
									</div>
									<div class="col-md-8 single-right-grid-right">
										<a href="single.html" class="title"> Nullam interdum metus</a>
										<p class="author">
											By <a href="#" class="author">John Maniya</a>
										</p>
										<p class="views">2,114,200 views</p>
									</div>
									<div class="clearfix"></div>
								</div>

							</div>
						</div>

						<div class="clearfix"></div>
					</div>
					<!-- //movie-browse-agile -->
			<br></br>
				</div>
				<!-- //w3l-latest-movies-grids -->
			</div>
		</div>
		<!-- //w3l-medile-movies-grids -->

		<!-- footer -->

<c:import url="/WEB-INF/views/footer.jsp" charEncoding="UTF-8"/>

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
		<!-- <script src="js/bvelocity.min.js"></script>
		<script src="js/borrowmain.js"></script>JS borrow jQuery -->
</body>
</html>