<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Co-Book World!</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js" type="text/javascript" ></script>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="/cobook/resources/CoBookDesign/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/faqstyle.css" rel="stylesheet"  type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/medile.css" rel='stylesheet' type='text/css' />
<link href="/cobook/resources/CoBookDesign/css/single.css" rel='stylesheet' type='text/css' />
<link href="/cobook/resources/CoBookDesign/css/contactstyle.css" rel="stylesheet"  type="text/css" media="all" />
<!-- news-css -->
<link href="/cobook/resources/CoBookDesign/news-css/news-ReviewSingle.css?ver=4" rel="stylesheet"  type="text/css" media="all" />
<!-- //news-css -->
<!-- list-css -->
<link href="/cobook/resources/CoBookDesign/list-css/list.css" rel="stylesheet"  type="text/css" media="all" />
<!-- //list-css -->
<!-- font-awesome icons -->
<link href="/cobook/resources/CoBookDesign/css/font-awesome.min.css" rel="stylesheet"  />
<!-- //font-awesome icons -->
<!-- js -->
<script src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js" type="text/javascript" ></script>
<!-- //js -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script src="/cobook/resources/CoBookDesign/js/move-top.js" type="text/javascript" ></script>
<script src="/cobook/resources/CoBookDesign/js/easing.js" type="text/javascript" ></script>

<script type="text/javascript" src="/cobook/resources/js/replies/reply.js"></script>
<script type="text/javascript">
	var review_no = ${review.REVIEW_NO};
	var board_no = ${review.REVIEW_NO};
	var ebook_no = ${review.EBOOK_NO};
	var writer = ${review.MEMBER_NO};
	var parent_type = "REIVEW";
	var moreCnt = 1;
	var replyEventInit;
	var commentEventInit;
	
	jQuery(document).ready(function($) {
		var reply = new Reply();
		reply.member_no=member_no;
		reply.board_no=review_no;
		reply.parent_type=parent_type;
		
		replyEventInit = function() {
			//로그인 && 현재 로그인 사용자 != 작성자
			// 코멘트 리스트 가져와서,  숨기기/보이기 
			$(".commentBtn").click(function() {
				var parent_no = $(this).data("parent_no");
				if ($("#comment" + parent_no).css("display") == "none") {
					//해당 리플의 코멘트 불러옴
					reply.getCommentList(parent_no);
					$("#comment" + parent_no).toggle();	//코멘트 목록 Show
				} else {
					$("#comment" + parent_no).toggle(); //코멘트 목록 hide
				}
			});
			//
			//리플 삭제하기
			$(".reply-remove").click(function () {
				var delete_reply_no=$(this).data("reply_no");
				if(member_no==null)		//member_no = 해당 작성자가 다를때 삭제버튼 hide;
				{	
					$("#reply-delete").hide();
					$("#myModal").modal();
				}else {
					reply.deleteReply(delete_reply_no);
				}	
			});

			//더보기 
			$('#moreCnt').click(function() {
				reply.moreCnt=reply.moreCnt+1;
				moreCnt=moreCnt+1;
				reply.getReplyList();
			}); 

			//add like - 좋아요
			$(".thumbs").click(function () {
				if (member_no == null) {
					$("#myModal").modal();
				} else {
					reply.addLike($(this).data("reply_no"));
				}
			});	//addlick
			
			//add like - 좋아요
			$(".thumbs_can").click(function () {
				if (member_no == null) {
					$("#myModal").modal();
				} else {
					reply.deleteLike($(this).data("reply_no"));
				}
			});	//addlick
			
		}

		commentEventInit = function() {
			//삭제버튼 Visible
			//if (member_no == null || $(".comment-delete").data("member_no")!= member_no) {
			if (member_no == null ) {
				$(".comment-delete").hide();
			} else {
				$(".comment-delete").show();
			}
			
			//코멘트 등록
			$(".addComment").click(function() {	//해당 클래스에는 모두 같은 이벤트 부여
				// $("#comment-up").add(up).show();
				var parent_no= $(this).data("parent_no");
				if (member_no == null) {
					$("#myModal").modal();
				} else {
					reply.addComment(parent_no);
				}
			}); //comment
			
			//코멘트 삭제
			$(".comment-delete").click(function() {	
				var reply_no= $(this).data("reply_no");
				var parent_no= $(this).data("parent_no");
				var writer= $(this).data("member_no");
				if (member_no == null) {
					$("#myModal").modal();
				} else if(writer != member_no){
					alert("작성자만 삭제가 가능합니다.");
				} else {
					reply.deleteComment(reply_no,parent_no);
				}
			}); //comment
		}

		//리플등록
		$('#addReply').click(function() {
			if (member_no == null) {
				$("#myModal").modal();
			} else {
				reply.starRating=$('#starRating').val();
				reply.contents=$('#replyContents').val();
				reply.addReply();
			}
		}); //리플달기
		
		//리플리스트 불러오기 
		reply.getReplyList();

		//리뷰 글쓴이의 다른 리뷰들 
		$.ajax({
			type : "GET",
			url : "/cobook/review/getWriterReviews",
			data : {
				"member_no" : writer
			},
			dataType : 'html',
			success : function(data) {
				$('#getWriterReviews').append(data);
			}
		});
		
		//해당 책의 다른 리뷰들 
		$.ajax({
			type : "GET",
			url : "/cobook/review/getOtherReviews",
			data : {
				"ebook_no" : ebook_no
			},
			dataType : 'html',
			success : function(data) {
				$('#getOtherReviews').html(data);
			}
		});
		//////////////////////////////////////////리플리스트
		
		
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
		
		
	});
