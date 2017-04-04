<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="agile-news-table">
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

	<div class="w3ls-news-result">
		<h4>
			Search Results : <span>${fn:length(list)}</span>
		</h4>
	</div>
	<table id="table-breakpoint">
		<thead>
			<tr>
				<th>No.</th>
				<th>Book Name</th>
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
							src="/cobook/resources/CoBookDesign/images/n1.jpg" alt="" /> <span>${vo.TITLE}</span></a></td>
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
			<a id="lt" href="/cobook/mybook/list?page=${pageMaker.startPage - 1}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">&lt;</a>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
			varStatus="i">

				<c:if test="${i.count == cri.page}">
				${i.current}
				</c:if>
				<c:if test="${i.count != cri.page}">
				<a href="/cobook/mybook/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">${i.count}</a>
				</c:if>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<a id="gt" href="/cobook/mybook/list?page=${pageMaker.endPage + 1}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">&gt;</a>
		</c:if>



	</div>
</div>