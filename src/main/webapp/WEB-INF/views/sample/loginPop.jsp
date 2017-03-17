<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$(function() {

		$("#loginBtn").on("click", function() {

		});

		$("#close").on("click", function(){
			
			$("#pop").hide();
			
			
		});
		
		
	});
</script>
<style type="text/css">
.white_content {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}
.white_content:target {
    opacity:1;
    pointer-events: auto;
}
.white_content > div {
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 50%;
	padding: 16px;
	border: 16px solid orange;
	background-color: white;
	overflow: auto;	
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 로그인 테스트</title>
</head>
<body>

	<button id="loginBtn">Login</button>

	 <p>메인 콘텐츠입니다. Lightbox를 표시하려면<a href="#open">여기</a>를 클릭하십시오.</p>
    <div class="white_content" id="open">
    	<button id="changeForm">폼변경</button>
        <div>
            <p>Lightbox 콘텐츠입니다. <a href="#close">닫기</a></p>
               <form action="/member/loginPost" method="post">
			<input type="text" id="emailTxt" placeholder="이메일"> <input
				type="text" id="passwordTxt" placeholder="비밀번호">
		</form>
        </div>
     
    </div>

</body>
</html>