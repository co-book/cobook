<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호 변경페이지</h1>
<form action="/member/modifyPassword" method="POST">
이메일 : ${email}
변경할 비밀번호 : <input name="password" type="text" />
<input type="hidden" name="email" value="${email}">
<input type="submit" value="변경하기">
</form>
</body>
</html>