</script>

</head>
	
<body>
<!-- header login, wishList, navibar start -->
<c:import url="/WEB-INF/views/header.jsp" charEncoding="UTF-8" >
	<c:param name="loginId" value="loginId" />
</c:import>

<!-- faq-banner -->
	<div class="faq">
			<div class="container">
				<div class="agileits-news-top">
					<ol class="breadcrumb">
					  <li><a href="/cobook">CoBook</a></li>
					   <li><a href="/cobook/review">리뷰</a></li>
					  <li class="active">${review.REVIEW_NO}</li>
					</ol>
				</div>
				<div class="agileinfo-news-top-grids">
					<div class="col-md-8 wthree-top-news-left">
						<div class="wthree-news-left">
							<div class="wthree-news-left-img">
								
								<h4>${review.TITLE}</h4>
								<!-- 작성자, 날짜, 댓글갯수 -->
											
								<div class="s-author">
									<p>Posted By <a href="#"><i class="fa fa-user" aria-hidden="true"></i> ${review.NICKNAME}</a> &nbsp;&nbsp; <i class="fa fa-calendar" aria-hidden="true"></i> ${review.REG_DATE} &nbsp;&nbsp; <a href="#"><i class="fa fa-comments" aria-hidden="true"></i> Comments (${review.REPLYCOUNT})</a></p>
								</div>
															<!-- 시작 -->
				<div class="product-details">
					<div class="ebook_detail">
	           	 				<div class="grid images_3_of_2">
				
									<img src="${review.COVERURL}" alt="" />
								</div>
								<div class="desc span_3_of_2">
									<h2>${review.EBOOKTITLE}</h2>
									<p>${review.AUTHOR}|${review.TRANSLATOR}</p>

									<div class="detail-stars">
										<ul class="detail-ratings">
										<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
																
											<li class="starAvg"> 5점| (3명)</li>									
										</ul>
									</div>
									<br> <br>
									<div class="price">
										<p>
											대여가: <span id="price"><fmt:formatNumber
													value="${review.PRICE}" pattern="##,###" /></span><a class="starAvg">원</a>
										</p>
									</div>

									<div class="available">
										<ul>
											<li><span>도서정보:</span> &nbsp;${review.PUBLISHER} | <fmt:formatDate
													value="${review.PUBLISHEDDATE}" pattern="yyyy년 MM월 dd일" /> | ${review.FILETYPE} | ${review.FILESIZE}</li>
											<li><span>지원기기:</span>&nbsp; Android | ios | PC | Mac</li>
											<li><span>듣기가능:</span>&nbsp; <c:choose>
													<c:when test="${review.LISTENING==1}">
																듣기가능
															</c:when>
													<c:otherwise>
																듣기없음
															</c:otherwise>
												</c:choose></li>
										</ul>
									</div>
									
									<div class="wish-list">
												<ul>
												<button class="ebook-button" onclick="window.open('/cobook/ebook/single/${review.EBOOK_NO}')"; >해당 책보러가기</button>
													<!--<li class="wish"><a href="#" class="select_can">선택 취소</a></li>
													 <li class="compare"><a href="#">Add to Compare</a></li> -->
												</ul>
									</div>
								</div> 
								<div class='clear'></div>
	            	</div>
	            	
            	</div>
								<!-- 끝 -->		
							
								
							
								<!-- 삭제,수정,목록 버튼 -->
								<!-- <button class="modBtn" id="modBtn">수정</button>
								<button class="rmBtn" id="rmBtn">삭제</button>
								<button class="listBtn" id="listBtn">목록</button> -->
								<div id="fb-root"></div>
								<div class="news-shar-buttons">
									<ul>
										<li>
										</li>
										
										<li>
										</li>
										<li class="news-twitter">
										</li>
										<li>
										</li>
										<li>
											<!-- Place this tag where you want the +1 button to render. -->
											<div class="g-plusone" data-size="medium"></div>

									
										</li>
									</ul>
								</div>
								<div class="w3-agile-news-text">
									<p><span>${review.contents}</span></p>
								</div>
							</div>
						</div>
						<div id ="getWriterReviews" class="wthree-related-news-left">
							<h4> ${review.NICKNAME}님의 또 다른 리뷰</h4>
							<!-- 다른리뷰 자리 -->
						</div>
						<!-- agile-comments -->
						<div class="agile-news-comments">
							<div class="agile-news-comments-info">
								<h4>Comments</h4>
								<br>
								<textarea class="reply-textarea" rows="10" id="replyContents" placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 사용하시면 비공개 될 수 있습니다."></textarea>
								<button type="button" id="addReply" class="reply-regi">댓글 남기기</button>
								<br/><br/><br/>
								<div id ="reply_list" >
								
								</div>
							</div>
						</div>
						<!-- //agile-comments -->
						<div class="news-related">
							
						</div>
					</div>
					<div class="col-md-4 wthree-news-right">
						<!-- news-right-top -->
						<div class="news-right-top">
							<div class="wthree-news-right-heading">
								<h3>Updated News</h3>
							</div>
							<div class="wthree-news-right-top">
								<div class="news-grids-bottom">
									<!-- date -->
									<div id="design" class="date">
										<div id="cycler">   
											<div class="date-text">
												<a href="news-single.html">August 15,2016</a>
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
											</div>
											<div class="date-text">
												<a href="news-single.html">July 08,2016 <span class="blinking"><img src="images/new.png" alt="" /></span></a>
												<p>Nullam non turpis sit amet metus tristique egestas et et orci.</p>
											</div>
											<div class="date-text">
												<a href="news-single.html">February 15,2016</a>
												<p>Duis venenatis ac ipsum vel ultricies in placerat quam</p>
											</div>
											<div class="date-text">
												<a href="news-single.html">January 15,2016 <span class="blinking"><img src="images/new.png" alt="" /></span></a>
												<p>Pellentesque ullamcorper fringilla ipsum, ornare dapibus velit volutpat sit amet.</p>
											</div>
											<div class="date-text">
												<a href="news-single.html">September 24,2016</a>
												<p>In lobortis ipsum mi, ac imperdiet elit pellentesque at.</p>
											</div>
											<div class="date-text">
												<a href="news-single.html">August 15,2016</a>
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
											</div>
											<div class="date-text">
												<a href="news-single.html">July 08,2016 <span class="blinking"><img src="images/new.png" alt="" /></span></a>
												<p>Nullam non turpis sit amet metus tristique egestas et et orci.</p>
											</div>
											<div class="date-text">
												<a href="news-single.html">February 15,2016</a>
												<p>Duis venenatis ac ipsum vel ultricies in placerat quam</p>
											</div>
											<div class="date-text">
												<a href="news-single.html">January 15,2016 <span class="blinking"><img src="images/new.png" alt="" /></span></a>
												<p>Pellentesque ullamcorper fringilla ipsum, ornare dapibus velit volutpat sit amet.</p>
											</div>
											<div class="date-text">
												<a href="news-single.html">September 24,2016</a>
												<p>In lobortis ipsum mi, ac imperdiet elit pellentesque at.</p>
											</div>
										</div>
										<script>
										function blinker() {
											$('.blinking').fadeOut(500);
											$('.blinking').fadeIn(500);
										}
										setInterval(blinker, 1000);
										</script>
										<script>
											function cycle($item, $cycler){
												setTimeout(cycle, 2000, $item.next(), $cycler);
												
												$item.slideUp(1000,function(){
													$item.appendTo($cycler).show();        
												});
												}
											cycle($('#cycler div:first'),  $('#cycler'));
										</script>
									</div>
									<!-- //date -->
								</div>
							</div>
						</div>
						<!-- //news-right-top -->
						<!-- news-right-bottom -->
						<div class="news-right-bottom">
							<div class="wthree-news-right-heading">
								<h3>${review.EBOOKTITLE}의 다른리뷰</h3>
							</div>
							<div id ='getOtherReviews' class="news-right-bottom-bg">
								
							</div>
							</div>
						</div>
						<!-- //news-right-bottom -->
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
				<div class="w3l-latest-movies-grids">
					<h4 class="latest-text w3_latest_text">Latest Movies</h4>
						<div class="container">
								<!-- /latest-movies -->
									<div class="browse-inner">
								   <div class="col-md-2 w3l-movie-gride-agile">
											 <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m7.jpg" title="album-name" alt=" " />
											 <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
										</a>
										  <div class="mid-1">
											<div class="w3l-movie-text">
												<h6><a href="single.html">Light B/t Oceans</a></h6>							
											</div>
											<div class="mid-2">
											
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															<li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
															  
											
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
											 <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m8.jpg" title="album-name" alt=" " />
											 <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
										</a>
										  <div class="mid-1">
											<div class="w3l-movie-text">
												<h6><a href="single.html">The BFG</a></h6>							
											</div>
											<div class="mid-2">
											
												<p>2016</p>
												 <div class="block-stars">
													<ul class="w3l-ratings">
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
															  
											
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
											 <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m9.jpg" title="album-name" alt=" " />
											 <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
										</a>
										  <div class="mid-1">
											<div class="w3l-movie-text">
												<h6><a href="single.html">Central Intelligence</a></h6>							
											</div>
											<div class="mid-2">
											
												<p>2016</p>
												 <div class="block-stars">
													<ul class="w3l-ratings">
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															<li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
															  
											
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
											  <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m10.jpg" title="album-name" alt=" " />
											 <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
										</a>
										  <div class="mid-1">
											<div class="w3l-movie-text">
												<h6><a href="single.html">Don't Think Twice</a></h6>							
											</div>
											<div class="mid-2">
											
												<p>2016</p>
												 <div class="block-stars">
													<ul class="w3l-ratings">
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															  <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
															  
											
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
											<a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m11.jpg" title="album-name" alt=" " />
											 <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
										</a>
										  <div class="mid-1">
											<div class="w3l-movie-text">
												<h6><a href="single.html">X-Men</a></h6>							
											</div>
											<div class="mid-2">
											
												<p>2016</p>
												 <div class="block-stars">
													<ul class="w3l-ratings">
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
															  
											
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
											 <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m12.jpg" title="album-name" alt=" " />
											 <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
										</a>
										  <div class="mid-1">
											<div class="w3l-movie-text">
												<h6><a href="single.html">Greater</a></h6>							
											</div>
											<div class="mid-2">
											
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
															 <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
															  
											
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
												
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>	
										</div>

												<div class="clearfix"> </div>
									</div>
								<!-- //latest-movies -->
								 
						   </div>
			</div>
	</div>
	
