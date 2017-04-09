		// Initialize Firebase
		var auth
		var config = {
			apiKey : "AIzaSyA6C4WJBlorzppyuN3iJkBlf-tKDes3fVw",
			authDomain : "memowepapp-a42d7.firebaseapp.com",
			databaseURL : "https://memowepapp-a42d7.firebaseio.com",
			storageBucket : "memowepapp-a42d7.appspot.com",
			messagingSenderId : "339527950810"
		};
		firebase.initializeApp(config);
		auth = firebase.auth();
		
		// 비밀번호 찾기 버튼
		// 이메일을 입력받아 메일보내기
		
		var passwordModifyEmail = function(){
			
			var auth = firebase.auth();
			var emailAddress = prompt("회원가입한 이메일 주소를 입력하세요.", "email@address");
			//var emailAddress = $("#email").val();
			console.log("이메일주소 체크: " + emailAddress);
			if(emailAddress != null){

				auth.sendPasswordResetEmail(emailAddress).then(function() {
				  // Email sent.
					alert("해당 이메일로 메일을 전송하였습니다.");
				}, function(error) {
				  // An error happened.
					alert("이메일 전송 실패. \n "+error);
				});
			}else{
				alert("이메일을 입력하세요");
			}
		}
		
		
