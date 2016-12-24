<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<script>
	// 썸머노트 호출
	$(document).ready(function() {

		$('#summernote').summernote({
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			lang : 'ko-KR', // default: 'en-US'
		});

		$("#listBtn").on("click", function(){
			
			history.go(-1);
		});
		
		
	});
</script>
</head>
<title>Home</title>
<body>
	<h1><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
					value="${boardVO.regdate}" /></h1>
		<div class="form-group">
			<ul class="list-group">
			</ul>
		</div>
		<p>
			<label for="">작품명</label> <input type="text" name="title"
				value="${boardVO.title}" readonly="readonly">
		</p>
		<p>
			<label for="">작성자</label> <input type="text" name="writer"
				value="${boardVO.writer}" readonly="readonly">
		</p>
		<p>
			<label for="">내용</label>
			${boardVO.content}
		</p>
		<p>
			<button id="listBtn">목록</button>
		</p>
</body>
</html>
