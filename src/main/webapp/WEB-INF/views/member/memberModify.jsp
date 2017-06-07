<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 수정</title>
<link href="/cobook/resources/CoBookDesign/css/bootstrap.css?ver=3" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js"></script>
<link href="/cobook/resources/CoBookDesign/css/member-modify.css?ver=3" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
	      <form class="form-signin">
	        <h2 class="form-signin-heading">${modify.email}회원정보 수정</h2>
	        <label for="inputEmail" class="sr-only">닉네임</label>
	        <input type="text" id="inputEmail" class="form-control" placeholder="닉네임" required autofocus>
	        <label for="inputPassword" class="sr-only">비밀번호</label>
	        <input type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>
	        <div class="checkbox">
	          <label>
	            <input type="checkbox" value="remember-me"> Remember me
	          </label>
	        </div>
	        <button class="btn btn-lg btn-primary btn-block" type="submit">수정하기</button>
	      </form>
	
	    </div> <!-- /container -->
</body>
</html>