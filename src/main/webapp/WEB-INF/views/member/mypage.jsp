<%@page import="org.ebook.cobook.member.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>마이페이지</title>
<link href="/cobook/resources/CoBookDesign/css/bootstrap.css?ver=3" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js"></script>
<link href="/cobook/resources/CoBookDesign/css/mypage.css?ver=5" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
	var member_no =1;
	
	$(document).ready(function () {
		
		console.log("myyyyyyyyyyyyyyyyyyypageeeeeeeeeeeeeeee!");
		console.log(member_no);
		
		$.ajax({
			type : "POST",
			url : '/cobook/member/mypage/getMyBorrowList',
			data : JSON.stringify({		
				"member_no" : member_no
				}),
			dataType : 'html',
			contentType : "application/json;charset=UTF-8",
			success : function (data) {
				$('#borrowlist-container').append(data);
			}
		});
	});
</script>
<body>
	 <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <!-- button type="button" class="navbar-toggle collapsed" 
          data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button> -->
          
          <a class="navbar-brand" href="/cobook">CoBook</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
             <li><a href="#"><span class="glyphicon-r glyphicon-heart" title="위시리스트"></span></a></li>
            <li><a href="#"><span class="glyphicon-r glyphicon-edit" title="정보수정"></span></a></li>
            <li><a href="#"><span class="glyphicon-r glyphicon-log-out" title="로그아웃"></span></a></li>
          </ul>
          
          <div class="navbar-form navbar-left">
          	<div class="header-seperator"></div>
          	<!-- 버튼 클릭시 이벤트 발생은 2차 기능으로 제외 -->
    		<button class="form-control">
        	<div class="round round-sm hollow blue">
                <span class="glyphicon glyphicon-user"></span>
            </div>&nbsp;&nbsp;남잭슨님 보유포인트 : 50,000
    		</button>&nbsp;<a>충전하기</a>
          </div>
        </div>
      </div>
    </nav>
	
	<!-- 북마크 들어옵니다 -->
	<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>
        </div>
        
        <!-- 페이지네이션 사용할지 더보기 버튼을 사용할것인지-->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h3 class="page-header" style="font-family: 'Iropke Batang'">대여한 책 목록</h3>
		
			<div id="borrowlist-container" class="borrowlist-container">
	          <!-- <div class="row placeholders">
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="/cobook/resources/test/anna.jpg">
	              <div class="remainDays"><p>60일</p></div>
	              <h5>안나카레리나</h5>
	              <span class="text-muted">톨스토이</span>
	            </div>
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="/cobook/resources/test/kaf.jpg" >
	              <div class="remainDays"><p>60일</p></div>
	              <h5>변신.시골의사</h5>
	              <span class="text-muted">프란츠 카프카</span><br>
	              <span class="remain-date">2017.01.23 ~ 2018.01.22까지</span>
	            </div>
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="/cobook/resources/test/ove.jpg">
	              <div class="remainDays"><p>60일</p></div>
	              <h5>오베라는 남자</h5>
	              <span class="text-muted">프레드릭 배크만</span>
	            </div>
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="/cobook/resources/test/sorry.jpg">
	              <div class="remainDays"><p>60일</p></div>
	              <h5>할머니가 미안하다고 전해달랬어요</h5>
	              <span class="text-muted">프레드릭 배크만</span>
	            </div>
	          </div>
	          <div class="row placeholders">
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="/cobook/resources/test/깊은강_xxlarge.jpg">
	              <div class="remainDays"><p>60일</p></div>
	              <h5>깊은강</h5>
	              <span class="text-muted">엔도슈사쿠</span>
	            </div>
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="/cobook/resources/test/내가버린여자_xxlarge.jpg" >
	              <div class="remainDays"><p>60일</p></div>
	              <h5>내가버린여자</h5>
	              <span class="text-muted">엔도슈사쿠</span>
	            </div>
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="/cobook/resources/test/앵무새죽이기_xxlarge.jpg">
	              <div class="remainDays"><p>60일</p></div>
	              <h5>앵무새죽이기</h5>
	              <span class="text-muted">하퍼리</span>
	            </div>
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="/cobook/resources/test/창문넘어도망친100세노인_xxlarge.jpg">
	              <div class="remainDays"><p>60일</p></div>
	              <h5>창문넘어도망친100세노인</h5>
	              <span class="text-muted">요나스요나손</span>
	            </div>
	          </div> -->		<!-- 대여한 ebook -->
	          </div>	<!-- borrow list container -->
          
          <a class="ebook-more"><span class="glyphicon glyphicon-plus-sign"></span> 대여한 ebook 더보기</a>
          <br>
          <br>
          <h3 class="page-header">나의 리뷰</h3>
          <br>
          <div class="mypage-myreview-container">
          
          	<div class="mypage-myreview list">
          		<div class="first placeholder">
          		 <img src="/cobook/resources/test/ove-xxs.jpg" > 
	          	</div>
	          	<div class="detail-wrapper">
	          		<div class="review-title-wrapper">
	          			<span class="review-title-ebook">오베라는 남자</span>
	          			<span class="title-author">- 프레드릭 배크만</span>
	          		</div>
		          	<div class="review-title">오베라는 남자가 우리주변에 있다면</div>
	          		<div class="review-rating">별점이나 들어올까</div>
	          	</div>
	          		<div class="add">
	          			<div class="add-panel">
	          				<button class="review-but">공개하기</button>
	          			</div>
	          		</div>
          	</div>
          	<div class="mypage-myreview list">
          		<div class="first placeholder">
          		 <img src="/cobook/resources/test/j-xxs.jpg" > 
	          	</div>
	          	<div class="detail-wrapper">
	          		<div class="review-title-wrapper">
	          			<span class="review-title-ebook">오베라는 남자</span>
	          			<span class="title-author">- 프레드릭 배크만</span>
	          		</div>
		          	<div class="review-title">오베라는 남자가 우리주변에 있다면</div>
	          		<div class="review-rating">별점이나 들어올까</div>
	          	</div>
	          		<div class="add">
	          			<div class="add-panel">
	          				<button class="review-but">공개하기</button>
	          			</div>
	          		</div>
          	</div>
          	<div class="mypage-myreview">
          		<div class="first placeholder">
          		 <img src="/cobook/resources/test/s-xxs.jpg" > 
	          	</div>
	          	<div class="detail-wrapper">
	          		<div class="review-title-wrapper">
	          			<span class="review-title-ebook">오베라는 남자</span>
	          			<span class="title-author">- 프레드릭 배크만</span>
	          		</div>
		          	<div class="review-title">오베라는 남자가 우리주변에 있다면</div>
	          		<div class="review-rating">별점이나 들어올까</div>
	          	</div>
	          		<div class="add">
	          			<div class="add-panel">
	          				<button class="review-but">공개하기</button>
	          			</div>
	          		</div>
          	</div>	<!-- review list 끗 -->
          </div>	<!-- review container -->
          <br>
          <a class="review-more"><span class="glyphicon glyphicon-plus-sign"></span> 내가 쓴 리뷰 더보기</a>
          <br>
          <h3 class="page-header">내가 연재한 작품</h3>
          <br>
          	<div class="mypage-myreview-container">
          	<div class="mypage-myreview list">
          		<div class="first placeholder">
          		 <img src="/cobook/resources/test/ove-xxs.jpg" > 
	          	</div>
	          	<div class="detail-wrapper">
	          		<div class="review-title-wrapper">
	          			<span class="review-title-ebook">오베라는 남자</span>
	          			<span class="title-author">- 프레드릭 배크만</span>
	          		</div>
		          	<div class="review-title">오베라는 남자가 우리주변에 있다면</div>
	          		<div class="review-rating">별점이나 들어올까</div>
	          	</div>
	          		<div class="add">
	          			<div class="add-panel">
	          				<button class="review-but">공개하기</button>
	          			</div>
	          		</div>
          	</div>
          	<div class="mypage-myreview list">
          		<div class="first placeholder">
          		 <img src="/cobook/resources/test/j-xxs.jpg" > 
	          	</div>
	          	<div class="detail-wrapper">
	          		<div class="review-title-wrapper">
	          			<span class="review-title-ebook">오베라는 남자</span>
	          			<span class="title-author">- 프레드릭 배크만</span>
	          		</div>
		          	<div class="review-title">오베라는 남자가 우리주변에 있다면</div>
	          		<div class="review-rating">별점이나 들어올까</div>
	          	</div>
	          		<div class="add">
	          			<div class="add-panel">
	          				<button class="review-but">공개하기</button>
	          			</div>
	          		</div>
          	</div>
          	<div class="mypage-myreview">
          		<div class="first placeholder">
          		 <img src="/cobook/resources/test/s-xxs.jpg" > 
	          	</div>
	          	<div class="detail-wrapper">
	          		<div class="review-title-wrapper">
	          			<span class="review-title-ebook">오베라는 남자</span>
	          			<span class="title-author">- 프레드릭 배크만</span>
	          		</div>
		          	<div class="review-title">오베라는 남자가 우리주변에 있다면</div>
	          		<div class="review-rating">별점이나 들어올까</div>
	          	</div>
	          		<div class="add">
	          			<div class="add-panel">
	          				<button class="review-but">공개하기</button>
	          			</div>
	          		</div>
          	</div>	<!-- review list 끗 -->
          </div><!-- mybook list -->
          <br>
          <a class="ebook-more"><span class="glyphicon glyphicon-plus-sign"></span> 내가 연재한 책 더보기</a>
          </div>
          </div>	<!-- row -->
        </div>	<!-- container -->
          
</body>
</html>