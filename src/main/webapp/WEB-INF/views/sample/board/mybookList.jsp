<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<script>
$(function(){
	
	/* $("#paging").on("click", "#pageLink", function(event){
		event.preventDefault();
		
		
		
	}); */
	
	
});


</script>


<style>
#pageLink{
margin:5px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 Sample</title>
</head>
<body>

	<table>
		<thead>
			<tr>
				<th>No</th>
				<th>BookName</th>
				<th>날짜</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.MYBOOK_NO}</td>
					<td class="w3-list-img"><a
						href="/mybook/single?mybook_no=${vo.MYBOOK_NO}&page=${cri.page}&perPageNum=${cri.perPageNum}"><img
							src="${vo.FILEURL}" alt="" /> <span>${vo.TITLE}</span></a></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${vo.REG_DATE}" /></td>
					<td>${vo.NICKNAME}</td>
					<td>${vo.HIT}</td>
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
			<a id="gt" href="${pageMaker.endPage + 1}">&gt;</a>
		</c:if>



	</div>
</body>
</html>