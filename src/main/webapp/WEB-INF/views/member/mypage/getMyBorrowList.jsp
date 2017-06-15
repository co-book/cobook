<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<div class="row placeholders">
<c:forEach items="${myBorrowList}" var="myBorrowList" varStatus="status">
			
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="${myBorrowList.coverURL}">
	              <div class="remainDays"><p><fmt:parseNumber value="${myBorrowList.remainDate}" integerOnly="true"/>일</p></div>
	              <h5>${myBorrowList.title}</h5>
	              <span class="text-muted">${myBorrowList.author}</span>
	            </div>
	            
	             <c:if test="${status.count%4 == 0}"> <!-- 줄바꿈이래 -->
</div>

 <div class="row placeholders">
				 </c:if>
	            
	            <%-- 
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="/cobook/resources/test/kaf.jpg" >
	              <div class="remainDays"><p>60일</p></div>
	              <h5>${myBorrowList.title}</h5>
	              <span class="text-muted">${myBorrowList.author}</span><br>
	              <!-- <span class="remain-date">2017.01.23 ~ 2018.01.22까지</span> -->
	          
	          	 --%>
</c:forEach>
 </div> 

<c:if test="${borrowListCnt== 0}" >
<br/>
구매/대여하신 책이 없습니다.
<br/>
</c:if>
<c:if test="${borrowListCnt > (4*moreCnt)+4 }">
							<!-- <div class="reply-more"  > -->
								<!-- <button type="button" id="moreCnt" class="btn-more" style="display:hide;">+ 더 보기</button> -->
								<!-- <button id="moreCnt" class="ebook-more"><span class="glyphicon glyphicon-plus-sign"></span> 대여한 ebook 더보기</button> -->
								<a id="moreCnt" class="ebook-more"><span class="glyphicon glyphicon-plus-sign"></span> 대여한 ebook 더보기</a>
							<!-- </div> -->
</c:if>