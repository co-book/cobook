<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script>
$(function(){

	  $("#logoutBtn").on("click", function(){
		  console.log("로그아웃실행1");
		  FB.logout(function(response) {
			   // Person is now logged out
			   console.log(response);
			console.log("로그아웃실행2");
		  });
	  });
	
})


</script>
<div id="fb-root"></div>
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '135805423595994',
      xfbml      : true,
      version    : 'v2.8'
    }, FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	    
	    if (response.status === 'connected') {
	        console.log('Logged in.');
	      }
	      else {
	        FB.login();
	      }

	}));
    FB.AppEvents.logPageView();
    
   
  };

  
 
  
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
				console.log("connect");
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
  
</script>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=135805423595994";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="false"></div>
<button id="logoutBtn" >로그아웃</button>
<div id="status"></div>
</body>
</html>