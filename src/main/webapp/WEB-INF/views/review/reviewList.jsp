<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(function(){

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
									<c:forEach items="${list}" var="vo">
										<h1>${vo.REVIEW_NO}</h1>
										<div class="wthree-news-top-left">
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
												<div class="clearfix"> </div>
											</div>
											<div class="col-md-6 w3-agileits-news-left">
												<div class="col-sm-5 wthree-news-img">
													<a href="news-single.html"><img src="resources/CoBookDesign/images/m2.jpg" alt="" /></a>
												</div>
												<div class="col-sm-7 wthree-news-info">
													<h5><a href="news-single.html">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a></h5>
													<p>Sed tristique mattis fermentum. Etiam semper aliquet massa, id tempus massa mattis eget.</p>
													<ul>
														<li><i class="fa fa-clock-o" aria-hidden="true"></i> 24/09/2016</li>
														<li><i class="fa fa-eye" aria-hidden="true"></i> 2642</li>
													</ul>
												</div>
												<div class="clearfix"> </div>
											</div>
											<div class="clearfix"> </div>
										</div>
									</c:forEach>
										
									
									</div>