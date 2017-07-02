<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Co-Book</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>

						<!-- //for-mobile-apps -->
<link href="/cobook/resources/CoBookDesign/css/bootstrap.css?ver=4" rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/login.css?ver=1" rel="stylesheet" type="text/css" media="all"/>
<link href="/cobook/resources/CoBookDesign/css/style.css?ver=3" rel="stylesheet" type="text/css" media="all" />
<link href="/cobook/resources/CoBookDesign/css/medile.css?ver=1" rel='stylesheet' type='text/css' />
<link href="/cobook/resources/CoBookDesign/css/single.css?ver=6" rel='stylesheet' type='text/css' />
<link href="/cobook/resources/CoBookDesign/css/review-resiter-style.css?ver=13" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/contactstyle.css" type="text/css" media="all" />
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/font-awesome.min.css" />
						<!--별점 css -->
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/star-rating-bookreview.css?ver=4" media="all" type="text/css" />
<link rel="stylesheet" href="/cobook/resources/CoBookDesign/css/star-theme.css?ver=10" media="all" type="text/css" />
						<!-- js -->
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/jquery-2.1.4.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>//js -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/move-top.js"></script>
<script type="text/javascript" src="/cobook/resources/CoBookDesign/js/easing.js"></script>
						<!-- 별점 js -->
<script src="/cobook/resources/CoBookDesign/js/star-rating.js?ver=8" type="text/javascript"></script>
<script src="/cobook/resources/CoBookDesign/js/star-theme.js?ver=5" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- <link href="/cobook/resources/test/mypage.css?ver=3" rel="stylesheet" type="text/css">
 --><!-- start-smoth-scrolling -->
<script src="/cobook/resources/editor/dist/summernote.js"></script>
<script src="/cobook/resources/editor/dist/lang/summernote-ko-KR.js"></script>
<script src="/cobook/resources/js/editorFunction.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script type="text/javascript">
	jQuery(document).ready(function($) {
		var ebook_no=null;
		//책선택하기 이벤트 설정
		var ebookSelectFunction = function(){
			//책선택 이벤트
			$('.my_ebook').click(function(){
				//선택한 Ebookno 저장
				ebook_no=$(this).children('.select_ebook_no').val();
				//선택한 Ebook의 데이터를 화면에 띄워줌
				$('#select_ebook').html($(this).children('.ebook_detail').html());
				//ebook선택모달 Close
				$("#searchEbookModal").modal('hide');
				
				
				//이벤트 부여 
				//선택취소하기 이벤트
				 $(".select_can").click(function(){
					 //ebook_no 초기화
					 ebook_no=null;
					 //이미지 선택 화면 출력
				 	 var inithtml = "<div class='grid images_3_of_2'>" +
										"<div id='searchEbook' class='imgdiv'>" + 
											"<a href='#'>"+
												"<span class='glyphicon glyphicon-plus-sign'  aria-hidden='true'></span>"+
											"</a>"+
										"</div>"+
									"</div>"+
									"<div class='desc span_3_of_2'>"+
										"<h2>리뷰할 책을 선택하여주세요!</h2>"+
									"</div> ";
				 	 $('#select_ebook').html(inithtml);
						//책선택 모달 Open
					 $("#searchEbook").click(function () {
						$("#searchEbookModal").modal();
					 });
				 });
			});
			
		}
		//Ebook 검색 결과 리스트 가져오기
		var getEbookList = function(search){
			$.ajax({
				type : "GET",
				url : '/cobook/review/register/getEbookList',
				data :  {"search":search } ,
				contentType : "application/json;charset=UTF-8",
				dataType : 'html',
				success : function(data) {
					//모달에 Ebook List 띄워줌
					$('#ebookList').html(data);
					//책선택 이벤트 설정
					ebookSelectFunction();
				}
			});
		} 
		
		
		//summerNote적용
		callSummernote();
		
		//모달창 기본값 받아오기 
		getEbookList('');
		
		//책선택 모달 Open
		$("#searchEbook").click(function () {
			$("#searchEbookModal").modal();
		});
		
		//검색모달 - 검색화면에서 떠나면 실행 (책검색)
		$('#searchText').change(function(){
			getEbookList($('#searchText').val());
		})
		
		//검색 모달 - 검색 버튼 클릭시
		$("#search").click(function(){
			getEbookList($('#searchText').val());
		});
		
		 $("#registerBtn").click(function(){
			 var uploadFiles = new Array();
			 $(".uploadfiles").each(function(idx){  
				 uploadFiles[idx] = $(".uploadfiles:eq(" + idx + ")").val();
			 });
			 
			 
			 
			 
			 if(member_no==null){
				 alert("로그인후 사용해주세요");
				 return;
			 }
			 if(ebook_no==null){
				 alert("책을 선택하여 주세요");
				 return;
			 }
			 //글 내용 빈칸 처리
			 var contents = $('#summernote').val();
			 if(contents==""){
				 alert("내용을 입력하세요");
				 return;
			 }
			 
			 //event.preventDefault();
			 //$("#registerForm").submit();
			 
			 console.log("member_no : " + member_no);
			 console.log("ebook_no : " + ebook_no);
			 console.log("title :"+$('#title').val());
			 console.log("star : "+ $('#starRating').val());
			 console.log("content : " + $('#summernote').val());
			 console.log("filse :" +uploadFiles.toString());
		 
			 $.ajax({
					type : "POST",
					url : '/cobook/review/register',
					data : JSON.stringify({		
						"ebook_no": ebook_no,
			  			"member_no" : member_no,
			  			"title":$('#title').val(),
			  			"contents":  $('#summernote').val(),
						"evaluate":$('#starRating').val(),
						"files" : uploadFiles
					}), 
					 
					contentType : "application/json;charset=UTF-8",
					dataType : 'json',
					success : function(data) {  
						console.log(data);
						if(data==true){
							//해당 싱글페이지로 이동해야함
							// location.replace("이동할 주소");
							alert("성공");
							console.log("성공");
						}else{
							alert("실패하였습니다. 다시 시도하여 주세요");
						}
					}
			}); 
			 
				 

		});
 
		
		
		
	});

