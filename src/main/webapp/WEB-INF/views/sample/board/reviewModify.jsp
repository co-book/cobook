<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript"
		src="/cobook/resources/test/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	<link rel="stylesheet"
		href="/cobook/resources/test/jquery-ui-1.12.1.custom/jquery-ui.min.css">
		<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
	<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css"
	rel="stylesheet">
<script src="/cobook/resources/editor/dist/summernote.js"></script>
<script src="/cobook/resources/editor/dist/lang/summernote-ko-KR.js"></script>
<script src="/cobook/resources/js/editorFunction.js"></script>
	<script type="text/javascript">
$(function(){
	callSummernote();
	
	// file요소 삭제
	$("input[multiple=multiple]").remove();
	$("#dialog").hide();
	// 팝업창 초기화
		$("#dialog").dialog({
			autoOpen : false,
			modal : true, //모달대화상자
			resizable : false, //크기 조절 못하게
			width : 500,
			height : 1000,
			// draggable: false,
			position : {
				my : "center"
			},
			buttons : {
				"확인" : function() {
					$(this).dialog("close");
				},
				"취소" : function() {
					$(this).dialog("close");
				}
			}

		});
	
	// 빌린책 팝업창 클릭
		$("#borrowList").on("click", function(){
					console.log("팝업창 클릭");
					$("#dialog").show();
					$("#dialog").dialog("open");
					var member_no = 10;
					$.getJSON("/cobook/ajax/borrowedBook/" + member_no, function(data) {
						
						console.log(data);
						var template=Handlebars.compile($("#books").html());
						var html = template(data);
						$("#bookList").html(html);
					});

		});
		
		// 빌린책 리스트중 하나를 클릭 하면 히든값으로 배치됨
		$("#bookList").on("click", "#book", function(){
			console.log("책 클릭");
			var imgObj = $(this).children().first();
			var ebook_no = $(this).children().first().attr('data-ebookno');
			console.log("ebook_no값: " + ebook_no);
			var src = imgObj.attr('data-src');
			console.log($('input[name=ebook_no]'));
			$('input[name=ebook_no]').val(ebook_no);
			$("#display").text(ebook_no);
			$("#setImg").attr("src", src);
			$("#dialog").dialog("close");
		}); 
// 수정 버튼
	 $("#save").on("click", function(event){
		
		event.preventDefault();
	
		// 모달창 파일선택시 files 이름명에 값이 들어가는걸 제외함
		//$("input[multiple=multiple]").remove();
			var imgObj = $("img[src*='display']");
			console.log(imgObj);
	
			var str = "";
			// textarea에 <img>태그객체를 가져와서 객체당 input요소를 생성
			imgObj.each(function(index){
				str += "<input type='hidden' name='files[" + index +"]' value='"+$(this).
				attr("src") +"'>";
			});
			
			$("form").append(str);
			$("#registerForm").submit();
	}); 
	
});
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="registerForm" action="/cobook/sample/RmodifyPage" method="post" >
	<input type="hidden" name="member_no" value="${reviewVO.MEMBER_NO}">
	<input type="hidden" name="review_no" value="${reviewVO.REVIEW_NO}">
	<input type="hidden" name="ebook_no" value="${reviewVO.EBOOK_NO}">
	<p>작성자 : <input type="text" name="nickname" value="${reviewVO.NICKNAME}"></p>
	<p>책 이미지파일 : <img src="${reviewVO.COVERURL}"> </p>
	<p>글번호 : ${reviewVO.REVIEW_NO}</p>
	<p>제목 : <input type="text" name="title" value="${reviewVO.TITLE}"></p>
<p>	내용 : <textarea id='summernote' name="contents" rows="" cols="">${reviewVO.CONTENTS}</textarea></p>
	<button type="button" id="borrowList"  name="button">book review list</button>
	<div class="form-group">
			<ul class="list-group">
			</ul>
	</div>
	<input type="button" id="save" value="수정하기">
	</form>
	<div id="display"></div>
	
	
	
	
	


</body>
</html>
