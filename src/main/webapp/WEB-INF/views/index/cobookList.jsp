<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- banner-bottom -->

	<div class="banner-bottom">
	<h4 class="latest-text w3_latest_text">월간 베스트셀러</h4>
		<div class="container">
			<div class="w3_agile_banner_bottom_grid">
				<div id="owl-demo" class="owl-carousel owl-theme">
					
					<c:forEach items="${monthlyList}" var="monthlyList" varStatus="status">
					<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="/cobook/ebook/single/${monthlyList.ebook_no}" class="hvr-shutter-out-horizontal">
							<img src="${monthlyList.coverURL}" class="img-responsive" style="width: 182px; height: 268px;" /></a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6><a href="sigle.jsp">${monthlyList.title}</a></h6>							
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>${monthlyList.author}</p>
									<div class="detail-stars">
										<ul class="detail-ratings">
											<c:forEach var="i" begin="1" end="5" varStatus="statusCnt">
												<c:choose>
													<c:when test="${monthlyList.starAvg>=statusCnt.current}">
														<!-- 별점  -->
														<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
													</c:when>
													<c:when test="${monthlyList.starAvg<statusCnt.current}">
														<li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
													</c:when>
													<c:otherwise>
														<li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
					</div>
				</c:forEach>
				
				</div>
			</div>			
		</div>
	</div>
	