<!-- //faq-banner -->
<c:import url="/WEB-INF/views/footer.jsp" charEncoding="UTF-8"/>
<script type="text/javascript">
$(function(){
	var review_no = '${reviewVO.REVIEW_NO}';
	var page = '${cri.page}';
	var perPageNum = '${cri.perPageNum}';
	var searchType = '${cri.searchType}';
	var keyword = '${cri.keyword}';
	var formObj = $(".singleForm");
	var replyCount = '${REPLYCOUNT}';
	var member_no = '${reviewVO.MEMBER_NO}';
	var ebook_no = '${reviewVO.EBOOK_NO}';
	
	console.log("값테스트");
	console.log("review_no = " + review_no);
	console.log("page = " + page);
	console.log("perPageNum = " + perPageNum);
	console.log("searchType = " + searchType);
	console.log("keyword = " + keyword);
	console.log("replyCount = " + replyCount);
	console.log("member_no = " + member_no);
	console.log("ebook_no = " + ebook_no);
	
	// 리뷰리스트 메서드 매개변수 url, target, method
	var sameWriterOtherReviews = "/cobook/review/getSameWriterOtherReviews?member_no="+member_no;
	var sameBookOtherReviews = "/cobook/review/getSameBookOtherReviews?ebook_no="+ebook_no;
	getReviewList(sameWriterOtherReviews, '.wthree-related-news-left', 'html');
	getReviewList(sameBookOtherReviews, '.news-right-bottom-bg', 'html');

	
	// 수정버튼 이벤트처리
	$(".modBtn").on("click", function(){
		
		var url = "/cobook/sample/RmodifyPage";

		formObj.attr("action", url);
		formObj.attr("method", "get");
		$("#review_noTxt").val(review_no);
		$("#pageTxt").val(page);
		$("#perPageNumTxt").val(perPageNum);
		$("#searchTypeTxt").val(searchType);
		$("#keywordTxt").val(keyword);
		
		formObj.submit();
	});
	
	// 삭제 버튼 이벤트처리
	$(".rmBtn").on("click", function(event){
		
		if(replyCount > 0){
			alert("댓글이 달려있는 게시물은 삭제 할 수 없습니다"); 
			return;
		}
		
		var url = "/cobook/review/removePage";
		formObj.attr("action", url);
		formObj.attr("method", "post");		
		$("#review_noTxt").val(review_no);
		$("#pageTxt").val(page);
		$("#perPageNumTxt").val(perPageNum);
		$("#searchTypeTxt").val(searchType);
		$("#keywordTxt").val(keyword);
		
		formObj.submit();
	});
	
	// 리스트버튼 이벤트 처리
	$(".listBtn").on("click", function(){
		console.log("리스트버튼 클릭");
		var url = "/cobook/review/list";
		formObj.attr("action", url);
		formObj.attr("method", "get");
		
		// 리뷰번호, 페이지, 페이지갯수
		$("#review_noTxt").val(review_no);
		$("#pageTxt").val(page);
		$("#perPageNumTxt").val(perPageNum);
		$("#searchTypeTxt").val(searchType);
		$("#keywordTxt").val(keyword);
		formObj.submit();
	});
	
	// AJAX 공통함수
	function getReviewList(url, target, method) {
		
		console.log("공통 함수 호출");
		$.ajax({
			type : "get",
			url : url,
			dataType : 'html',
			success : function(data) {
				settingHtml(target, method, data);
			}
		});
	}
	
	// append OR html 방식인지 선택
	function settingHtml(target, method, data){
		
		if(method == 'append'){
			$(target).append(data);
		}else{
			$(target).html(data);
		}
	}
	
	
	
});

</script>
</body>
</html>