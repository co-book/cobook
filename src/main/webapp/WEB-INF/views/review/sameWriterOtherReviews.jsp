<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h4>Related News</h4>
	<div class="wthree-news-top-left">
	 <c:forEach items="${list}" var="vo">
		<div class="col-md-6 w3-agileits-news-left">
			<div class="col-sm-5 wthree-news-img">
				<a href="/cobook/review/single?review_no=${vo.review_no}"><img src="${vo.coverurl}" alt="" /></a>
			</div>
			<div class="col-sm-7 wthree-news-info">
				<h5>
					<a href="/cobook/review/single?review_no=${vo.review_no}">
					${vo.title}
					</a>
				</h5>
				<p>${vo.contents}</p>
				<ul>
					<li><i class="fa fa-clock-o" aria-hidden="true"></i>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.reg_date}" /></li>
					<li><i class="fa fa-eye" aria-hidden="true"></i> ${vo.hit}</li>
				</ul>
			</div>
		
			<div class="clearfix"></div>
		</div>
		</c:forEach>
		<div class="clearfix"></div>
	</div>


</body>
</html>