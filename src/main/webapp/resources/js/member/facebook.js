
var facebookLogin = function(loginType){
	var accessToken = null;
	FB.getLoginStatus(function(response) {
		if (response && response.status === 'connected') {
			//로그인 성공
			accessToken = response.authResponse.accessToken;
			getFacebook(accessToken,loginType);

		}else{
			//로그인 상태가 아니라면 로그인
			FB.login(function(reresponse){
				if(reresponse && reresponse.status === 'connected'){
					//로그인 성공시
					accessToken = reresponse.authResponse.accessToken;
					getFacebook(accessToken,loginType);
				}					
			},{scope: 'public_profile,email'});
		}
	});
}
// /me는 현재 로그인된 페이스북 사용자를 의미한다.
function getFacebook(accessToken,loginType) {
	FB.api('me?fields=id,name,email,age_range,gender', {
		access_token : accessToken
	}, function(response) {
		// handling
		var email = response.email;
		var gender = response.gender;
		var age = response.age_range.min;
		var nickname = response.name;
		

		coMember.loginType=loginType;
		coMember.email=email;
		coMember.age=age;
		coMember.gender=gender;
		coMember.nickname=nickname;
 	
		coMember.cobookLogin();
	});
}

