<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="/resources/js/facebook.js"></script>
<script src="/resources/js/google.js"></script>
<script src="/resources/js/snsBtn.js"></script>
<title>통합 로그인</title>
<meta charset="UTF-8">
</head>
<body>

	<button id="authorize-button">구글 버튼</button>
	<fb:login-button scope="public_profile,email,user_birthday"
		onlogin="checkLoginState();">
	</fb:login-button>

	<h3>사용자 정보입력</h3>
	<form action="/member/join" method="post">
		<div>닉네임:&nbsp;<input type="text" id="nickname" name="nickname" value="">
		<input type="button" id="nickBtn" value="중복확인">
		</div>
		<div>비번:&nbsp;<input type="text" id="password" name="password">
		</div>		
		
		<input type="text" id="sex" name="sex" value="">
		<input type="text" id="age" name="age" value="">
		<input type="text" id="email" name="email" value="">
		<input type="button" id="emailBtn" value="이메일 중복확인">
		<input type="submit" value="가입하기">
	</form>
<script async defer src="https://apis.google.com/js/api.js" 

      onload="this.onload=function(){};handleClientLoad()" 

      onreadystatechange="if (this.readyState === 'complete') this.onload()">

</script>

</body>
</html>