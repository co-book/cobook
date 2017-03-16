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
<!-- css -->
<link href="resources/CoBookDesign/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/CoBookDesign/css/login.css" rel="stylesheet" type="text/css" media="all"/><!--login CSS -->
<link href="resources/CoBookDesign/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- 메인추가 -->
<link href="resources/CoBookDesign/css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<!-- 메인추가 
<link href="resources/CoBookDesign/css/contactstyle.css"  rel="stylesheet" type="text/css" media="all" />
<link href="resources/CoBookDesign/css/faqstyle.css?ver=1" rel="stylesheet" type="text/css" media="all" />
<link href="resources/CoBookDesign/css/single.css" rel='stylesheet' type='text/css' />
-->
<link href="resources/CoBookDesign/css/medile.css" rel='stylesheet' type='text/css' />
<!-- banner-slider -->
<link href="resources/CoBookDesign/css/jquery.slidey.min.css" rel="stylesheet">
<!-- pop-up -->
<link href="resources/CoBookDesign/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<!-- //pop-up -->
<!-- font-awesome icons -->
<link href="resources/CoBookDesign/css/font-awesome.min.css"  rel="stylesheet" />
<!-- banner-bottom-plugin -->
<link href="resources/CoBookDesign/css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">

<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<!-- aladinList -->
<link rel="stylesheet" href="resources/CoBookDesign/css/flexslider.css" type="text/css" media="screen" property="" />



<script type="text/javascript" src="resources/CoBookDesign/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="resources/CoBookDesign/js/easing.js"></script>
<script type="text/javascript" src="resources/CoBookDesign/js/move-top.js"></script>
<script type="text/javascript" src="resources/CoBookDesign/js/owl.carousel.js"></script>
<script type="text/javascript" src="resources/CoBookDesign/js/jquery.nivo.slider.js"></script>
<!-- banner Script start -->
<script src="resources/CoBookDesign/js/jquery.slidey.js"></script>
<script src="resources/CoBookDesign/js/jquery.dotdotdot.min.js"></script>
<!-- banner Script end -->
<!-- aladinList -->
<script defer src="resources/CoBookDesign/js/jquery.flexslider.js"></script>
<!-- aladinList popup -->
<script src="resources/CoBookDesign/js/jquery.magnific-popup.js" type="text/javascript"></script>

<!--  index Main 추가  -->
<script type="text/javascript">
$(document).ready(function(){
	//배너
	$.ajax({
		type : "get",
		url : 'index/banner',
		dataType : 'html',
		success : function(data) {
			$('#index_banner').append(data);
			banner();
		}
	});
	
	//cobook 추천 리스트
	$.ajax({
		type : "get",
		url : 'index/cobookList',
		dataType : 'html',
		success : function(data) {
			$('#index_cobookList').append(data);
			cobookList();
		}
	});
	
	//Monthly 리스트
	$.ajax({
		type : "get",
		url : 'index/monthlyList',
		dataType : 'html',
		success : function(data) {
			$('#index_monthlyList').append(data);
		}
	});
	
	//Alladin 리스트
	$.ajax({
		type : "get",
		url : 'index/alladinList',
		dataType : 'html',
		success : function(data) {
			$('#index_alladinList').append(data);
			aladinList();
		}
	});
	
	
});

//배너추가후 이벤트 등록
function banner() {
	   $("#slidey").slidey({
			interval: 8000,
			listCount: 5,
			autoplay: false,
			showList: true
		});
		$(".slidey-list-description").dotdotdot();
		
		$('#slider').nivoSlider();
} 
//cobooklist 이벤트 
function cobookList() {
	$("#owl-demo").owlCarousel({
		 
		  autoPlay: 3000, //Set AutoPlay to 3 seconds
		  
		  items : 5,
		  itemsDesktop : [640,4],
		  itemsDesktopSmall : [414,3]
		});
}
//알라딘리스트 
function aladinList(){
	  $('.flexslider').flexslider({
			animation: "slide",
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
	  
	  $('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
			type: 'inline',
			fixedContentPos: false,
			fixedBgPos: true,
			overflowY: 'auto',
			closeBtnInside: true,
			preloader: false,
			midClick: true,
			removalDelay: 300,
			mainClass: 'my-mfp-zoom-in'
		});
}
</script>
</head>
<body>
<!-- header login, wishList, navibar start -->
<c:import url="/WEB-INF/views/header.jsp" charEncoding="UTF-8" >
	<c:param name="loginId" value="loginId" />
</c:import>
<!-- content start-->
<div id="index_banner"></div> 
<div id="index_cobookList"></div>
<div id="index_monthlyList"></div>
<div id="index_alladinList"></div>
<!-- footer -->
<c:import url="/WEB-INF/views/footer.jsp" charEncoding="UTF-8"/>
</body>
</html>