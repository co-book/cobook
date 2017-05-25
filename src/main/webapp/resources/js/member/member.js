

function CobookMember(){
	this.loginType = "";
	this.email = "";
	this.authString ="";
	this.checkEmail="";
	this.password = "";
	this.gender = "";
	this.age = "";
	this.nickname="";
}     

CobookMember.prototype.cobook= function(){
	console.log(this);
	console.log(this.email+"/" + this.password +"/"+ this.loginType);
}

//로그인
CobookMember.prototype.cobookLogin = function(){
	
    	console.log(this.email+"/" + this.password +"/"+ this.loginType);
    	$.ajax({
    		type : 'POST',
    		url : '/cobook/member/login',
    		data  :JSON.stringify(this),
    		dataType : 'json',
    		contentType : "application/json;charset=UTF-8",
    		success : function(result) {
    			//1. 로그인 성공 -> 로그인 OK 
    			// 창닫고, 로그아웃으로 변경 
    			
    			//2. 로그인 실패 ->
    			//			1.google, facebook -> 등록되지않은 에러  -> 회원가입 시켜줌
    			//			2. 일반 
    			//				>> 등록되지 않은 아이디 -
    			//				>> 패스워드 에러            -> alert
    			console.log(result.member);
    			console.log(result.member.loginType);

				
    			if(result.member.loginType=="COBOOKLOGIN"){
    				//자체로그인시, 
    				alert(result.msg);
    				if(result.result=="SUCCESS"){
    					location.reload();
    				}
    			}else if(result.member.loginType=="GOOGLELOGIN"||result.member.loginType=="FACEBOOKLOGIN"){
    				
    				if(result.result=="SUCCESS"){
    					alert(result.msg);
    					location.reload();
    				}else{
    					var returnValue = confirm(result.msg+ "\n 해당 정보로 Cobook 회원가입을 하시겠습니까?");
    					if(returnValue){
    						ChangeJoinForm();
    						SetJoinForm(result.member);
    					}
    				}
				}else{
					
    				// GOOGLE , FACEBOOK 회원가입시 
    				if(result.result=="SUCCESS"){
    					alert("이미 가입된 회원입니다.");
    				}else{
    					var returnValue = confirm(result.msg+ "\n 해당 정보로 Cobook 회원가입을 하시겠습니까?");
    					if(returnValue){
    						SetJoinForm(result.member);
    					}
    				}
    			}

    		}
    	});
}

//로그 오프
CobookMember.prototype.cobookLogout = function(){
	$.ajax({
		type : 'GET',
		url : '/cobook/member/logout',
		dataType : 'json',
		contentType : "application/json;charset=UTF-8",
		success : function(result) {
			alert("로그아웃 되었습니다.");
		}
	});
}

//이메일 체크
CobookMember.prototype.emailCheck = function(){
	$.ajax({
		type : 'POST',
		url : '/cobook/member/emailCheck',
		data  :JSON.stringify(this),
		dataType : 'json',
		contentType : "application/json;charset=UTF-8",
		success : function(result) {
			console.log(result);
			if(result.result=="SUCCESS"){
				//인증번호 입력단계 추가 
				openEmailCheckForm(result.authString);
			}else{
				alert(result.msg);
			}
		}
	});
}

//회원가입
CobookMember.prototype.cobookJoin = function(){
	$.ajax({
		type : 'POST',
		url : '/cobook/member/joinMember',
		data  :JSON.stringify(this),
		dataType : 'json',
		 async: false,
		contentType : "application/json;charset=UTF-8",
		success : function(result) {
			if(result.result=="SUCCESS"){
				alert("회원가입을 축하합니다.");
				ChangeLoginForm();
			}else{
				alert("다시 시도해주세요.");
			}
			
		}
	});
}