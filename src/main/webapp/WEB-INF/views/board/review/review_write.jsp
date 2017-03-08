<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css"
	rel="stylesheet">
<script src="/resources/editor/dist/summernote.js"></script>
<script src="/resources/editor/dist/lang/summernote-ko-KR.js"></script>
<script src="/resources/js/editorFunction.js"></script>
<script type="text/javascript"
	src="/resources/raty-master/lib/jquery.raty.js">
	
</script>
<script type="text/javascript">
	$(function() {

		var member_no = 1;
		callSummernote();
		// 검색버튼을 눌럿을때 내가 빌렷던 책목록을 가져옴
		$("#bollowSearch").on("click", function() {

			$.getJSON("/ajax/borrowedBook/" + member_no, function(data) {
				console.log(data);
				var templateHtml = $("#modal-template").html();
				console.log(templateHtml);
				var template = Handlebars.compile(templateHtml);

				var html = template(data);
				$(".modal-body").html(html);
			});

		});

		$(".modal-body").on("click", ".bollow_img", function() {

			var aTag = $(this);
			var eno = aTag.attr("data-eno");
			$("#eno").val(eno);
			$("#mno").val(member_no);
			console.log("eno: " + eno);
			console.log("mno: " + member_no);
			$('#myModal').modal('hide');
		});

		$("#canceil").on("click", function() {

			history.back();
		});
	
		// 별점 메서드
		$('div#star').raty({
			score : 3,
			path : "/resources/raty-master/lib/images/",
			width : 200,
			click : function(score, evt) {
				$("#starRating").val(score);
				$("#displayStarRating").html(score);
			},
			half : true
		});
	
	
	});
</script>
<script>
	function printData(dataArr, target, templeObj) {

		// 템플릿Obj의 html을 추출
		// handlebars 컴파일시킴 
		// 그런다음 template 에 데이터를 끼워넣은 후  html 넣어줌
		var templeHtml = templeObj.html();
		var template = Handlebars.compile(templateHtml);
		var html = template(dataArr);
		target.html(html);
	}
</script>
<script id="modal-template" type="text/x-handlebars-template">

{{#each .}}
<div>
<p>{{TITLE}}</p>
<p>
	<a href="#" class='bollow_img' data-eno='{{EBOOK_NO}}' data-src='http://localhost:8080/files/displayFile?fileName={{FILEURL}}'>
		<img src='http://localhost:8080/files/displayFile?fileName={{FILEURL}}'>
	</a>
</p>
</div>
{{/each}}
</script>
<meta charset="utf-8">
<title></title>
</head>
<body>

	<form class="" action="/board/review/review_write" method="post">
		<div>
			<input type="hidden" id="eno" name="ebook_no" value=""> <input
				type="hidden" id="mno" name="member_no" value="">
		</div>
		<div>
			<label for="">제목:</label> <input type="text" name="title" value="">
		</div>
		<button type="button" id="bollowSearch" class="btn btn-info btn-lg"
			data-toggle="modal" data-target="#myModal">검색</button>
		<div id="star"></div>
		<!-- 별점  -->
		<div style="padding-top: 10px;">
			<label for="displayStarRating">Value : </label><span
				id="displayStarRating" style="padding-left: 20px;">3</span>
		</div>
		<div>
			<input type="hidden" id="starRating" name="evaluate" value="3" />
		</div>
		<!-- 별점 끝 -->
		<div>
			<label for="">내용</label>
			<textarea name="contents" id="summernote" rows="8" cols="80"></textarea>
		</div>
		<input type="submit" name="" value="글 저장하기">
		<button type="button" name="button">취소</button>
	</form>




	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!--<script id="modal-template" type="text/x-handlebars-template"> -->
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<div>
						<p>책제목</p>
						<p>
							<img alt="" src="C:\Users\Andaehyun\Pictures\a.JPG">
						</p>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!-- modal끝 -->


</body>
</html>
