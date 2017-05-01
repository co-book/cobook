

function Reply(){
	this.reply_no = "";
	this.parent_no = "";
	this.member_no ="";
	this.board_no="";
	this.parent_type = "";
	this.contents = "";
	this.reg_date = "";
	this.starRating="";
	this.nickname="";
	this.likeCount="";
	this.commentCount="";
}     

Reply.prototype.reply= function(){
	console.log(this);
	console.log(this.reply_no+"/" + this.parent_no +"/"+ this.member_no+"/"+
			    this.board_no+"/"+ this.parent_type+"/"+ this.contents+"/"+
			    this.reg_date+"/"+ this.starRating+"/"+ this.likeCount+"/"+
			    this.likeCount+"/"+ this.commentCount);
}

//로그인
CobookMember.prototype.getReplyList = function(){
	
    	console.log(this.email+"/" + this.password +"/"+ this.loginType);
    	$.ajax({
			type : 'get',
			url : '/cobook/replies/getReplyList',
			data  :{
				"board_no" : ebook_no,
				"parent_type" : "EBOOK"
			},
			dataType : 'html',
			//contentType : "application/json",
			success : function(result) {
				console.log(result);
				$('#wrap-media-list').append(result);
					/* //대여 성공시 새로고침
					if(result.result=="SUCCESS"){
						location.reload();
					}else{
						//실패시 alert
						alert("다시 대여해주세요");
					}     */			
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