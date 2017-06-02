<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<div class="row placeholders">
<c:forEach items="${myBorrowList}" var="myBorrowList" varStatus="status">
			
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="${myBorrowList.coverURL}">
	              <div class="remainDays"><p>60일</p></div>
	              <h5>${myBorrowList.title}</h5>
	              <span class="text-muted">${myBorrowList.author}</span>
	            </div>
	            
	            <c:if test="${status.count%4 == 0}">
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
	            </div>
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="${myBorrowList.coverURL}">
	              <div class="remainDays"><p>60일</p></div>
	              <h5>${myBorrowList.title}</h5>
	              <span class="text-muted">${myBorrowList.author}</span>
	            </div>
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="${myBorrowList.coverURL}">
	              <div class="remainDays"><p>60일</p></div>
	              <h5>${myBorrowList.title}</h5>
	              <span class="text-muted">${myBorrowList.author}</span>
	            </div>
	          
	          <div class="row placeholders">
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="${myBorrowList.coverURL}">
	              <div class="remainDays"><p>60일</p></div>
	              <h5>${myBorrowList.title}</h5>
	              <span class="text-muted">${myBorrowList.author}</span>
	            </div>
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="${myBorrowList.coverURL}" >
	              <div class="remainDays"><p>60일</p></div>
	              <h5>${myBorrowList.title}</h5>
	              <span class="text-muted">${myBorrowList.author}</span>
	            </div>
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="${myBorrowList.coverURL}">
	              <div class="remainDays"><p>60일</p></div>
	              <h5>${myBorrowList.title}</h5>
	              <span class="text-muted">${myBorrowList.author}</span>
	            </div>
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <img src="${myBorrowList.coverURL}">
	              <div class="remainDays"><p>60일</p></div>
	              <h5>${myBorrowList.title}</h5>
	              <span class="text-muted">${myBorrowList.author}</span>
	            </div>
	          </div>	 --%>
</c:forEach>
</div>