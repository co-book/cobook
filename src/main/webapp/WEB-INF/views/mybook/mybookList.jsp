<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    <div class="agile-news-table">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

									<div class="w3ls-news-result">
										<h4>Search Results : <span>${size}</span></h4>
									</div>
									<table id="table-breakpoint">
										<thead>
										  <tr>
											<th>No.</th>
											<th>Book Name</th>
											<th>날짜</th>
											<th>작성자</th>
											<th>조회수</th>
										  </tr>
										</thead>
										<tbody>
										 <c:forEach items="${list}" var="vo">
										  <tr>
											<td>${vo.MYBOOK_NO}</td>
											<td class="w3-list-img"><a href="#"><img src="resources/CoBookDesign/images/n1.jpg" alt="" /> <span>${vo.TITLE}</span></a></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.REG_DATE}" /></td>
											<td>${vo.NICKNAME}</td>
											<td>${vo.HIT}</td>
										  </tr>
										</c:forEach>
										</tbody>
									</table>
								</div>