<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script>
	$(function(){
		var obj = {"hi" : "1", "arr" : "2", "what" : "3", "err" : "4", "zone":"5", "wrr" :"6"};
			
		var testHtml = $("#test").html();
		var template = Handlebars.compile(testHtml);
		var html = template(obj);
		$("#root").html(html);
		
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>핸들바 테스트</title>
</head>
<body>
	<div id="root"></div>
	

<script id="test" type="text/x-handlebars-template">
{{#each .}}
<ul>
		<li>{{@index}} : {{this}}</li>
	
	</ul>	
{{/each}}
</script>

</body>
</html>