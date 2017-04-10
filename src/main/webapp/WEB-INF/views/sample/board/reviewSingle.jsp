<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싱글페이지</title>
</head>
<body>
	<p>글번호 : ${reviewVO.REVIEW_NO}</p>
	<p>제목 : ${reviewVO.TITLE}</p>
	<p>작성자 : ${reviewVO.NICKNAME}</p>
	<p>이미지 : <img alt="" src="${reviewVO.COVERURL}"> </p>
	<p>내용 : ${reviewVO.CONTENTS}</p>
	<p>조회수 : ${reviewVO.HIT}</p>
	<p>날짜 : ${reviewVO.REG_DATE}</p>
	<p>평점 : ${reviewVO.EVALUATE}
	<p>댓글 총 갯수 : ${REPLYCOUNT}</p>
	
	
	
	<button class="modBtn">수정</button>
	<button class="rmBtn">삭제</button>
	<button class="listBtn">목록</button>
	
	<!-- FormHtml -->
<form class="singleForm" action="" method="post">
	<input type="hidden" id="review_noTxt" name="review_no" value="">
	<input type="hidden" id="pageTxt"  name="page" value="">
	<input type="hidden" id="perPageNumTxt" name="perPageNum"  value="">
</form>	
</body>
<script type="text/javascript">
$(function(){
	
	var review_no = '${reviewVO.REVIEW_NO}';
	var page = '${cri.page}';
	var perPageNum = '${cri.perPageNum}';
	var searchType = '${cri.searchType}';
	var keyword = '${cri.keyword}';
	
	var formObj = $(".singleForm");
	
	console.log("값테스트");
	console.log("review_no = " + review_no);
	console.log("page = " + page);
	console.log("perPageNum = " + perPageNum);
	
	$(".modBtn").on("click", function(){
		
		 var url = "/cobook/sample/RmodifyPage?review_no="+review_no;
		//$(location).attr("href", url);
		formObj.attr("action", url);
		formObj.attr("method", "get");
		$("#review_noTxt").val(review_no);
		$("#pageTxt").val(page);
		$("#perPageNumTxt").val(perPageNum);
		formObj.submit();
	});
	
	// 삭제버튼 처리
	$(".rmBtn").on("click", function(){
		console.log("삭제버튼 클릭");
		var url = "/cobook/sample/bRremovePage";
		formObj.attr("action", url);
		formObj.attr("method", "post");		
		$("#review_noTxt").val(review_no);
		$("#pageTxt").val(page);
		$("#perPageNumTxt").val(perPageNum);
		// 에디터로 추가된 img태그들의 객체를 가져옴
		var imgObj = $("img[src*='display']");
		createFileInput(imgObj);
		
		formObj.submit();
	});
	
	$(".listBtn").on("click", function(){
		console.log("리스트버튼 클릭");
		var url = "/cobook/sample/reviewList?page="+page+"&perPageNum="+perPageNum
				+ "&searchType="+searchType+"&keyword="+keyword;
		$(location).attr("href", url);
	});
	
	function createFileInput(imgObj){
		var str = "";
		// textarea에 <img>태그객체를 가져와서 객체당 input요소를 생성
		imgObj.each(function(index){
			str += "<input type='hidden' name='files[" + index +"]' value='"+$(this).
			attr("src") +"'>";
		});
	}
	
});

</script>
</html>