<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> --%>
<!-- <button class="writeBtn">글쓰기</button> -->
<div class="agile-news-table">
	<%-- <div class="w3ls-news-result">
		<h4>
			Search Results : <span>${fn:length(list)}</span>
		</h4>
	</div>
	<table id="table-breakpoint">
		<thead>
			<tr>
				<th>No.</th>
				<th>책제목</th>
				<th>닉네임</th>
				<th>작성날짜</th>
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
	</table> --%>
	<div class="w3ls-news-result">
		<h4>Search Results : <span>${mybook.mybookCount}</span></h4>
	</div>
	<table id="table-breakpoint">
		<thead>
			<tr>
				<th>No.</th>
				<th>책제목</th>
				<th>닉네임</th>
				<th>작성날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${mybook.mybookList}" var="vo">
			<tr>
				<td>${vo.mybook_no}</td>
				<td class="w3-list-img"><a href="single.html"><img src="${vo.fileUrl}" alt="" /><span>${vo.title}</span> </a></td>
				<td class="w3-list-info" style="text-align: center;"><a href="genres.html">${vo.nickname}</a></td>
				<td class="w3-list-info" style="text-align: center;"><a href="comedy.html"><fmt:formatDate value="${vo.reg_date}" pattern="yyyy년 MM월 dd일" /></a></td>
				<td style="text-align: center;">${vo.hit}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	</div>