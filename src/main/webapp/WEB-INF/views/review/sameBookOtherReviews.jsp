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

	<div class="news-grids-bottom">
		<div class="top-news-grid">
			<c:forEach items="${list}" var="vo">
			<div class="top-news-grid-heading">
				<a href="/cobook/review/single?review_no=${vo.review_no}">${vo.title}</a>
			</div>
			<div class="w3ls-news-t-grid top-t-grid">
				<ul>
					<li><a href="#"><i class="fa fa-clock-o"></i><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.reg_date}" />
					</a>
					</li>
					<li><a href="#"><i class="fa fa-user"></i>${vo.nickname}</a></li>
				</ul>
			</div>
			</c:forEach>
		</div>

	</div>

</body>
</html>