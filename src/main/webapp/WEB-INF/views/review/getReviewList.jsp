<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <div role="tabpanel" class="tab-pane fade in active" id="home1" aria-labelledby="home1-tab">
  	
  	<div class="wthree-news-top-left">
		<c:forEach items="${reviewList}" var="reviewList" varStatus="status">
			<div class="col-md-6 w3-agileits-news-left">
				<div class="col-sm-5 wthree-news-img">
					<a href="/cobook/review/single/${reviewList.review_no}"><img src="${reviewList.coverurl}" alt="" /></a>
				</div>
				<div class="col-sm-7 wthree-news-info">
					<h5 class="reviewTitle"><a href="news-single.html">${reviewList.title}</a></h5>
					<p class="reviewContent">${reviewList.contents}</p>
					<ul class="nickname">
					  <li><span class="glyphicon glyphicon-user" aria-hidden="true"></span>${reviewList.nickname}</li>
					</ul>
					<ul>
						<li><i class="fa fa-clock-o" aria-hidden="true"></i><fmt:formatDate value="${reviewList.reg_date}" pattern="yyyy/MM/dd"/></li>
						<li><i class="fa fa-eye" aria-hidden="true"></i>${reviewList.hit}</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			
	<c:if test="${status.count%2==0}">
			<div class="clearfix"> </div>
		</div>
		<div class="wthree-news-top-left">
	</c:if>						
		</c:forEach>
	</div>
  </div>
  <c:if test="${reviewListCnt > (2*moreCnt)}">
	<button id="moreCnt" class="moreCntReview">+ 더 보기</button>
  </c:if>
									