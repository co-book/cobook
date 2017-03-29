function callSummernote(){
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
}

function sendFile(file, editor) {
	//html5에 기능중 하나인 FormData를 생성 : <form>태그로 만든 데이터의 전송 방식과 동일하게 파일 데이터를 전송할 수 있음.
	var formdata = new FormData();
	console.log("파파파file: " + file);
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
					var uploadPath = "";
					console.log(url);
					$('#summernote').summernote('editor.insertImage', url);
					//url를 받아서 li<input type=hidden name='files' value="url을 넣어준다.">
					var dataname = data.substring(url.indexOf("_") + 1);
					$(".list-group")
							.append(
									"<li class='list-group-item'>"
											+ dataname
											+ "<input type='hidden' name='files' value='"+url+"'/></li>");

				

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