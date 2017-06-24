<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원정보 변경</title>
<link href="/cobook/resources/CoBookDesign/css/bootstrap.css?ver=3" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js"></script>
<link href="/cobook/resources/CoBookDesign/css/member-modify.css?ver=11" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
	var member_no =${modify.member_no};	
	
	$(document).ready(function () {
		console.log(member_no);
		
		$("#memberModify").click(function () {
			console.log("수정하시겠습니까아아아아ㅏ아아아아아아!!");
			var password = $("#password").val();
			var nickname = $("#nickname").val();
			
			console.log(password);			
			console.log(nickname);
			
			$.ajax({
				type : 'POST',
				url : '/cobook/member/modifyMember',
				dataType : 'json',
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify({
					"member_no" : member_no,
					"nickname" : nickname,
					"password" : password
					}),
				success : function(data,status) {

					console.log(data);
					console.log(status);
					if(status=="success"){
						alert("정보가 변경되었습니다");
						location.replace("/cobook/member/mypage");
					}else {
						alert("다시 시도해주세요");
					}
					
				}
			});
		});	//membermodify
		
	});	//ready

</script>
<body>
	<div class="container">
	       <div class="form-signin">
	        <h2 class="form-signi n-heading" style="text-align: center;">회원정보 변경</h2>
	        <p style="text-align: center;">${modify.nickname}님 회원정보 변경</p>
	        <input type="text" class="form-control" placeholder="${modify.email}" readonly="readonly" />
	        <label for="inputEmail" class="sr-only">닉네임</label>
	        <input type="text" id="nickname" class="form-control" placeholder="닉네임" required autofocus/>
	        <label for="inputPassword" class="sr-only">비밀번호</label>
	        <input type="password" id="password" class="form-control" placeholder="비밀번호" required/>
	        <!-- <div class="checkbox">
	          <label>
	            <input type="checkbox" value="remember-me"/> Remember me
	          </label>
	        </div> -->
	        <br>
	        
	        <button id="memberModify" class="btn btn-lg btn-primary btn-block" >수정하기</button>
	      </div>
	
	    </div> <!-- /container -->
</body>
</html>