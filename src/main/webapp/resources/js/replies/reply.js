function Reply(){
	this.reply_no = "";
	this.parent_no = "";
	this.member_no = "";
	this.board_no = "";
	this.parent_type = "";
	this.contents = "";
	this.reg_date = "";
	this.starRating = "";
	this.nickname = "";
	this.likeCount = "";
	this.commentCount = "";
}

Reply.prototype.reply = function() {
	console.log(this);
	console.log(this.reply_no + "/" + this.parent_no + "/" + this.member_no
			+ "/" + this.board_no + "/" + this.parent_type + "/"
			+ this.contents + "/" + this.reg_date + "/" + this.starRating + "/"
			+ this.likeCount + "/" + this.likeCount + "/" + this.commentCount);
}

// 리플 등록하기
Reply.prototype.addReply = function() {

	console.log("add");
	console.log(this);
	var func=this.getReplyList;
	$.ajax({
		type : 'POST',
		url : '/cobook/replies/addReply',
		data : JSON.stringify({
			"member_no" : this.member_no,
			"board_no" : this.ebook_no,
			"contents" : $('#replyContents').val(),
			"parent_type" : this.parent_type,
			"starRating" : $('#starRating').val()
		}),
		async: false,
		dataType : 'text',
		contentType : "application/json",
		success : function(result, status) {
			console.log(status);
			console.log(result);
			if (result == "SUCCESS") {
				//성공시
				$('#replyContents').val("");
				console.log(this);
				func();
			} else {
				alert("이미 작성하셨습니다");
				console.log(this);
				func();
			}
		}
	});
}

// 리플리스트 불러오기
Reply.prototype.getReplyList = function() {
	console.log("getReplyList");
	$.ajax({
		type : 'get',
		url : '/cobook/replies/getReplyList',
		data  :{
			"board_no" : this.ebook_no,
			"parent_type" : "EBOOK"
		},
		dataType : 'html',
		success : function(result) {
			//불러온 댓글 리스트 등록
			$('#reply_list').html(result);
			//리플리스트에 이벤트 초기화
			commentEventInit(); 
		}
	});
}

// 리플 삭제
Reply.prototype.deleteReply = function(delete_reply_no) {

	console.log("deleteReply");
	var func = this.getReplyList;
	$.ajax({
		type : 'DELETE',
		url : '/cobook/replies/' + delete_reply_no,
		data : JSON.stringify({
			"member_no" : this.member_no
		}),
		async: false,
		dataType : 'text',
		contentType : "application/json",
		success : function(result, status) {
			console.log(status);
			console.log(result);
			if (result == "SUCCESS") {
				console.log("삭제했어요");
				// 성공시 리플리스트 다시 실행
				func();
			} else {
				alert("다시 시도해 주세용~");
			}
		}
	});
}

// 코멘트 등록하기
Reply.prototype.addComment = function() {
}

// 코멘트 리스트 불러오기
Reply.prototype.getCommentList = function() {
}

// 코멘트 삭제하기
Reply.prototype.deleteComment = function() {
}
