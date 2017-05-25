<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function(){

	//var cri = ${cri};
	
	var page = '${cri.page}';
	var perPageNum = '${cri.perPageNum}';
	var searchType = '${cri.searchType}';
	var keyword = '${cri.keyword}';
	endPage = '${pageMaker.endPage}'; 
	
	// 본문 링크 클릭
	$(".singleLink").on("click", function(){
		
		console.log("본문 링크 클릭");
		var review_no = $(this).attr("data-rno");
		var url = "/cobook/review/single?review_no="+review_no
				+"&page="+page+"&perPageNum="+perPageNum
				+"&searchType="+searchType+"&keyword="+keyword;
		
		$(location).attr("href", url);
		
	});
	
	
});
</script>
  <div role="tabpanel" class="tab-pane fade in active" id="home1" aria-labelledby="home1-tab">
  	<div class="wthree-news-top-left">
		<c:forEach items="${reviewList}" var="reviewList" varStatus="status">
			<div class="col-md-6 w3-agileits-news-left">
				<div class="col-sm-5 wthree-news-img">
					<a href="/cobook/review/single/${reviewList.REVIEW_NO}"><img src="${reviewList.COVERURL}" alt="" /></a>
				</div>
				<div class="col-sm-7 wthree-news-info">
					<h5><a href="news-single.html">${reviewList.TITLE}</a></h5>
					<p>${reviewList.CONTENTS}</p>
					<ul>
						<li><i class="fa fa-clock-o" aria-hidden="true"></i><fmt:formatDate value="${reviewList.REG_DATE}" pattern="yyyy/MM/dd"/></li>
						<li><i class="fa fa-eye" aria-hidden="true"></i>${reviewList.HIT}</li>
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
										<%-- <!-- 
											<div class="col-md-6 w3-agileits-news-left">
													<!-- 그림 -->
												<div class="col-sm-5 wthree-news-img">
													<a class="singleLink" data-rno='${vo.REVIEW_NO}' href="#"><img src="${vo.COVERURL}" alt="" /></a>
												</div>
												
												<!-- 제목 -->
												<div class="col-sm-7 wthree-news-info">
													<h5><a class="singleLink" data-rno='${vo.REVIEW_NO}' href="#">${vo.TITLE}</a></h5>
													<!-- 본문 내용 -->
													<p>${vo.CONTENTS}</p>
													<!-- 요일 / 조회수 -->
													<ul>
														<li><i class="fa fa-clock-o" aria-hidden="true"></i><fmt:formatDate value="${vo.REG_DATE}" pattern="yyyy-MM-dd"/></li>
														<li><i class="fa fa-eye" aria-hidden="true"></i>${vo.HIT}</li>
													</ul>
												</div>
												<div class="clearfix"> </div> --> --%>
	