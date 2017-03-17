<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>


<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Facebook Login JavaScript Example</title>
<meta charset="UTF-8">
</head>
<body>



	<!--
  아래는 소셜 플러그인으로 로그인 버튼을 넣는다.
  이 버튼은 자바스크립트 SDK에 그래픽 기반의 로그인 버튼을 넣어서 클릭시 FB.login() 함수를 실행하게 된다.
-->

	<div id="fb-root"></div>
	<script>
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			// The response object is returned with a status field that lets the
			// app know the current login status of the person.
			// Full docs on the response object can be found in the documentation
			// for FB.getLoginStatus().
			if (response.status === 'connected') {
				// Logged into your app and Facebook.
				
				
			} else if (response.status === 'not_authorized') {
				// The person is logged into Facebook, but not your app.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			} else {
				// The person is not logged into Facebook, so we're not sure if
				// they are logged into this app or not.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into Facebook.';
			}
		}

		// This function is called when someone finishes with the Login
		// Button.  See the onlogin handler attached to it in the sample
		// code below.
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
			
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '135805423595994',
				xfbml : true,
				version : 'v2.8'
			});

			
			
			

		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<!-- <div class="fb-login-button" data-max-rows="1" data-size="xlarge"
		data-show-faces="false" data-auto-logout-link="false" scope="public_profile,email"></div> -->
	<script>

    $(document).ready(function (){

        $("#logout").on('click', function (){

            FB.getLoginStatus(function(response) {

            if (response && response.status === 'connected') {

                    FB.logout(function(response) {

                    window.location.reload();

                    });

            }

            });

       });
        
      $("#fBtn").on("click", function(){
    	 
    	  FB.getLoginStatus(function(response) {
    		  
    		  if (response && response.status === 'connected') {

                  console.log("기모찌");

               }else{
            	   console.log("커넥션아님");
            	   FB.login(function(response){
            		  
            		   
            	   });
               }

          });
    	  
    	  });
    	  
     
        
        

   });
    </script>

	<a href="#" id="fBtn">페이스북</a>
	<a href="#" id="logout">로그아웃</a>
	<div id="status"></div>
	<button id="checkCookie">쿠키확인</button>

</body>
</html>


