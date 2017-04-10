<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="/resources/test/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<link rel="stylesheet"
	href="/resources/test/jquery-ui-1.12.1.custom/jquery-ui.min.css">
<!-- 로그인 js -->
<script src="/resources/js/index/login.js"></script>
<!-- 페이스북 js -->
<script src="/resources/js/index/facebook.js"></script>
<!-- 구글 js -->
<script src="/resources/js/index/google.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 로그인 테스트</title>
<script>
	//레이어팝업 UI 생성후 화면에 안보여주기
	$(function() {
		
		var i = 0;
		$("#dialog").hide();
		// 유효성 검사
		/* var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식
		var re_email = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
		
		var emailObj = $("#email");
		var pwObj = $("#password");
		var formObj = $(".form");
		
		$(this).submit(function(){
			
			if(re_email.test(emailObj.val()) != true){
				alert('유효한 이메일을 입력해주세요');
				emailObj.focus();
				return false;
			}else if(re_pw.test(pwObj.val()) != true){
				alert('유효한 패스워드를 입력해주세요');
				pwObj.focus();
				return false;
			}
			
		}); */
		
		
		// 로그인 버튼 클릭하면 팝업창이 뜬다
		$("#loginPop").on("click", function() {
			$("#dialog").show();
			$("#dialog").dialog("open");
		});
		
		// X버튼을 클릭할경우 폼이 바뀐다
		$("#dialog").on("click", "#changeFormBtn", function(event){
			console.log(i);
			console.log(event);
			if(i % 2 == 0){
				
				changeForm("#joinForm");
				i++;
				
			}else{
				console.log("로그인폼");
				changeForm("#loginForm");
				i++;
			}
			
			
		});
		
	 	
		// 팝업창 초기화
		$("#dialog").dialog({
			autoOpen : false,
			modal : true, //모달대화상자
			resizable : false, //크기 조절 못하게
			width : 500,
			height : 1000,
			// draggable: false,
			position : {
				my : "center"
			},
			buttons : {
				"확인" : function() {
					$(this).dialog("close");
				},
				"취소" : function() {
					$(this).dialog("close");
				}
			}

		});

		// 문자열을 매개변수로 입력받아 원하는 폼으로 바꾸는 함수
		function changeForm(formHtml){
			var FormHtml = $(formHtml).html();
			console.log(FormHtml);
			$("#diaContent").html(FormHtml);
		}
		
		
	});
</script>

</head>
<body>
	<h1>${login.nickname}</h1>
	<button id="loginPop">Login</button>

	<div id="dialog" title="로그인창">
		<button id="changeFormBtn">X</button>
		<div id="diaContent">
			<form class="form" action="/member/loginPost" method="post">
				<p>
					<input type="text" id="email" name="email" placeholder="이메일">
				</p>
				<p>
					<input type="text" id="password" name="password" placeholder="비밀번호">
				</p>
				<input type="button" id="loginBtn" value="로그인">
				<p>
				<button id="fBtn">Facebook</button>
				<button id="authorize-button">구글</button>
				</p>
				<p>
					<a id=""  href="#">Forgot your password?</a>
				</p>
			</form>
		</div>
	</div>

<!-- 회원가입 html -->
<script id="joinForm" type="text/x-handlebars-template">
<h3>사용자 정보입력</h3>
<form  class="form" action="/member/join" method="post">
	<div>
		닉네임:&nbsp;<input type="text" id="nickname" name="nickname" value="">
		<input type="button" id="nickBtn" value="중복확인">
	</div>
	<div>
		비번:&nbsp;<input type="text" id="password" name="password">
	</div>

	<p>성별:<input type="text" id="sex" name="sex" value=""></p>
	<p>나이: <input
		type="text" id="age" name="age" value=""></p>
	<p>이메일:
		<input type="text"
		id="email" name="email" value=""> <input type="button"
		id="emailBtn" value="이메일 중복확인">
	<button id="sendEmail">인증메일 발송</button>
	</p>
		<p>이메일 인증 번호:&nbsp;<input type="text" id="confirmEmail">
		<button id="resendEmail">재발송</button></p>
		<p><button id="checkAuthString">이메일 인증번호확인</button> </p>
		<p> <input type="submit" value="가입하기"></p> 
</script>
<!-- 로그인 폼 html -->
<script id="loginForm" type="text/x-handlebars-template">
<h3>사용자 정보입력</h3>
<form  class="form" action="/member/loginPost" method="post">
<p>
	<input type="text" id="email" name="email" placeholder="이메일">
</p>
<p>
	<input type="text" id="password" name="password" placeholder="비밀번호">
</p>
<input type="submit" value="로그인">
</form>

</script>
<!-- 구글 api 로딩 -->
<script async defer src="https://apis.google.com/js/api.js"
		onload="this.onload=function(){};handleClientLoad()"
		onreadystatechange="if (this.readyState === 'complete') this.onload()">
		
</script>
<!-- 페이스북 sdk로드 스크립트 -->
	<script>
	
	window.fbAsyncInit = function() {
		FB.init({
			appId : '135805423595994',
			xfbml : true,
			version : 'v2.8'
		});

		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});

	};
	
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		
	</script>
</body>
</html>