
	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		// 토큰을 가져온다 

		// response 객체는 현재 로그인 상태를 나타내는 정보를 보여준다. 
		// 앱에서 현재의 로그인 상태에 따라 동작하면 된다. 
		// FB.getLoginStatus().의 레퍼런스에서 더 자세한 내용이 참조 가능하다. 
		if (response.status === 'connected') {
			// 페이스북을 통해서 로그인이 되어있다. 
			// 토큰을 가져온다 
			var accessToken = response.authResponse.accessToken;

		} else if (response.status === 'not_authorized') {
			// 페이스북에는 로그인 했으나, 앱에는 로그인이 되어있지 않다. 
			/* 
			 * document.getElementById('status').innerHTML = 'Please log ' + 'into 
			 * this app.'; 
			 */
		} else {
			// 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다. 
			// document.getElementById('status').innerHTML = 'Please log ' 
			// + 'into Facebook.'; 
		}
	}

	// /me는 현재 로그인된 페이스북 사용자를 의미한다.
	function getProFile(accessToken) {

		FB.api('me?fields=id,name,email,age_range,gender', {
			access_token : accessToken
		}, function(response) {
			// handling

			setFacebookProFile(response);

		});
	}

	function setFacebookProFile(resp) {

		var email = resp.email;
		var sex = resp.gender;
		var age = resp.age_range.min;
		console.log(resp);
		console.log(email);
		console.log(sex);
		console.log(age);
		$("#sex").val(sex);
		$("#age").val(age);
		$("#email").val(email);

	}

	/* function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	} */
	$(document).ready(function() {
		$("#fBtn").on("click", function() {
			console.log("페이스북 호출");
			FB.getLoginStatus(function(response) {
				console.log(response);
				if (response && response.status === 'connected') {

					openJoin();
					FB.logout(function(response) {
						console.log("로그아웃 호출");
					});
				}else{
					
					FB.login(function(response){
				
						if(response && response.status === 'connected'){
							openJoin();
							FB.logout(function(response) {
								console.log("로그아웃 호출");
							});
						}					
					
					});
				}

			});

		});
	});