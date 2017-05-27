<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Test myPage</title>
<link href="/cobook/resources/CoBookDesign/css/bootstrap.css?ver=3" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js"></script>
<link href="test/mypage.css?ver=2" rel="stylesheet" type="text/css">
</head>
<body>
	 <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">CoBook</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>
	<!-- <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        
        <div class="mypage-header">
        	<div class="header-primary">
        	
        	<div class="navbar-header">
	          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <a class="navbar-brand home" href="#">CoBook</a>	main으로 이동하는?
	          <div class="header-seperator"></div>
	          <a>엄지연님</a>
	          <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
	          <div class=""></div>
        	</div>
        	
        
	        <div id="navbar" class="mypage-secondery">
	        
	          <ul class="nav navbar-nav navbar-right">
	            <li><a href="#">Dashboard</a></li>
	            <li><a href="#">Settings</a></li>
	            <li><a href="#">Profile</a></li>
	            <li><a href="#">Help</a></li>
	          </ul>
	          <form class="navbar-form navbar-right">
	            <input type="text" class="form-control" placeholder="Search...">
	          </form>
	        </div>
	        </div>
	        
        </div>
        
      </div>
    </nav> -->

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
          <h2 class="page-header">대여한 책 목록</h2>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 my_ebook">
              <img src="test/anna.jpg">
              <h5>안나카레리나</h5>
              <span class="text-muted">톨스토이</span>
            </div>
            <div class="col-xs-6 col-sm-3 my_ebook">
              <img src="test/kaf.jpg" >
              <h5>변신.시골의사</h5>
              <span class="text-muted">프란츠 카프카</span>
            </div>
            <div class="col-xs-6 col-sm-3 my_ebook">
              <img src="test/ove.jpg">
              <h5>오베라는 남자</h5>
              <span class="text-muted">프레드릭 배크만</span>
            </div>
            <div class="col-xs-6 col-sm-3 my_ebook">
              <img src="test/sorry.jpg">
              <h5>할머니가 미안하다고 전해달랬어요</h5>
              <span class="text-muted">프레드릭 배크만</span>
            </div>
          </div>
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 my_ebook">
              <img src="test/깊은강_xxlarge.jpg">
              <h5>깊은강</h5>
              <span class="text-muted">엔도슈사쿠</span>
            </div>
            <div class="col-xs-6 col-sm-3 my_ebook">
              <img src="test/내가버린여자_xxlarge.jpg" >
              <h5>내가버린여자</h5>
              <span class="text-muted">엔도슈사쿠</span>
            </div>
            <div class="col-xs-6 col-sm-3 my_ebook">
              <img src="test/앵무새죽이기_xxlarge.jpg">
              <h5>앵무새죽이기</h5>
              <span class="text-muted">하퍼리</span>
            </div>
            <div class="col-xs-6 col-sm-3 my_ebook">
              <img src="test/창문넘어도망친100세노인_xxlarge.jpg">
              <h5>창문넘어도망친100세노인</h5>
              <span class="text-muted">요나스요나손</span>
            </div>
          </div>		<!-- 대여한 ebook -->
          
          <h2 class="page-header">나의 리뷰</h2>
          <br>
          <div class="mypage-myreview-container">
          
          	<div class="mypage-myreview list">
          		<div class="first placeholder">
          		 <img src="test/ove-xxs.jpg" > 
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
          		 <img src="test/j-xxs.jpg" > 
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
          		 <img src="test/s-xxs.jpg" > 
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
          </div>	<!-- container -->
          
          </div>
          </div>
          
          </div>
          
          
          
</body>
</html>