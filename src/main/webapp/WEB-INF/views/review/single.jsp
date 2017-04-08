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
<link href="/cobook/resources/CoBookDesign/news-css/news.css" rel="stylesheet"  type="text/css" media="all" />
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
<script type="text/javascript">
	jQuery(document).ready(function($) {
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
					  <li><a href="index.html">Home</a></li>
					   <li><a href="news.html">News</a></li>
					  <li class="active">Single</li>
					</ol>
				</div>
				<div class="agileinfo-news-top-grids">
					<div class="col-md-8 wthree-top-news-left">
						<div class="wthree-news-left">
							<div class="wthree-news-left-img">
								<img src="${reviewVO.COVERURL}" alt="" />
								<h4>${reviewVO.TITLE}</h4>
								<!-- 작성자, 날짜, 댓글갯수 -->
								<div class="s-author">
									<p>Posted By <a href="#"><i class="fa fa-user" aria-hidden="true"></i> ${reviewVO.NICKNAME}</a> &nbsp;&nbsp; <i class="fa fa-calendar" aria-hidden="true"></i> ${reviewVO.REG_DATE} &nbsp;&nbsp; <a href="#"><i class="fa fa-comments" aria-hidden="true"></i> Comments (${REPLYCOUNT})</a></p>
								</div>
								<!-- 삭제,수정,목록 버튼 -->
								<button class="modBtn" id="modBtn">수정</button>
								<button class="rmBtn" id="rmBtn">삭제</button>
								<button class="listBtn" id="listBtn">목록</button>
								<div id="fb-root"></div>
								<div class="news-shar-buttons">
									<ul>
										<li>
											<div class="fb-like" data-href="https://www.facebook.com/w3layouts" data-layout="button_count" data-action="like" data-size="small" data-show-faces="false" data-share="false"></div>
											<script>(function(d, s, id) {
											  var js, fjs = d.getElementsByTagName(s)[0];
											  if (d.getElementById(id)) return;
											  js = d.createElement(s); js.id = id;
											  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.7";
											  fjs.parentNode.insertBefore(js, fjs);
											}(document, 'script', 'facebook-jssdk'));</script>
										</li>
										<li>
											<div class="fb-share-button" data-href="https://www.facebook.com/w3layouts" data-layout="button_count" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.facebook.com%2Fw3layouts&amp;src=sdkpreparse">Share</a></div>
										</li>
										<li class="news-twitter">
											<a href="https://twitter.com/w3layouts" class="twitter-follow-button" data-show-count="false">Follow @w3layouts</a><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
										</li>
										<li>
											<a href="https://twitter.com/intent/tweet?screen_name=w3layouts" class="twitter-mention-button" data-show-count="false">Tweet to @w3layouts</a><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
										</li>
										<li>
											<!-- Place this tag where you want the +1 button to render. -->
											<div class="g-plusone" data-size="medium"></div>

											<!-- Place this tag after the last +1 button tag. -->
											<script type="text/javascript">
											  (function() {
												var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
												po.src = 'https://apis.google.com/js/platform.js';
												var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
											  })();
											</script>
										</li>
									</ul>
								</div>
								<div class="w3-agile-news-text">
									<p><span>${reviewVO.CONTENTS}</span></p>
								</div>
							</div>
						</div>
						<div class="wthree-related-news-left">
							<!-- 다른리뷰 자리 -->
						</div>
						<!-- agile-comments -->
						<div class="agile-news-comments">
							<div class="agile-news-comments-info">
								<h4>Comments</h4>
								<div class="fb-comments" data-href="https://w3layouts.com/" data-width="100%" data-numposts="5"></div>
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
								<h3>같은책 다른리뷰</h3>
							</div>
							<div class="news-right-bottom-bg">
								
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
	
<!-- FormHtml -->
<form class="singleForm" action="" method="post">
	<input type="hidden" id="review_noTxt" name="review_no" value="">
	<input type="hidden" id="pageTxt"  name="page" value="">
	<input type="hidden" id="perPageNumTxt" name="perPageNum"  value="">
	<input type="hidden" id="searchTypeTxt" name="searchType" value="">
	<input type="hidden" id="keywordTxt" name="keyword" value="">
</form>	
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
		
		 var url = "/cobook/review/modifyPage";
		//$(location).attr("href", url);
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
				console.log("문자열 확인: "+data);
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