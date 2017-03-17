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
		$("#sendEmail").on("click", function(){
			
			var auth = firebase.auth();
			//var emailAddress = prompt("이메일 주소를 입력하세요");
			var emailAddress = $("#email").val();
			console.log("이메일주소 체크: " + emailAddress);
			
			auth.sendPasswordResetEmail(emailAddress).then(function() {
			  // Email sent.
				console.log("이메일 보내기 성공");
			}, function(error) {
			  // An error happened.
				console.log("이메일 보내기 실패")
				
			});
		
			
		});
		
		
