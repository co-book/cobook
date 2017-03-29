
//로그인 , 회원가입 여부 판단. 
var cobookLogin = function(email, password, loginType){
	console.log(email+"/" + password);
	$.ajax({
		type : 'POST',
		url : 'member/login',
		contentType : "application/json",
		dataType : 'json',
		data  : {
			"email"  :  email,
		  	"password" 	 :	password,
		  	"loginType" : loginType
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


/**
 * params actionType = Google Join , Google login  , facebook Join, facebook login
 * return accessToken = facebook 접근 토큰 
 * 페이스북 API로 로그인체크를 하고, 로그인을한다
 * 성공하면 , Data를 받아온다. 
 */
var facebook = function(actionType){
	var accessToken = null;
	FB.getLoginStatus(function(response) {
		if (response && response.status === 'connected') {
			//로그인 성공
			accessToken = response.authResponse.accessToken;
			getFacebook(accessToken);

		}else{
			//로그인 상태가 아니라면 로그인
			FB.login(function(reresponse){
				if(reresponse && reresponse.status === 'connected'){
					//로그인 성공시
					accessToken = reresponse.authResponse.accessToken;
					getFacebook(accessToken);
				}					
			},{scope: 'public_profile,email'});
		}
	});
}
/**
 * Facebook에서 개인정보 요청하는 로직 
 * accessToken  인증토큰
 */
var getFacebook = function(accessToken){
	
	FB.api('me?fields=id,name,email,age_range,gender', {
		access_token : accessToken
	}, function(response, user) {
		// handling
		var email = response.email;
		var sex = response.gender;
		var age = response.age_range.min;
		console.log("getfacebook");
		console.log(accessToken);
		console.log(user);
		console.log(response);
		console.log(email);
		console.log(sex);
		console.log(age);
		cobookLogin();
	});
}

/**
 * Join form으로 변경 , 값 세팅
 */
var setJoinForm = function(){
	
	
}

	