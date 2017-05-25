<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="browse-inner">
<c:forEach items="${ebookList}" var="ebookList" varStatus="status"> 
<div class="col-md-2 w3l-movie-gride-agile">
		<a href="/cobook/ebook/single/${ebookList.ebook_no}" class="hvr-shutter-out-horizontal"><img
			src="${ebookList.coverURL}" title="album-name"
			alt=" " style="max-width: 182px; max-height:268px;" />
			<div class="w3l-action-icon">
				<i class="fa fa-play-circle" aria-hidden="true"></i>
			</div> </a>
		<div class="mid-1">
			<div class="w3l-movie-text">
				<h6>
					<a href="/cobook/ebook/single/${ebookList.ebook_no}">${ebookList.title}</a>
				</h6>
			</div>
			<div class="mid-2">

				<p>${ebookList.author}</p>
				<div class="block-stars">
					<ul class="w3l-ratings">
					<c:forEach var="i" begin="1" end="5" varStatus="statusCnt"> 
						   <c:choose>
						   		<c:when test="${ebookList.starAvg>=statusCnt.current}">  
						   			<!-- 별점  -->
						   			<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li> 
						   		</c:when>
						   		<c:when test="${ebookList.starAvg<statusCnt.current}">
									<li><a href="#"><i class="fa fa-star-o"	aria-hidden="true"></i></a></li>
						   		</c:when>
						   		<c:otherwise>
									<li><a href="#"><i class="fa fa-star-half-o"aria-hidden="true"></i></a></li>
						   		</c:otherwise>
						   </c:choose>
					</c:forEach>

					</ul>
				</div>
				<div class="clearfix"></div>
			</div>

		</div>
		<div class="ribben two">
			<p>NEW</p>
		</div>
	</div>

<c:if test="${status.count%6== 0 and status.count !=1}">
	<div class="clearfix"></div>
</div>
<!-- /latest-movies1 -->
<div class="browse-inner-come-agile-w3">
</c:if>

</c:forEach>
	<div class="clearfix"></div>
</div>
<br/>