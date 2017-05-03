<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- comment -->
<c:forEach items="commentList" var="commentList" varStatus="status">
				<div class="comment-up" id="comment-up">
						<p>${commentList.contents}</p>
						<!-- comment-delete -->
						<p>
							${commentList.nickName}/<fmt:formatDate value="${commentList.reg_date}" pattern="yyyy-MM-dd"/>/ <a id="comment-delete">삭제</a>
						</p>
				</div>
</c:forEach>
				<textarea class="comment-textarea" rows="5" id="comment-area" placeholder="이 곳에 댓글을 남겨주세요"></textarea>
				<button type="button" class="comment-regi" id="addComment">등록하기</button>
			