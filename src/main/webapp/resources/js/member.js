

function CobookMember(){
	this.loginType = loginType;
	this.email = email;
	this.password = password;
	this.gender = gender;
	this.email = email;
}     

CobookMember.prototype.cobookLogin = function(member){
    	console.log(this.email+"/" + this.password +"/"+ this.loginType);
    	$.ajax({
    		type : 'POST',
    		url : '/member/login',
    		contentType : "application/json",
    		dataType : 'json',
    		data  : {
    			"email"  :  member.email,
    		  	"password" 	 :	member.password,
    		  	"loginType" : member.loginType
    	  	},
    		success : function(result) {

    			//1. 로그인 성공 -> 로그인 OK 
    			// 창닫고, 로그아웃으로 변경 
    			
    			//2. 로그인 실패 ->
    			//			1.google, facebook -> 등록되지않은 에러  -> 회원가입 시켜줌
    			//			2. 일반 
    			//				>> 등록되지 않은 아이디 -
    			//				>> 패스워드 에러            -> alert

    			console.log(result);

    		}
    	});
}