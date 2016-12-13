<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
#modDiv {
	width: 300px;
	height: 100px;
	background-color: gray;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}

.pagination li{
  list-style: none;
  float: left; 
  padding: 3px; 
  border: 1px solid blue;
  margin:3px;  
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		var bno = 10;
		var page = 1;
		getReplyList(page);
		var replyPage = 1;
		
		$("#replyAddBtn").on("click", function() {
			var replyer = $("#newReplyWriter").val();
			var replytext = $("#newReplyText").val();
			console.log(replyer+": "+ replytext);

				var replyer = $("#newReplyWriter").val();
				var replytext = $("#newReplyText").val();

				$.ajax({
					type : 'post',
					url : '/replies/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						bno : bno,
						replyer : replyer,
						replytext : replytext
					}),
					success : function(result) {

						if (result == 'SUCCESS') {

							getReplyList(page);
						}
					}
				});

		});

		$("#replies").on("click", ".replyLi button", function(){
			
			var reply = $(this).parent();
			var rno = reply.attr("data-rno");
			var replytext = reply.text();
			
			$(".modal-title").html(rno);
			$("#replytext").val(replytext);
			$("#modDiv").show("slow");
			
		});
		
		$("#replyDelBtn").on("click", function(){
			var rno = $(".replyLi").attr("data-rno");
			
			$.ajax({

				type:"delete",
				url:"/replies/"+rno,
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override":"DELETE"
				},
				dataType:"text",
				success:function(result){
					
					if(result ==	 "SUCCESS"){
						alert("삭제되었습니다.");
						$("#modDiv").hide("slow");
						getReplyList(replypage);
					}
				}
				
			});
			
		});
		// 필요한값 rno,replytext,bno,page
		$("#replyModBtn").on("click", function(){
			
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			$.ajax({
				
				type:"PUT",
				url:"/replies/"+rno,
				headers:{
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "PUT"
				},
				dataType:"text",
				data: JSON.stringify({replytext:replytext}),
				success:function(result){
					if(result == "SUCCESS"){
						alert("수정 되었습니다.");
						$("#modDiv").hide("slow");
						getReplyList(replypage);
					}
				}
			
			});
			
		});
		
		$(".pagination").on("click", "li a", function(event){
			event.preventDefault();
			
			replyPage = $(this).attr("href");
			console.log("replyPage: "+replyPage);
			getReplyList(replyPage);
			
		});
		
	
	function getReplyList(page) {

		$.getJSON("/replies/" + bno + "/" + page, function(data) {
			console.log(data.list.length);
			var str = "";
			$(data.list).each(
					function() {

						str += "<li class='replyLi' data-rno='"+this.rno+"'>"
								+this.rno+": "+this.replytext
								+ "<button>MOD</button></li>";
					});

			$("#replies").html(str);
			printPaging(data.pageMaker);
		});
	}
	
		function printPaging(pageMaker){
			
			var startPage = pageMaker.startPage;
			var endPage = pageMaker.endPage;
			
			if(pageMaker == null){
				return;
			}
			
			var str = "";
			
			if(pageMaker.prev === true){
				str = "<a href='"+ (startPage - 1) +"'>"
				+ "<< </a>" 
			}
			
			for(i = startPage; i <= endPage; i++){
				
				str += "<li><a href='"+i+"'>"
				+i+"</a></li>"; 
			}
			
			if(endPage === true){
				str = "<a href='"+(endPage - 1) +"'>"
				+ ">> </a>"
			}
			$(".pagination").html(str);
		}
		
		$("#closeBtn").on("click", function(){
			
			$("#modDiv").hide("slow");
		});
		
		
		
		
		});
	
	
</script>
<meta charset="utf-8">
<title></title>
</head>
<body>
	<h2>Ajax Test Page</h2>

	<div id="modDiv" style="display: none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="replytext">
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">DELETE</button>
			<button type="button" id="closeBtn">Close</button>

		</div>
	</div>


	<div>
		<div class="">
			Replyer <input type="text" name="replyer" id="newReplyWriter"
				value="">
		</div>
		<div class="">
			ReplyText <input type="text" id="newReplyText" name="name" value="">
		</div>
		<button type="button" id="replyAddBtn" name="button">ADD
			REPLY</button>
	</div>


	<ul id="replies">
	</ul>

	<ul class="pagination"></ul>
</body>
</html>
