<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ����</title>
<link href="/cobook/resources/CoBookDesign/css/bootstrap.css?ver=3" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js"></script>
<link href="/cobook/resources/CoBookDesign/css/member-modify.css?ver=3" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
	      <form class="form-signin">
	        <h2 class="form-signin-heading">${modify.email}ȸ������ ����</h2>
	        <label for="inputEmail" class="sr-only">�г���</label>
	        <input type="text" id="inputEmail" class="form-control" placeholder="�г���" required autofocus>
	        <label for="inputPassword" class="sr-only">��й�ȣ</label>
	        <input type="password" id="inputPassword" class="form-control" placeholder="��й�ȣ" required>
	        <div class="checkbox">
	          <label>
	            <input type="checkbox" value="remember-me"> Remember me
	          </label>
	        </div>
	        <button class="btn btn-lg btn-primary btn-block" type="submit">�����ϱ�</button>
	      </form>
	
	    </div> <!-- /container -->
</body>
</html>