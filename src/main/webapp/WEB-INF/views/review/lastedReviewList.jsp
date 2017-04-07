<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


				
    									<div id="cycler">
    									<c:forEach items="${list}" var="vo">
											<div class="date-text">
												<a href="/review/single?review_no=${vo.review_no}">${vo.title}</a>
												<p>${vo.ebook_title}</p>
											</div>
										</c:forEach>
										</div>
										
									
										
										