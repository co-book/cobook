<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$(function() {
		// 글작성 버튼처리
		$("#write").on("click", function() {
			var url = "/cobook/sample/Rregister";
			$(location).attr('href', url);
		});

		$('#searchBtn').on(
				"click",
				function(event) {

					self.location = "/cobook/sample/reviewList"
							+ '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val()
							+ "&keyword=" + $('#keywordInput').val();

				});

		
		
		
	});
</script>


<style>
#pageLink {
	margin: 5px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 Sample</title>
</head>
<body>
	<%-- <select name="searchType">
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
	</select>
	<input type="text" name='keyword' id="keywordInput"
		value='${cri.keyword }'>
	<button id="searchBtn">검색</button> --%>
	<button id="write">글쓰기</button>
	<table>
		<thead>
			<tr>
				<th>No</th>
				<th>BookName</th>
				<th>날짜</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>평점</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.REVIEW_NO}</td>
					<td class="w3-list-img"><a
						href="/cobook/sample/Rsingle?review_no=${vo.REVIEW_NO}&page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">
							<img src="${vo.COVERURL}" alt="" /> <span>${vo.TITLE}</span>
					</a></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${vo.REG_DATE}" /></td>
					<td>${vo.NICKNAME}</td>
					<td>${vo.HIT}</td>
					<td>${vo.EVALUATE}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	<div id="paging">
		<c:if test="${pageMaker.prev}">
			<a id="lt" href="${pageMaker.makeSearch(pageMaker.startPage - 1)}">&lt;</a>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
			varStatus="i">

			<c:choose>
				<c:when test="${cri.page == i.current}">
						${i.current}
					</c:when>
				<c:otherwise>
					<a id="pageLink" href="${pageMaker.makeSearch(i.count)}">${i.count}</a>
				</c:otherwise>
			</c:choose>

		</c:forEach>
		<c:if test="${pageMaker.next}">
			<a id="gt" href="${pageMaker.makeSearch(pageMaker.endPage + 1)}">&gt;</a>
		</c:if>



	</div>
</body>
</html>