<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


				
<div id="cycler">
	<c:forEach items="${list}" var="vo">
		<div class="date-text">
			<a href="/cobook/review/single/${vo.review_no}">
			${vo.ebookTitle} <span class="blinking"><img src="/cobook/resources/CoBookDesign/images/new.png" alt="" /></span>
			</a>
			<p>${vo.title} </p>
		</div>
	</c:forEach>
</div>
										
									
										
										