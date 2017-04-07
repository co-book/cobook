<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Co-123Book World!</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="One Movies Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //for-mobile-apps -->
<link href="/cobook/resources/CoBookDesign/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/style.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/faqstyle.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/medile.css" rel='stylesheet'
	type='text/css' />
<link href="/cobook/resources/CoBookDesign/css/single.css" rel='stylesheet'
	type='text/css' />
<link href="/cobook/resources/CoBookDesign/css/contactstyle.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- news-css -->
<link href="/cobook/resources/CoBookDesign/news-css/news.css" rel="stylesheet"
	type="text/css" media="all" />
<!-- //news-css -->
<!-- list-css -->
<link href="/cobook/resources/CoBookDesign/list-css/list.css" rel="stylesheet"
	type="text/css" media="all" />
<!-- //list-css -->
<!-- font-awesome icons -->
<link href="/cobook/resources/CoBookDesign/css/font-awesome.min.css"
	rel="stylesheet" />
<!-- //font-awesome icons -->
<!-- js -->
<script type="text/javascript"
	src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js"></script>
<!-- 부트스트랩 cdn -->
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- //js -->
<link
	href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300'
	rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript"
	src="/cobook/resources/CoBookDesign/js/move-top.js"></script>
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<!-- tables -->
<link href="/cobook/resources/CoBookDesign/list-css/table-style.css"
	rel="stylesheet" type="text/css" />
<link href="/cobook/resources/CoBookDesign/list-css/basictable.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="/cobook/resources/CoBookDesign/list-js/jquery.basictable.min.js"></script>
<script type="text/javascript" charset="UTF-8">
$(document).ready(function(){
	//리스트
	var page = '${cri.page}';
	var perPageNum = '${cri.perPageNum}';
	var searchType = '${cri.searchType}';
	var keyword = '${cri.keyword}';
	var url = '/cobook/mybook/mybookList?page='+page+"&perPageNum="+perPageNum+"&searchType="+searchType+"&keyword="+keyword;
	
	$.ajax({
		type : "get",
		url : url,
		dataType : 'html',
		success : function(data) {
			$('#mybook_mybookList').append(data);
			
			//아마도 화면크기 조절시 디자인조정 
			$('#table').basictable();
		    $('#table-breakpoint').basictable({
		          breakpoint: 768
		        });
		}
	});
	
	$("#myTab").on("click", "li a",function(event){
		
		event.preventDefault();
		console.log("클릭");
		
		var keyword = $(this).text();
		console.log(keyword);
		
		$.ajax({
			type : "get",
			url : 'mybook/mybookList',
			dataType : 'html',
			data : {keyword : keyword, searchType : "t"},
			success : function(data) {
				
//				$('#mybook_mybookList').append(data);
				$('#mybook_mybookList').html(data);		
				//아마도 화면크기 조절시 디자인조정 
				$('#table').basictable();
			    $('#table-breakpoint').basictable({
			          breakpoint: 768
			        });
			}
		
		});
	
	});
	
});
</script>
</head>

<body>
	<!-- header login, wishList, navibar start -->
	<c:import url="/WEB-INF/views/header.jsp" charEncoding="UTF-8">
		<c:param name="loginId" value="loginId" />
	</c:import>
	<!-- content start-->

	<div class="faq">
		<h4 class="latest-text w3_faq_latest_text w3_latest_text">Movies
			List</h4>
		<div class="container">
			<div class="agileits-news-top">
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active">List</li>
				</ol>
			</div>
			
			<div class="bs-example bs-example-tabs" role="tabpanel"
				data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					
					<li role="presentation" class="active"><a href="#home"
						id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
						aria-expanded="true">0 - 9</a></li>
					<li role="presentation"><a href="#a" role="tab" id="a-tab"
						data-toggle="tab" aria-controls="a">ㄱ</a></li>
					<li role="presentation"><a href="#b" role="tab" id="b-tab"
						data-toggle="tab" aria-controls="b">ㄴ</a></li>
					<li role="presentation"><a href="#c" role="tab" id="c-tab"
						data-toggle="tab" aria-controls="c">ㄷ</a></li>
					<li role="presentation"><a href="#d" role="tab" id="d-tab"
						data-toggle="tab" aria-controls="d">ㄹ</a></li>
					<li role="presentation"><a href="#e" role="tab" id="e-tab"
						data-toggle="tab" aria-controls="e">ㅁ</a></li>
					<li role="presentation"><a href="#f" role="tab" id="f-tab"
						data-toggle="tab" aria-controls="f">ㅂ</a></li>
					<li role="presentation"><a href="#g" role="tab" id="g-tab"
						data-toggle="tab" aria-controls="g">ㅅ</a></li>
					<li role="presentation"><a href="#h" role="tab" id="h-tab"
						data-toggle="tab" aria-controls="h">ㅇ</a></li>
					<li role="presentation"><a href="#i" role="tab" id="i-tab"
						data-toggle="tab" aria-controls="i">ㅈ</a></li>
					<li role="presentation"><a href="#j" role="tab" id="j-tab"
						data-toggle="tab" aria-controls="j">ㅊ</a></li>
					<li role="presentation"><a href="#k" role="tab" id="k-tab"
						data-toggle="tab" aria-controls="k">ㅋ</a></li>
					<li role="presentation"><a href="#l" role="tab" id="l-tab"
						data-toggle="tab" aria-controls="l">ㅌ</a></li>
					<li role="presentation"><a href="#m" role="tab" id="m-tab"
						data-toggle="tab" aria-controls="m">ㅍ</a></li>
					<li role="presentation"><a href="#n" role="tab" id="n-tab"
						data-toggle="tab" aria-controls="n">ㅎ</a></li>
					<li role="presentation"><a href="#o" role="tab" id="o-tab"
						data-toggle="tab" aria-controls="o">A</a></li>
					<li role="presentation"><a href="#p" role="tab" id="p-tab"
						data-toggle="tab" aria-controls="p">B</a></li>
					<li role="presentation"><a href="#q" role="tab" id="q-tab"
						data-toggle="tab" aria-controls="q">C</a></li>
					<li role="presentation"><a href="#r" role="tab" id="r-tab"
						data-toggle="tab" aria-controls="r">D</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="home"
						aria-labelledby="home-tab">
						<div id="mybook_mybookList"></div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/footer.jsp" charEncoding="UTF-8" />
</body>

</html>