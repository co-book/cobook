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
<script>
	// 썸머노트 호출
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			lang : 'ko-KR', // default: 'en-US'

			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					sendFile(files[0], this);
				},
				onMediaDelete : function($target, editor, $editable) {
					deleteFile($target[0].src);
				},
				lang : 'ko-KR'
			}
		});
	});
</script>

<script>
	function sendFile(file, editor) {
		//html5에 기능중 하나인 FormData를 생성 : <form>태그로 만든 데이터의 전송 방식과 동일하게 파일 데이터를 전송할 수 있음.
		var formdata = new FormData();
		formdata.append("file", file);
		$
				.ajax({
					type : "POST",
					url : '/files/uploadFile',
					data : formdata,
					dataType : 'text',
					cache : false,
					//데이터를 일반적인 query string으로 변활 할것인지 결정, 다른 데이터형식으로 데이터를 보내기위해 자동 변환 방지
					//dafault:application/x-www-form-urlencoded -변경> 
					processData : false,
					//dafalut:application/x-www-form-urlencoded -변경> multipart/form-data 
					contentType : false,
					success : function(data) {
						console.log(data);
						//서버명과 로컬호스트가 없어서 안된거였음.
						var url = data;
						console.log(url);
						$('#summernote').summernote('editor.insertImage', url);
						//url를 받아서 li<input type=hidden name='files' value="url을 넣어준다.">
						var dataname = data.substring(url.indexOf("_") + 1);
						$(".list-group")
								.append(
										"<li class='list-group-item'>"
												+ dataname
												+ "<input type='hidden' name='file_url' value='"+url+"'/></li>");

						$(".list-group")
								.append(
										"<li class='list-group-item'>"
												+ dataname
												+ "<input type='text' name='file_url' value='"+url+"'/></li>");

					}
				});
	}

	function deleteFile(file) {
		//이미지를 클릭후 삭제버튼을 클릭했을때 url이 깨져서 들어것을 다시 디코딩
		var currentFileName = decodeURIComponent(file);

		$.ajax({
			url : '/files/deleteFile',
			type : 'post',
			data : {
				fileName : currentFileName
			},
			dataType : 'text',
			success : function(result) {
				if (result == 'deleted') {
					//---/2016/09/19/5e617c4d-998f-4db7-bb55-554dec4d8e94_[스프링 생명주기.png] 잘라내기
					currentFileName = currentFileName.substring(currentFileName
							.indexOf("_") + 1);

					$(".list-group-item").each(function(index) {
						var value = $(this).text();
						//루프를 돌면서 하나씩 텍스트 내용과 삭제되는 파일이름을 비교
						if (currentFileName === value) {
							//에디터에 있는 이미지가 삭제된다면 하단에 표시된 파일명도 같이삭제 된다.
							$(this).remove();
						}
					});
				}
			}
		});
	}
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
