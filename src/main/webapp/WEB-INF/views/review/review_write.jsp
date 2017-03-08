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
<script type="text/javascript">
$(function(){

	  $("#bollowSearch").on("click", function(){

		  $.getJSON("/", function(data){
			  
		  });

	  });

	  $(".bollow_img").on("click", function(){

	          var aTag = $(this);
	          var eno = aTag.attr("data-eno");
	          var src = aTag.attr("data-src");

	          console.log("eno: " + eno);
	          console.log("src: " + src);
	  });


	});
</script>
<script id="modal-template">
{{#each}}
<div>
<p>{{list.title}}</p>
<p><a class='bollow_img' data-eno='{{eno}}' data-src='{{src}}'><img src='{{src}}'>
</p>
</div>
{{/each}}
</script>
<meta charset="utf-8">
<title></title>
</head>
<body>

	<form class="" action="index.html" method="post">
		<div>
			<label for="">제목:</label> <input type="text" name="title" value="">
		</div>
		<div>
			<label for="">검색:</label>
			<button type="button" id="bollowList" name="button">검색</button>
		</div>
		<div>
			<label for="">내용:</label>
			<textarea name="contents" id="summernote" rows="8" cols="80"></textarea>
		</div>
		<input type="submit" name="" value="글 저장하기">
		<button type="button" name="button">취소</button>
	</form>


	<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#myModal">Open Modal</button>

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
