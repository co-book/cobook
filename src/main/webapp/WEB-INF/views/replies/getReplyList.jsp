<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 




<c:forEach items="${replyList}" var="replyList" varStatus="status">
	<div class="media_list">
		<div class="media-left">
			<div class="detail-stars">
				<ul class="detail-ratings">
					<c:forEach var="i" begin="1" end="5" varStatus="statusCnt">
						<c:choose>
							<c:when test="${replyList.starRating>=statusCnt.current}">
								<!-- 별점  -->
								<li><a href="#"><i class="fa fa-star"
										aria-hidden="true"></i></a></li>
							</c:when>
							<c:when test="${replyList.starRating<statusCnt.current}">
								<li><a href="#"><i class="fa fa-star-o"
										aria-hidden="true"></i></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="#"><i class="fa fa-star-half-o"
										aria-hidden="true"></i></a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<br>
					<li>${replyList.nickName}</li>
					<br>
					<li><fmt:formatDate value="${replyList.reg_date}" pattern="yyyy-MM-dd"/> </li>
				</ul>
			</div>
		</div>
		<div class="media-body-single">
			<!-- reply delete -->
			<div class="single-reply-remove">
				<button type="button" id="reply-delete" class="reply-remove" data-reply_no="${replyList.reply_no}" data-member_no="${replyList.member_no}">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
				</button>
			</div>
			<br>
			<p>${replyList.contents}</p>
			<br>
			<div class="single-button" name="comment-btn" >
				<button type="button" class="btn btn-default btn-sm commentBtn" id="comment" data-parent_no="${replyList.reply_no}">
					<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
					댓글${replyList.commentCount}
				</button>
				<button type="button" class="btn btn-default btn-sm thumbs" id="thumbs" data-reply_no="${replyList.reply_no}">
					<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
					${replyList.likeCount}
				</button>
			</div>
			<!-- comment -->

			<div class="reply-comment" id="comment${replyList.reply_no}">
			
			</div>
		</div>
	</div>
			
</c:forEach>

<c:if test="${replyListCnt== 0}" >
<br/>
첫번째 댓글을 달아주세요!!
<br/>
</c:if>
<c:if test="${replyListCnt > (3*moreCnt) }">
							<div class="reply-more"  >
								<button type="button" id="moreCnt" class="btn-more" style="display:hide;">+ 더 보기</button>
							</div>
</c:if>