<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script>
	$(function() {

		var board_no = 1;
		var parent_type = 'mybook';
		var member_no = '${login.member_no}';
		var test = '${login}';
		console.log(test);
		console.log("회원번호: " + member_no);
	/* 	getReplyList(10,1); */
		// parent_type board_no가 어느 테이블에 속해잇는지 알려줌
		var parent_type = 'mybook';
		
		$("#addReply").on("click", function() {

			var contents = $("#contents").val();
			$.ajax({
				
				type : 'post',
				url : '/replies/',
				dataType : 'text',
				data : JSON.stringify({
                    member_no : member_no,
                    parent_type : parent_type,
                    board_no : board_no,
                    contents : contents

              	}),
              	success : function(result){
              		getReplyList(board_no);
              	}
				
			});
		});

		function getReplyList(perPageNum, page) {

			var replyURL = "/replies/" + parent_type + "/" + board_no
						+ "/"+ perPageNum + "/" + page;
			$.getJSON(replyURL, function(data){
				
					console.log(data);				
			});
			
		}
		
		// 좋아요 클릭시 이벤트처리
	 	$(".like").on("click", function(){
			console.log("클릭");
			var likeImg = $(this).children().first();
			var isLike = likeImg.attr("data-islike");
			console.log(isLike);
			if(isLike == "false"){
				likeImg.attr("src","/resources/img/light-like.png");
				likeImg.attr("data-islike", "true");
			}else{
				likeImg.attr("src","/resources/img/like.png");
				likeImg.attr("data-islike", "false");
			}
			
		}); 
		
		
		

	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>리플 테스트</h1>
	<p>
		작성자:&nbsp;<input type="text" id="writer" name="writer">
	</p>
	<p>
		내용:&nbsp;<input type="text" id="contents" name="contents">
	</p>
	<button id="addReply">글쓰기</button>
	<div id="replies">
		<ul>
			<li>
				<div>No1:유저ID&nbsp;2017/03/08</div>
				<textarea id="replyCont" rows="" cols=""></textarea>
				<a href="#" class="like"><img data-islike="false" alt="" width="30px" height="30px" src="/resources/img/like.png"></a>10	
				<br />
				<p>
				<button id="commentBtn">답글달기</button>
				<button id="rmBtn">삭제</button>
				<button id="modBtn">수정</button>
				</p>
			</li>
			
		</ul>
		<button>더보기</button>
		
		
	</div>


	<script id="reply-template" type="text/x-handlebars-template">
{{#each .}}	
<ul>
			<li>
				<div>No1:유저ID&nbsp;2017/03/08</div>
				<textarea id="replyCont" rows="" cols=""></textarea>
				<a href="#" class="like"><img data-islike="false" alt="" width="30px" height="30px" src="/resources/img/like.png"></a>10	
				<br />
				<p>
				<button id="commentBtn">답글달기</button>
				<button id="rmBtn">삭제</button>
				<button id="modBtn">수정</button>
				</p>
			</li>
			
		</ul>
		<button>더보기</button>
	</script>


</body>
</html>