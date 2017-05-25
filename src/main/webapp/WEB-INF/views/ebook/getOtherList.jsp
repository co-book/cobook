<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<c:forEach items="${otherList}" var="otherList" varStatus="status">
							<div class="single-right-grids">
								<div class="col-md-4 single-right-grid-left">
									<a href="/cobook/ebook/single/${otherList.ebook_no}"><img
										src="${otherList.coverURL}" alt="" /></a>
								</div>
								<div class="col-md-8 single-right-grid-right">
									<a href="/cobook/ebook/single/${otherList.ebook_no}" class="title"> ${otherList.title }</a>
									<p class="author">
										By <a href="#" class="author">${otherList.author }</a>
									</p>
									<!-- <p class="views">2,114,200 views</p> -->
								</div>
								<div class="clearfix"></div>
							</div>
</c:forEach>
