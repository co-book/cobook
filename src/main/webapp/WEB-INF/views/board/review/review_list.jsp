<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<title></title>
<script type="text/javascript">
$(function(){

        $("#writeBtn").on("click", function(){

          var writeURL = "/board/review/review_write";
          $(location).attr('href', writeURL);
        });
        
        $("#searchBtn").on("click", function(){
        	var keyword = $("#keywordInput").val();
        	var searchType = $("select").val();
        	var page = 1;
        	var perPageNum = '${cri.perPageNum}';
        	console.log("키워드 값: " + keyword);
        	console.log("검색타입: " + searchType);
        	
        	var searchURL 
	        	= "/board/review/review_list?searchType="+searchType
        					+"&keyword="+keyword
        					+"&page="+page
        					+"&perPageNum="+perPageNum;
        	
        	$(location).attr("href", searchURL);
        });      
        
});
    </script>

</head>

<body>
	
	<div id="selectBox">
		<select name="searchType">
			<option value="n"
				<c:out value="${cri.searchType == null?'selected':''}"/>>
				---</option>
			<option value="t"
				<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
				Title</option>
			<option value="c"
				<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
				Content</option>
			<option value="w"
				<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
				Writer</option>
			<option value="tc"
				<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
				Title OR Content</option>
			<option value="cw"
				<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
				Content OR Writer</option>
			<option value="tcw"
				<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
				Title OR Content OR Writer</option>
		</select> <input type="text" name='keyword' id="keywordInput"
			value='${cri.keyword}'>
		<button id='searchBtn'>Search</button>
		<button id='writeBtn'>write Board</button>

	</div>
	<table>
		<tr>
			<th>이미지</th>
			<th>제목</th>
			<th>작성자</th>
			<th>별점</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="reviewVO">
			<tr>
				<td><a href="/board/review/review_read${pageMaker.makeSearch(cri.page)}&review_no=${reviewVO.review_no}"><img src='${displayFile}${reviewVO.fileurl}'></a></td>
				<td><a href="/board/review/review_read${pageMaker.makeSearch(cri.page)}&review_no=${reviewVO.review_no}">${reviewVO.title}</a></td>
				<td>갑동이</td>
				<td>${reviewVO.evaluate}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
						value="${boardVO.regdate}" /></td>
				<td>${reviewVO.hit}</td>
			</tr>
		</c:forEach>
	</table>

	<nav>
		<ul class="pagination">
			<!-- 이전 검사 -->
			<c:if test="${pageMaker.prev}">
				<a href="/board/review/review_list${pageMaker.makeSearch(pageMaker.startPage - 1)}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a>

			</c:if>
			<!-- 페이지 for문 처리 -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">

				<li
					<c:out value="${pageMaker.cri.page == idx? 'class=active': ''}" />>
					<a href="/board/review/review_list${pageMaker.makeSearch(idx)}">${idx} <span class="sr-only">(current)</span></a>
				</li>

			</c:forEach>

			<!-- 다음페이지가 있는지 검사 -->
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">

				<a href="/board/review/review_list${pageMaker.makeSearch(pageMaker.endPage + 1)}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a>

			</c:if>

		</ul>
	</nav>









	<script id="list-template" type="text/javascript">
    <tr>
        <th>이미지 </th>
        <th>제목 </th>
        <th>작성자 </th>
        <th>별점 </th>
        <th>등록일 </th>
        <th>조회수 </th>
    </tr>
{{each .}}
    <tr>
        <td><a href="#" class=".mybook-img"><img src='{{fileurl}}'></a></td>
        <td><a href="#">{{title}}</a></td>
        <td>{{member}}</td>
        <td>{{member_id}}</td>
        <td>{{evaluate}}</td>
        <td>{{hit}}</td>
    </tr>
{{/each}}
    </script>
</body>

</html>