</script>
<!-- start-smoth-scrolling -->
<link href="/cobook/resources/CoBookDesign/css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<script src="/cobook/resources/CoBookDesign/js/owl.carousel.js"></script>
</head>
<body>
	
	<!-- header login, wishList, navibar start -->
	<c:import url="/WEB-INF/views/header.jsp" charEncoding="UTF-8">
		<c:param name="loginId" value="loginId" />
	</c:import>
	<!-- //bootstrap-pop-up -->


	<!-- single -->
<form id="registerForm">
	<input type="hidden" name="member_no" value="${member.member_no}" />
	
	<div class="single-page-agile-main">
		<div class="container">
			<!-- /w3l-medile-movies-grids -->
			<div class="agileits-single-top">
				<ol class="breadcrumb">
					<li><a href="/cobook/review">책 리뷰</a></li>
					<li class="title-input-li" style="width:94%;">
					<input id ="title" class="title-input" type="text" name="title" placeholder="제목" required="" style="width:94%;">
					</li>
				</ol>
			</div>

			<div class="single-page-agile-info">

				<!-- /movie-browse-agile -->
				<div class="show-top-grids-w3lagile">
					<div class="single-left">
						<div class="section group">
							<!-- <div class="cont-desc span_1_of_2"> -->
							<div class="product-details">

								<div id="select_ebook">
						
								 	<div class="grid images_3_of_2">
								 
										<div id="searchEbook" class="imgdiv">
											<a href="#">
												<span class="glyphicon glyphicon-plus-sign"  aria-hidden="true"></span>
											</a>
										</div>
									
									</div>
									<div class="desc span_3_of_2">
										<h2>리뷰할 책을 선택하여주세요!</h2>
									</div> 
								</div>
								<div class="clear"></div>
							</div> <!-- product detail -->
								

								<div class="all-comments">
									<div class="product_desc">
										<h2><a>${member.nickname}</a>의 별점은 :</h2>
										<input type="text" id="starRating" class="kv-fa rating-loading" value="4" data-size="lg" title="" required=""/> <br/>
										<p><textarea id='summernote' name="contents" rows="" cols="" required=""></textarea></p>
										<ul id = 'files' class="list-group">   첨부파일</ul>
									</div>
								</div>
								<div class="clear"></div>
							</div>
		
							
							
						</div>

					</div>
					<div class="button registerBtn"  ><!-- 
						<button id="registerBtn"  type="submit"  class="borrow-button">체크</button> -->
						<input id="registerBtn"  type="button" name="Submit" type="submit"  class="borrow-button" value="글쓰기" onclick="">
						<!-- <input type="submit" value="대여하기" class="borrow-button">  -->
					</div>
					<div class="clearfix"></div>
				</div>

			</div>
		</div>
	</div>
</form>

				<!-- modal -->
									 <div id="searchEbookModal" class="modal fade"  role="dialog">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header-single">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h3 class="modal-title member-nickname">리뷰할 도서를 선택하세요! </h3>
												</div>
												<div class="modal-body">
													<div class="modal_search">
														<span class='green_window'>
															<input id='searchText' type='text' class='input_text' />
														</span>	
														<a href="#">
															<span id="search" class="glyphicon glyphicon-search"  aria-hidden="true"></span>
														</a>
													</div>	
													<div id="ebookList" class="row placeholders">
														<!-- Ebook 검색 결과  -->
          											</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
													<!-- 
													<ul class="modal-button">
														<li><button class="modal-charge" id="chargePoint" >충전하기</button> 
														<input type="submit" id="borrowEbook" value="대여하기" class="borrow-button">
													</ul> -->
													</div>
											</div>
										</div>  
									</div>
			<!-- modal end -->		
	<!-- footer -->

	<c:import url="/WEB-INF/views/footer.jsp" charEncoding="UTF-8" />
	<script>
			$(document).ready(
					function() {
						$(".dropdown").hover(
								function() {
									$('.dropdown-menu', this).stop(true, true)
											.slideDown("fast");
									$(this).toggleClass('open');
								},
								function() {
									$('.dropdown-menu', this).stop(true, true)
											.slideUp("fast");
									$(this).toggleClass('open');
								});
					});
			
			$(document).on('ready', function () {
		        
		        $('.kv-fa').rating({
		            theme: 'krajee-fa',
		            filledStar: '<i class="fa fa-star"></i>',
		            emptyStar: '<i class="fa fa-star-o"></i>'
		        });

		        $('.rating,.kv-gly-star,.kv-uni-star,.kv-fa,.kv-svg').on(
		                'change', function () {
		                    console.log('Rating selected: ' + $(this).val());
		                });
		    	console.log($('.rating,.kv-gly-star,.kv-gly-heart,.kv-uni-star,.kv-uni-rook,.kv-fa,.kv-fa-heart,.kv-svg,.kv-svg-heart').val());
		        if($('.rating,.kv-gly-star,.kv-gly-heart,.kv-uni-star,.kv-uni-rook,.kv-fa,.kv-fa-heart,.kv-svg,.kv-svg-heart').val()==0){
		        
		        }
		    });
			
		</script>

</body>
</html>