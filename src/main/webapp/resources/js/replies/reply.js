function Reply(){
	this.reply_no = "";
	this.parent_no = "";
	this.member_no = "";
	this.board_no = "";
	this.ebook_no = "";
	this.parent_type = "";
	this.contents = "";
	this.reg_date = "";
	this.starRating = "";
	this.nickname = "";
	this.likeCount = "";
	this.commentCount = "";
	this.moreCnt=1;
}

Reply.prototype.reply = function() {
	console.log(this);
	console.log(this.reply_no + "/" + this.parent_no + "/" + this.member_no
			+ "/" + this.board_no + "/" + this.parent_type + "/"
			+ this.contents + "/" + this.reg_date + "/" + this.starRating + "/"
			+ this.likeCount + "/" + this.likeCount + "/" + this.commentCount);
}

//Single 페이지
//리플, 코멘트 추가/제거시 ( single 별점, commet 수 증감 해야함)
//현재는 로그인 되어있으면 삭제버튼 모두 활성화 -> 글쓴이 = 멤버넘이 같을때만 활성화 해야함
//더보기 처리해야함 
//댓글 좋아요 처리 ..
//날짜 선택시 가격 변경해야함
//UP NEXT 가져오기
//to compare?  


// 리플 등록하기
Reply.prototype.addReply = function() {
	var getReplyList=this.getReplyList;
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
		async: false,	//계속 실행되면 안댐
		dataType : 'text',
		contentType : "application/json",
		success : function(result, status) {
			console.log(status);
			console.log(result);
			if (result == "SUCCESS") {
				//성공시
				$('#replyContents').val("");
				getReplyList();
			} else {
				alert("이미 작성하셨습니다");
			}
		}
	});
}

// 리플리스트 불러오기
Reply.prototype.getReplyList = function() {
	console.log(this.moreCnt);
	$.ajax({
		type : 'get',
		url : '/cobook/replies/getReplyList',
		data  :{
			"board_no" : this.ebook_no,
			"parent_type" : this.parent_type,
			"moreCnt" : this.moreCnt
		},
		dataType : 'html',
		success : function(result) {
			//불러온 댓글 리스트 등록
			$('#reply_list').html(result);
			//리플리스트에 이벤트 초기화
			replyEventInit(); 
		}
	});
}

// 리플 삭제
Reply.prototype.deleteReply = function(delete_reply_no) {

	console.log("deleteReply");
	var getReplyList = this.getReplyList;
	$.ajax({
		type : 'DELETE',
		url : '/cobook/replies/' + delete_reply_no,
		data : JSON.stringify({
			"member_no" : this.member_no,
			"parent_type" : this.parent_type,
			"board_no" : this.ebook_no
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
				getReplyList();
			} else {
				alert("다시 시도해 주세용~");
			}
		}
	});
}

// 코멘트 등록하기
Reply.prototype.addComment = function(parent_no) {
	var getCommentList = this.getCommentList;
	$.ajax({
		type : 'POST',
		url : '/cobook/replies/addComment',
		data : JSON.stringify({
			"member_no" : this.member_no,
			"board_no" : this.ebook_no,
			"parent_no" : parent_no,
			"contents" : $('#commentContents'+parent_no).val(),
			"parent_type" : this.parent_type
		}),
		dataType : 'text',
		contentType : "application/json",
		success : function(result, status) {
			if (result == "SUCCESS") {
				$('#commentContents'+parent_no).val("");
				getCommentList(parent_no);
			} else {
				alert("다시 시도해 주세용~");
			}
		}
	});
}

// 코멘트 리스트 불러오기
Reply.prototype.getCommentList = function(parent_no) {
	$.ajax({
		type : 'get',
		url : '/cobook/replies/getCommentList',
		data : {
			"parent_type" : this.parent_type,
			"board_no" : this.ebook_no,
			"parent_no" : parent_no
		},
		dataType : 'html',
		success : function(result) {
			$("#comment" + parent_no).html(result);
			commentEventInit();
		}
	});
}

// 코멘트 삭제하기
Reply.prototype.deleteComment = function(delete_reply_no,parent_no) {
	var getCommentList = this.getCommentList;
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
			if (result == "SUCCESS") {
				console.log("삭제했어요");
				// 성공시 리플리스트 다시 실행
				getCommentList(parent_no);
			} else {
				alert("다시 시도해 주세용~");
			}
		}
	});
}
