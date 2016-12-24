<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css"
	rel="stylesheet">
<script src="/resources/editor/dist/summernote.js"></script>
<script src="/resources/editor/dist/lang/summernote-ko-KR.js"></script>
<script src="/resources/js/editorFunction.js"></script>
<script>
	// 썸머노트 호출
	$(document).ready(function() {
		callSummernote();
	});
</script>


</head>
<title>Home</title>
<body>
	<form class="" action="/board/write" method="post">
		
		<p>
			<label for="">작품명</label> <input type="text" name="title"
				value="">
		</p>
		
		<p>
			<label for="">작성자</label> <input type="text" name="writer"
				value="">
		</p>
		<p>
			<label for="">내용</label>
			<textarea id="summernote" name="content" rows="80" cols="80">

          </textarea>
		</p>
		<div class="form-group">
			<ul class="list-group">
			</ul>
		</div>
		<p>
			<input type="submit" name="" value="전송"> <input type="reset"
				name="" value="취소">
				
		</p>
	</form>
</body>
</html>
