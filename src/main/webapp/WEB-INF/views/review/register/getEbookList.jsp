<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${EbookList}" var="EbookList" varStatus="status">
			
	            <div class="col-xs-6 col-sm-3 my_ebook">
	            	<a href="#">
	              		<img src="${EbookList.coverURL}">
	              		<h5>${EbookList.title}</h5>
	              		<span class="text-muted">${EbookList.author}</span>
	           	  	</a>
	           	
	           	<!-- ebook_no  -->
	 			<input type='hidden' class='select_ebook_no' name='ebook_no' value='${EbookList.ebook_no}'/>
	           	 	
	            <!-- Ebook 상세정보  -->
	           	 	<div class="ebook_detail" style="display:none;">
	           	 	<input type='hidden' name='ebook_no' value='${EbookList.ebook_no}'/>
	           	 				<div class="grid images_3_of_2">
				
									<img src="${EbookList.coverURL}" alt="" />
								</div>
								<div class="desc span_3_of_2">
									<h2>${EbookList.title}</h2>
									<p>${EbookList.author}| ${EbookList.translator}</p>

									<div class="detail-stars">
										<ul class="detail-ratings">
										<c:forEach var="i" begin="1" end="5" varStatus="statusCnt">
												<c:choose>
													<c:when test="${EbookList.starAvg>=statusCnt.current}">
														<!-- 별점  -->
														<li><a href="#"><i class="fa fa-star"
																aria-hidden="true"></i></a></li>
													</c:when>
													<c:when test="${EbookList.starAvg<statusCnt.current}">
														<li><a href="#"><i class="fa fa-star-o"
																aria-hidden="true"></i></a></li>
													</c:when>
													<c:otherwise>
														<li><a href="#"><i class="fa fa-star-half-o"
																aria-hidden="true"></i></a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<li class="starAvg">${EbookList.starAvg}점| (${EbookList.starCount}명)</li>									
										</ul>
									</div>
									<br> <br>
									<div class="price">
										<p>
											대여가: <span id="price"><fmt:formatNumber
													value="${EbookList.price}" pattern="##,###" /></span><a class="starAvg">원</a>
										</p>
									</div>

									<div class="available">
										<ul>
											<li><span>도서정보:</span> &nbsp;${EbookList.publisher} | 
											<fmt:formatDate	value="${EbookList.publishedDate}" pattern="yyyy년 MM월 dd일" /> | ${EbookList.fileType} | ${EbookList.fileSize}</li>
											<li><span>지원기기:</span>&nbsp; Android | ios | PC | Mac</li>
											<li><span>듣기가능:</span>&nbsp; <c:choose>
													<c:when test="${EbookList.listening==1}">
																듣기가능
															</c:when>
													<c:otherwise>
																듣기없음
															</c:otherwise>
												</c:choose></li>
										</ul>
									</div>
									
									<div class="wish-list">
												<ul>
													<li class="wish"><a href="#" class="select_can">선택 취소</a></li>
													<!-- <li class="compare"><a href="#">Add to Compare</a></li> -->
												</ul>
									</div>
								</div> 
	            	</div>
	              	<!--ebook 상세정보 -->
	            </div>
	<c:if test="${status.count%4 == 0}">
	 		</div>
			<div class="row placeholders">
	</c:if>

</c:forEach>