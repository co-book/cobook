<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("utf-8");%>
<% response.setContentType("text/html; charset=utf-8");%>


<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/facebook.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Facebook Login JavaScript Example</title>
<meta charset="UTF-8">
</head>
<body>
	<script>
		// This is called with the results from from FB.getLoginStatus().
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			// 토큰을 가져온다

			// response 객체는 현재 로그인 상태를 나타내는 정보를 보여준다. 
			// 앱에서 현재의 로그인 상태에 따라 동작하면 된다.
			// FB.getLoginStatus().의 레퍼런스에서 더 자세한 내용이 참조 가능하다.
			if (response.status === 'connected') {
				// 페이스북을 통해서 로그인이 되어있다.
				// 토큰을 가져온다
				var accessToken = response.authResponse.accessToken;
				testAPI2(accessToken);
			} else if (response.status === 'not_authorized') {
				// 페이스북에는 로그인 했으나, 앱에는 로그인이 되어있지 않다.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			} else {
				// 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into Facebook.';
			}
		}

		// 이 함수는 누군가가 로그인 버튼에 대한 처리가 끝났을 때 호출된다.
		// onlogin 핸들러를 아래와 같이 첨부하면 된다.
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}

	

		// 로그인이 성공한 다음에는 간단한 그래프API를 호출한다.
		// 이 호출은 statusChangeCallback()에서 이루어진다.
		
		// /me는 현재 로그인된 페이스북 사용자를 의미한다.
		function testAPI2(accessToken) {
			var id = null;
			var userInfo = null;
			FB.api('me?fields=id,name,email,age_range,gender', {
				  access_token : accessToken
			} , function(response, user) {
				//handling
				var token = accessToken;
				console.log(response);
				console.log("액세스토큰 : "+accessToken);
//				console.log(user);
				sendToken(response);
			});
			
		function sendToken(token){
				console.log("보내는값 확인: "+token);
				var email = token.email;
				var age_range = token.age_range.min;
				var name = token.name;
				console.log("이메일: " + email);
				console.log("연령: " + age_range);
				console.log("이름: " + name);
				$.ajax({
					
					type : "POST",
					url : "/login/register",
					headers: { 
					      "Content-Type": "application/json",
					      "X-HTTP-Method-Override": "POST" }, 
					data : JSON.stringify({age:age_range, email:email, name:name}),
					dataType : 'text',
					success : function(response){
						console.log(response);
					}
				});
				
				
	    }

		
	}
	</script>


	<!--
  아래는 소셜 플러그인으로 로그인 버튼을 넣는다.
  이 버튼은 자바스크립트 SDK에 그래픽 기반의 로그인 버튼을 넣어서 클릭시 FB.login() 함수를 실행하게 된다.
-->

<!-- 	<div id="fb-root"></div>
	<div class="fb-login-button" data-max-rows="1" data-size="xlarge"
		data-show-faces="false" data-auto-logout-link="false" scope="public_profile,email"></div> -->
	<fb:login-button scope="public_profile,email,user_birthday" onlogin="checkLoginState();">
	</fb:login-button>

	<div id="status"></div>
	<button id="checkCookie">쿠키확인</button>

</body>
</html>


