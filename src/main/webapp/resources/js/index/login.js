// 로그인 요청 ajax
	$(function() {
		$("#loginBtn").on("click", function() {
			console.log("체크");
			var email = $("#email").val();
			var password = $("#password").val();
			console.log(email);
			console.log(password);
			$.ajax({

				type : 'POST',
				url : '/member/loginPOST',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					email : email,
					password : password
				}),
				success : function(result) {
					console.log(result);
					if (result.indexOf("S") != -1) {
						alert("로그인성공");
						location.reload();
					} else {
						alert("로그인 실패")
						$("#email").val("");
						$("#password").val("");
					}
				}

			});

		});

	});