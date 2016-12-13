<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
    $(function(){
        var boardno = 1;
        var i = 0;
        getAllList(boardno);
        $("#addReply").on("click", function(){
              var user_id = $("#user_id").val();
              var replycont = $("#replycont").val();
              var reparent = boardno;
              var redepth = 0;
              var reorder = 1;

              $.ajax({
                      type: 'post',
                      url:"/replies/",
                      headers : {
                    	"Content-Type" : "application/json",
  						"X-HTTP-Method-Override" : "POST"
                      },
                      dataType : 'text',
                      data : JSON.stringify({
                            boardno : boardno,
                            replycont : replycont,
                            reparent : reparent,
                            redepth : redepth,
                            reorder : reorder,
                            user_id : user_id

                      }),
                      success : function(result){
                          getAllList(boardno);
                      }

              });

        });

        $("#replies").on("click", ".replyLi button", function(){
    	 	
      	  var textarea = $(this).parent().next();
      	  var commentBtn = textarea.next();
      	  console.log(textarea);
      	  console.log(commentBtn);
      	  
      	  if(i % 2 === 0){
      		  textarea.attr("style", "display:inline")
      		  commentBtn.attr("style", "display:inline");
      		  i++;
      	  }else{
      		  textarea.attr("style", "display:none")
      		  commentBtn.attr("style", "display:none");
      		  i++;
      	  }
      		
        });
        
         $("#replies").on("click", ".commentBtn", function(){
        	var replyLi = $(this).prev().prev();
        	var replycont = $(this).prev().val();
        	var reparent = replyLi.attr("data-reparent");
        	var redepth = Number(replyLi.attr("data-redepth")) + 1;
        	var reorder = replyLi.attr("data-reorder");
			var user_id = '갑동이';
			
        	  $.ajax({
        		
        		type:"post",
        		url:"/replies/comment",
        		headers : {
                "Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
                },
        		dataType:'text',
        		data:JSON.stringify({
        			 boardno : boardno,
                     replycont : replycont,
                     reparent : reparent,
                     redepth : redepth,
                     reorder : reorder,
                     user_id : user_id
        		}),
        		success:function(result){
        		
        			getAllList(boardno);
        		}
        		
        	});  
         
  		  });
         
    });
    </script>
<script>
function getAllList(boardno){
 
  $.getJSON("/replies/" + boardno, function(data){
      
	  var reply_temp = $("#reply-template").html();
      var template = Handlebars.compile(reply_temp);
      var reply_html = template(data);
      $("#replies").html(reply_html);
      
      
      
  });
  

}

Handlebars.registerHelper("redepthCheck", function(redepth){
	
	if(redepth > 0){
		return 'style=margin-left:'+ redepth * 50 +'px;';
	}
	
});
</script>
<script id="reply-template" type="text/x-handlebars-template">
{{#each .}}

<li class='replyLi' {{redepthCheck redepth}} data-reparent='{{reparent}}' data-replyno='{{replyno}}' 
	data-redepth='{{redepth}}' data-reorder='{{reorder}}'>
  {{replyno}}:{{replycont}}
   		<button>답글달기</button></li>
        <textarea class='reply_comment' style='display:none'></textarea><button class='commentBtn' style='display:none'>댓글입력</button>

{{/each}}
</script>
  </head>
  <body>
    <h1>댓글 테스트</h1>

        <div class="">
      <p>아이디&nbsp;<input type="text" id="user_id" name="user_id" value=""></p>
      <p>댓글내용&nbsp;<input type="text" name="replycont" id="replycont"></p>
      <p><button type="button" name="button" id="addReply">댓글달기</button></p>
    </div>

    <div id="replies">

    </div>

  </body>
</html>
