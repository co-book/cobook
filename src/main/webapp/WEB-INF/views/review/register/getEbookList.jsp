<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row placeholders">
<c:forEach items="${EbookList}" var="EbookList" varStatus="status">
			
	            <div class="col-xs-6 col-sm-3 my_ebook">
	              <a href="#">
	              	<img src="${EbookList.coverURL}">
	              	<h5>${EbookList.title}</h5>
	              	<span class="text-muted">${EbookList.author}</span>
	           	  </a>
	            </div>
	            <c:if test="${status.count%4 == 0}">
	 </div>
	 <div class="row placeholders">
				</c:if>

</c:forEach>
</div>