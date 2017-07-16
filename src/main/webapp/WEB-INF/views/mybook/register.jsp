<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/cobook/resources/CoBookDesign/css/bootstrap.css?ver=4" rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/login.css?ver=1" rel="stylesheet" type="text/css" media="all"/>
<link href="/cobook/resources/CoBookDesign/css/style.css?ver=3" rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/medile.css?ver=1" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/contactstyle.css" type="text/css" media="all" />
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/font-awesome.min.css" />
<link href="/cobook/resources/CoBookDesign/css/mybookRegister.css?ver=1" rel='stylesheet' type='text/css' />

<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js"></script>
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="/cobook/resources/editor/dist/summernote.js"></script>
<script src="/cobook/resources/editor/dist/lang/summernote-ko-KR.js"></script>
<script src="/cobook/resources/js/editorFunction.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<title>Co-Book</title>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		console.log(member_no);
		callSummernote();
		var coverFile;
		
	    function readURL(input) {
	    	console.log("버튼클릭함1");
	        if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        
	        reader.onload = function (e) {	//Execute a JavaScript immediately after a page has been loaded:
	                $('#cover').attr('src', e.target.result);
					//값을 넣어줄때는 id값에 하나로 넣어준다 
	                $('#fileName').val(input.files[0].name);
					coverFile = reader.result;
	            }
	        
	          reader.readAsDataURL(input.files[0]);
	        
	        }
	    }
	    
	    $("#myFileUp").change(function(){
	        readURL(this);
	        console.log("이미지 바뀜?");
	    });
	    $("#mybookRegister").click(function () {
	    	//console.log(coverFile);
	    	var formData = new FormData($("#mybookForm")[0]);
	    	/* formData.append("member_no",member_no);
	    	formData.append("title",$('#title').val());
	    	formData.append("contents",$('#summernote').val());
	    	formData.append("coverFile",coverFile);
	    	formData.append("intro",$('#intro').val()); */ 
	    	
	    	console.log("등록버튼 클릭 오키");
	    	
	    	 $.ajax({
		    	type : "POST",
		    	url : "/cobook/mybook/mybookRegister",
		    	data : formData,
		    	contentType: false,
		    	
		    	processData: false,
		    	dataType : 'json',
		    	success : function(data) {
		    		console.log("성공함?");
		    		if(data==true){
						//해당 싱글페이지로 이동해야함
						alert("등록되었습니다");
						console.log("성공");
						location.replace("/cobook/mybook/");
					}else{
						console.log("아님 실팽");
						alert("실패하였습니다. 다시 시도하여 주세요");
					}
				}
		    	
		    }); 
		})
	     
	  
	});
	


</script>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" charEncoding="UTF-8">
		<c:param name="loginId" value="loginId" />
	</c:import>
	
	<div class="single-page-agile-main">
		<h4 class="latest-text w3_faq_latest_text w3_latest_text">개인 소설</h4>
		
		<form id="mybookForm" enctype="multipart/form-data" onsubmit="return false;">
		<input type="hidden" name="member_no" value="${member.member_no}">
		<div class="container">
			<div class="agileits-single-top">
				<ol class="breadcrumb">
					<div >
					<li><a href="/cobook/mybook">내 소설</a></li>
					<li class="title-input-li" style="width:100%; padding-top: 10px;">
					<input id ="title" class="form-control" type="text" name="title" placeholder="제목" required="" style="width:95%;">
					</li>
					</div>
				</ol>
				<ol class="breadcrumb">
				<div>
					<li><a href="/cobook/mybook">소설 커버이미지</a></li>
					<li class="title-input-li" style="width:100%;">
					<div class="form-group" style="margin: 8px 0 8px;">
					    <input id="fileName" class="form-control" value="파일선택" disabled="disabled" style="width:85%; display: inline;">
					    <div class="fileRegiBtn">
						 <label for="myFileUp">파일등록하기</label>
						 <input type="file" id="myFileUp" name="coverFile">
						 </div>
					</div>
					</li>
					</div>
				</ol>
				<ol class="breadcrumb">
					<li><a href="/cobook/mybook">커버이미지</a></li>
					<li class="title-input-li" style="width:94%; height: 40%;"></li>
 					<div class="selectCover" style="padding-left: 0;">
 					<img id="cover" src="/cobook/resources/img/defaultImg.jpg" style="width: 182px; height: 268px;"/>
 					</div>
				</ol>
				<ol class="breadcrumb">
				<div>
					<li><a href="/cobook/mybook">작품 간략소개</a></li>
					<li class="title-input-li" style="width:100%; padding-top: 10px;">
					<input id ="intro" class="form-control" type="text" name="intro" placeholder="작품에 대해 간략하게 설명해주세요" required="" style="width:95%;">
					</li>
				</div>
				</ol>
			</div>
			
		
			<div class="single-page-agile-info">
				<div class="show-top-grids-w3lagile">
					<div class="single-left">
						<div class="section group">
							<div class="all-comments">
									<div class="product_desc">
										<p><textarea id='summernote' name="contents" rows="" cols="" required=""></textarea></p>
									</div>
								</div>
								<div class="clear"></div>
						</div>
					</div>
				</div>
			</div>
	</form>	
			<div class="single-page-agile-bottom">
				<button id="mybookRegister" class="mybookRegister">글쓰기</button>
			</div>
		</div>
	</div>
			
</body>
</html>