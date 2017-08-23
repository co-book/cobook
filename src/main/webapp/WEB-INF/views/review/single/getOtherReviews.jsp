<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review</title>
</head>
<body>

	<div class="news-grids-bottom">
		<div class="top-news-grid">
			<c:forEach items="${otherReviews}" var="review">
			<div class="top-news-grid-heading">
				<a class='OtherReviewTitle' href="/cobook/review/single/${review.review_no}">${review.title}</a>
			</div>
			
			<div class="w3ls-news-t-grid top-t-grid">
				<p class='OtherReviewContent'>${review.contents}</p>
				<ul>
					<li><a href="#"><i class="fa fa-clock-o"></i><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${review.reg_date}" />
					</a>
					</li>
					<li><a href="#"><i class="fa fa-user"></i>${review.nickname}</a></li>
					
					<li><a href="#"><i class="fa fa-eye" ></i> ${review.hit}</a></li>
				</ul>
			</div>
			</c:forEach>
		</div>

	</div>

</body>
</html>