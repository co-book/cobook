<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<style>
div.img {
    border: 1px solid #ccc;
}

div.img:hover {
    border: 1px solid #777;
}

div.img img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 15px;
    text-align: center;
}

* {
    box-sizing: border-box;
}

.responsive {
    padding: 0 6px;
    float: left;
    width: 24.99999%;
}

@media only screen and (max-width: 700px){
    .responsive {
        width: 49.99999%;
        margin: 6px 0;
    }
}

@media only screen and (max-width: 500px){
    .responsive {
        width: 100%;
    }
}

.clearfix:after {
    content: "";
    display: table;
    clear: both;
}
</style>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>


<script>
$(document).ready(function(){
$('#click').click(function(event) {
	console.log("ok");
	$.ajax({
		type : "POST",
		url : 'ebook/getEbookList',
		dataType : 'json',
		cache : false,
		processData : false, 
		contentType : false,
		success : function(data) {
			var html="";
			for(var i=0;i<data.length;i++ ){
				console.log(data[i]);
				console.log(data[i].author);
				html+= 
					
				"<div class='responsive'>"+
				  "<div class='img'>"+
				   " <a target='_blank' href='"+data[i].cover+"'>"+
				    "  <img src='"+data[i].cover+"' alt='Forest' width='600' height='400'>"+
				  "  </a>"+
				  "  <div class='desc'>"+data[i].title+" ["+data[i].author+"] </div> "+
				 " </div>"+
				"</div>";

			}
			$('#ebookList').append(html);
		}
	});
});
function test2() {

	$.ajax({
		url : '/ebook/getEbookList',
		type : 'post',
		data : {
			test : "asda"
		},
		dataType : 'text',
		success : function(result) {

		}
	});
}	
});
	
</script>
</head>
<title>Home</title>
<body>
<button class ="click" id="click">리스트</button>
<div id="ebookList" >

</div>
</body>
</html>
