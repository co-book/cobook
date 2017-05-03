<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
				<button type="button" id="reply-delete" class="reply-remove" onclick="deleteReply(${replyList.reply_no})">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
				</button>
			</div>
			<br>
			<p>${replyList.contents}</p>
			<br>
			<div class="single-button" name="comment-btn" >
				<button type="button" class="btn btn-default btn-sm" id="comment" onclick="commentVisible(${replyList.reply_no}, this)">
					<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
					댓글(${replyList.commentCount})
				</button>
				<button type="button" class="btn btn-default btn-sm" id="thumbs">
					<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
					${replyList.likeCount}
				</button>
			</div>
			<!-- comment -->

			<div class="reply-comment" id="reply-comment">
				<div id="comment${replyList.reply_no}">
					<div class="comment-up" id="comment-up">
						<p>흐라발의 매력에 퐁당퐁당 내맘을 받아줭!</p>
						<!-- comment-delete -->
						<p>
							nam*** /2017-04-03/ <a id="comment-delete">삭제</a>
						</p>
					</div>
					<div class="comment-up" id="comment-up">
						<p>흐라발의 매력에 퐁당퐁당 내맘을 받아줭!</p>
						<!-- comment-delete -->
						<p>
							nam*** /2017-04-03/ <a id="comment-delete">삭제</a>
						</p>
					</div>

			 <!--<div class="reply-comment" id="reply-comment">
				<div class="comment-up" id="comment-up">
					<p>흐라발의 매력에 퐁당퐁당 내맘을 받아줭!</p>
					comment-delete
					<p>
						nam*** /2017-04-03/ <a id="comment-delete">삭제</a>
					</p>
				</div>
				<textarea class="comment-textarea" rows="5" id="comment-area"
					placeholder="이 곳에 댓글을 남겨주세요"></textarea>
				<button type="button" class="comment-regi" id="addComment">등록하기</button>
			</div> -->
		</div>
	</div>
</c:forEach>
