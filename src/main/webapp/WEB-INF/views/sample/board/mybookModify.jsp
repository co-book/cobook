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


	 $("#save").on("click", function(event){
		
		 var imgObj = $("img[src*='display']");
		event.preventDefault();
		var str = "";
		// textarea에 <img>태그객체를 가져와서 객체당 input요소를 생성
		imgObj.each(function(index){
			str += "<input type='hidden' name='files' value='"+$(this).
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
	<form id="registerForm" action="/cobook/sample/MmodifyPage" method="post" enctype="multipart/form-data">
	<input type="hidden" name="member_no" value="${login.MEMBER_NO}">
	<input type="hidden" name="mybook_no" value="${mybookVO.MYBOOK_NO}">
	<input type="hidden" name="fileurl" value="${mybookVO.FILEURL}">
	<p>작성자 : <input type="text" name="nickname" value="${login.NICKNAME}"></p>
	<p>책 이미지파일 : <input type="file" id="coverFile" name="coverFile"> </p>
	<img alt="" src="${mybookVO.FILEURL}">
	<p>제목 : <input type="text" name="title" value="${mybookVO.TITLE}"></p>
<p>	내용 : <textarea id='summernote' name="contents" rows="" cols="">${mybookVO.CONTENTS}</textarea></p>
	<button type="button" id="borrowList"  name="button">my book list</button>
	<div class="form-group">
			<ul class="list-group">
			</ul>
	</div>
	<input type="button" id="save" value="수정하기">
	</form>
	<div id="display"></div>
	
	
	
	
	


</body>
</html>
