<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="agile-news-table">
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<button class="writeBtn">글쓰기</button>
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
						href="/cobook/sample/mSingle?mybook_no=${vo.MYBOOK_NO}&page=${cri.page}&perPageNum=${cri.perPageNum}"><img
							src="${vo.FILEURL}" alt="" /> <span>${vo.TITLE}</span></a></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${vo.REG_DATE}" /></td>
					<td>${vo.NICKNAME}</td>
					<td>${vo.HIT}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<nav>
		<ul class="pagination">
			<!-- 이전 -->
			<li><c:if test="${pageMaker.prev}">
					<a
						href="/cobook/mybook/list?page=${pageMaker.startPage - 1}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a>
				</c:if></li>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				varStatus="i">

				<c:choose>
					<c:when test="${cri.page == i.current}">
						${i.current}
					</c:when>
					<c:otherwise>
						<a id="pageLink" href="/cobook/mybook/list?page=${i.count}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">${i.count}</a>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li><a
					href="/cobook/mybook/list?page=${pageMaker.endPage + 1}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>
</div>
