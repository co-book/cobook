<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <div class="news-grids-bottom">
  								
									<div class="top-news-grid">
									<c:forEach items="${replies}" var="vo">
										<div class="top-news-grid-heading">
											<a href="/review/single?review_no=${vo.BOARD_NO}&reply_no=${vo.REPLY_NO}">${vo.CONTENTS}</a>
										</div>
										<div class="w3ls-news-t-grid top-t-grid">
											<ul>
												<li><a href="#"><i class="fa fa-clock-o"></i> <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.REG_DATE}" /></a></li>
												<li><a href="#"><i class="fa fa-user"></i>${vo.NICKNAME}</a></li>
											</ul>
										</div>
									</c:forEach>
									</div>
									
</div>