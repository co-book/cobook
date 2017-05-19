<%@page import="org.ebook.cobook.member.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String member_no=null;
String nickname="비회원님";
String myPoint="0";
MemberVO vo = (MemberVO)session.getAttribute("member");
if(vo!=null){
	member_no=vo.getMember_no()+"";
	nickname=vo.getNickname();
	myPoint=vo.getMyPoint()+"";
}
%>
<!-- FaceBook sdk -->
<script>
var member_no = <%=member_no%>;
var nickname= "<%=nickname %>";
var myPoint= <%=myPoint %>;
window.fbAsyncInit = function() {
	FB.init({
		appId : '135805423595994',
		xfbml : true,
		version : 'v2.8'
	});
};
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>


<!-- fireBase -->
<script src="https://www.gstatic.com/firebasejs/3.7.0/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.3.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.3.0/firebase-auth.js"></script>

<!-- login -->
<script type="text/javascript" src="/cobook/resources/js/member/member.js"></script>
<script type="text/javascript" src="/cobook/resources/js/member/google.js"></script>
<script type="text/javascript" src="/cobook/resources/js/member/facebook.js"></script>
<script type="text/javascript" src="/cobook/resources/js/member/firebase.js"></script>

<!-- Google sdk -->
<script async defer src="https://apis.google.com/js/api.js"
	onload="this.onload=function(){};handleClientLoad()"
	onreadystatechange="if (this.readyState === 'complete') this.onload()">
</script>

<!-- header -->
<div class="header">
		<div class="container">
			<div class="w3layouts_logo">
				<a href="/cobook"><h1>CoBook<span></span></h1></a>
			</div>
			<div class="w3_search">
				<form action="#" method="post">
					<input type="text" name="Search" placeholder="Search" required="">
					<input type="submit" value="Go">
				</form>
			</div>
			<div class="w3l_sign_in_register">
				<ul>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Wish List <span class="badge">2</span></a>
						<ul class="dropdown-menu multi-column columns-2">
							<li>
								<div class="wishlist_dropdown">
									<ul class="multi-column-dropdown">
										<li><a href="#">오베라는남자 </a></li>
										<li><a href="#">뱀파이어와의 인터뷰</a></li>
										<li>
											<div>
												<a href="#">
													<h4> 오베라는남자</h4>
													<p>Action</p>
													
												</a>
											</div>
										</li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</li>
						</ul>
					</li>
					<li id="login_on"><a href="#" data-toggle="modal" data-target="#myModal" style="display:hide;" >Login</a></li>
					<li id="login_off"><a href="/cobook/member/logout" style="display:hide;" >Logout</a></li>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //header -->
<!-- nav -->
	<div class="movies_nav">
		<div class="container">
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav>
						<ul class="nav navbar-nav">
							<li class="active"><a href="/cobook">Home</a></li>
							<li class="dropdown">
								<a href="/cobook/ebook/genres" class="dropdown-toggle" data-toggle="dropdown">Genres <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<li>
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<li><a href="/cobook/ebook/genres/소설">소설</a></li>
											<li><a href="/cobook/ebook/genres/경영경제">경영/경제</a></li>
											<li><a href="/cobook/ebook/genres/시에세이">시/에세이</a></li>
											<li><a href="/cobook/ebook/genres/genres">Family</a></li>
											<li><a href="/cobook/ebook/genres/genres">Horror</a></li>
											<li><a href="/cobook/ebook/genres/genres">Romance</a></li>
											<li><a href="/cobook/ebook/genres/genres">Sports</a></li>
											<li><a href="/cobook/ebook/genres/genres">War</a></li>
										</ul>
									</div>
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<li><a href="/cobook/ebook/genres/genres">Adventure</a></li>
											<li><a href="/cobook/ebook/genres/genres">Comedy</a></li>
											<li><a href="/cobook/ebook/genres/genres">Documentary</a></li>
											<li><a href="/cobook/ebook/genres/genres">Fantasy</a></li>
											<li><a href="/cobook/ebook/genres/genres">Thriller</a></li>
										</ul>
									</div>
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<li><a href="/cobook/ebook/genres/genres">Animation</a></li>
											<li><a href="/cobook/ebook/genres/genres">Costume</a></li>
											<li><a href="/cobook/ebook/genres/genres">Drama</a></li>
											<li><a href="/cobook/ebook/genres/genres">History</a></li>
											<li><a href="/cobook/ebook/genres/genres">Musical</a></li>
											<li><a href="/cobook/ebook/genres/genres">Psychological</a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
									</li>
								</ul>
							</li>
							<li><a href="/cobook/review">Review</a></li> 
							<li><a href="/cobook/mybook">Mybook</a></li>
							<li><a href="#">About</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">MyPage</a></li>
						</ul>
					</nav>
				</div>
			</nav>	
		</div>
	</div>
<!-- //nav --> 

<!-- //footer -->
<!-- Bootstrap Core JavaScript-->
<script src="resources/CoBookDesign/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>
<!-- //Bootstrap Core JavaScript -->
	
	
<!-- login-pop-up -->
	<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					Hello, CoBook!
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
				</div>
				<section>
					<div class="modal-body">
						<div class="w3_login_module">
							<div class="module form-module">
							  <div class="toggle"><i class="fa2 fa-times fa-pencil"></i>
								<div class="tooltip">Click it!</div>
							  </div>
							  <div class="form">
								<h3>CoBook 로그인</h3>
								<form name="login_form"class="login" onsubmit="login_cobook_function(); return false ">
								  <input id="login_email" type="email" name="Email"  style="width:100%;"  placeholder="Email" required="">
								  <input id="login_password" type="password" name="Password" placeholder="Password" required="">
								  <input id="login_cobook" type="submit" value="Login">
								</form>
								<div class="social-icons">
									<div class="login-button">
											<a class="go" id="login_google" href="#"><i class="anc-go"></i><span>Google+</span><div class="clear"></div></a>
											<a class="fa" id="login_facebook" href="#"><i class="anc-fa"></i><span>Facebook</span><div class="clear"></div></a> 
											<div class="clear"></div>
									</div>
								</div>
							  </div>
							  <div class="form">
								<h3>CoBook 회원가입</h3>
								<form name="join_form" class="login" onsubmit="join_cobook_function(); return false ">
								<div>
								  <input id="join_email" type="email" name="Email" placeholder="이메일" required="">
								  <a id="join_email_check" class="emailCheck" href="#">인증</a>
								  <a id="join_email_check_off" class="emailCheck" href="#"  style="background-color:#808080;border:#808080; ">인증</a>
								 </div>
								 <div id="join_email_check_form" style="display:none">
								  <input id="join_email_check_key" type=text name="EmailCheckKey"  style="width:80%;display:inline-block ;" placeholder="인증번호" >
								  <a id="join_email_check_key_btn" class="emailCheck" href="#" >확인</a>
								 </div>
								  <input id="join_password" type="password" name="Password" placeholder="비밀번호" required="">
								  <input id="join_nickname" type="text" name="Username" placeholder="닉네임" required="">
								   <div>
								  <input id="join_age" type="number" name="Age" placeholder="나이" required="" >
								  <a id="join_gender" class="genderSelect" href="#" >
								  	<label class="radio-inline">
								  			<input id="join_gender_m" type="radio" name="join_gender" placeholder="성별" value="M" required="">남성
								  		</label>
										<label class="radio-inline">
											<input id="join_gender_w" type="radio" name="join_gender" placeholder="성별" value="W" required="">여성
								  		</label>
								  </a>
								 </div>
								  <input id="join_cobook" type="submit" value="Register">
								</form>
								<div class="social-icons">
									<div class="login-button">
										<a class="go" id="join_google" href="#"><i class="anc-go"></i><span>Google+</span><div class="clear"></div></a>
										<a class="fa" id="join_facebook" href="#"><i class="anc-fa"></i><span>Facebook</span><div class="clear"></div></a> 
										<div class="clear"></div>
									</div>
								</div>
							  </div>

									<div class="cta">
										<a id="forgotPassword" href="#">비밀번호 찾기</a>
									</div>
								</div>
							</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script>
		var coMember = new CobookMember();
		
		//토글 이벤트
		$('.toggle').click(function(){
		  // Switches the Icon
		  $(this).children('i').toggleClass('fa-pencil');
		  // Switches the forms  
		  $('.form').animate({
			height: "toggle",
			'padding-top': 'toggle',
			'padding-bottom': 'toggle',
			opacity: "toggle"
		  }, "slow");
		  //초기화 
		  initLogin();
		});
		
		//Cobook 로그인 버튼   - form의 onsubmit에 등록
		var login_cobook_function = function(){
			coMember.email=$("#login_email").val();
			coMember.password=$("#login_password").val();
			coMember.loginType="COBOOKLOGIN";
			coMember.cobookLogin();
		} 
		//로그인 google 버튼
		$("#login_google").on("click", function() {
			googleLogin("GOOGLELOGIN");
		});
		//로그인 facebook 버튼
		$("#login_facebook").on("click", function() {
			facebookLogin("FACEBOOKLOGIN");
		});
		
		
		//회원가입
		var join_cobook_function = function(){
			if(coMember.checkEmail!="OK"){
				alert("이메일 인증하세요");
			}else{
				coMember.email=$("#join_email").val();
				coMember.password=$("#join_password").val();
				coMember.nickname=$("#join_nickname").val();
				coMember.age=$("#join_age").val();
				coMember.gender=$('[name="join_gender"]:checked').val();
				coMember.cobookJoin();
			}
		}		
		//가입 google 버튼
		$("#join_google").on("click", function() {
			googleLogin("GOOGLEJOIN");
		});
		//가입 facebook 버튼
		$("#join_facebook").on("click", function() {
			facebookLogin("FACEBOOKJOIN");
		});
		//이메일 인증 보내기
		$("#join_email_check").on("click", function() {
			if($("#join_email").val()==null){
				alret("이메일을 입력하세요");
				return;
			}
			coMember.email=$("#join_email").val();
			coMember.emailCheck();
		} );
		
		//이메일 인증 체크 관련 로직
		function openEmailCheckForm(authString){
			$("#join_email_check_form").show();
			
			$("#join_email_check_key_btn").unbind("click");
			$("#join_email_check_key_btn").on("click", function() {
				console.log($("#join_email_check_key").val()+"/"+authString);
				if($("#join_email_check_key").val()!=authString){
					alert("인증번호를 잘못 입력하셨습니다.");
				}else{
					coMember.checkEmail="OK";
					alert("성공");
					$("#join_email_check_form").hide();
					emailCheck_off();
				}
			});
		}
		
		//로그오프
		$("#login_off").on("click", function() {
			coMember.cobookLogout();
		});
		
		//비밀번호 찾기
		$("#forgotPassword").on("click", function() {
			passwordModifyEmail();
		});
		
		
		//조인 -> 로그인 폼으로 변경
		function ChangeLoginForm(){
			  // Switches the Icon
			  $('.toggle').children('i').toggleClass('fa-pencil');
			  // Switches the forms  
			  $('.form').animate({
				height: "toggle",
				'padding-top': 'toggle',
				'padding-bottom': 'toggle',
				opacity: "toggle"
			  }, "slow");

			  initLogin();
			  $("form[name='join_form']").each(function() {
			       this.reset();
			  });
			  
		};
		//로그인 ->조인 폼으로 변경
		function ChangeJoinForm(coMember){
				  // Switches the Icon
				  $('.toggle').children('i').toggleClass('fa-pencil');
				  // Switches the forms  
				  $('.form').animate({
					height: "toggle",
					'padding-top': 'toggle',
					'padding-bottom': 'toggle',
					opacity: "toggle"
				  }, "slow");
				  initLogin();
				  $("form[name='login_form']").each(function() {
				       this.reset();
				  });
				  //SetJoinForm(coMember);
		};
		//가져온 정보로 조인 폼에 입력
		function SetJoinForm(member){
			if(member.email!=""&member.email!=null){
				$("#join_email").val(member.email);
			}
			if(member.nickname!=""&member.nickname!=null){
				$("#join_nickname").val(member.nickname);
			}
			if(member.age!=""&member.age!=null){
				$("#join_age").val(member.age);
			}
			if(member.gender!=""&member.gender!=null){
				if(member.gender=="male"){
					$("#join_gender_m").attr('checked', 'checked');
				}else{
					$("#join_gender_w").attr('checked', 'checked');
				}
			}
			
			//이메일 체크 폼 삭제 및 인증 절차 생략
			$("#join_email_check_form").hide();
			emailCheck_off();
			coMember.checkEmail="OK";
		};


		
		//모달 닫을때, form 초기화 작업
		$('.modal').on('hidden.bs.modal', function (e) {
		    $(this).find('form')[0].reset();
		    $(this).find('form')[1].reset();
			initLogin();
		});
		//로그인, 조인 입력값  초기화
		var initLogin = function(){
			//로그인 초기화
		    coMember = new CobookMember();
			//인증 숨기기
		    $("#join_email_check_form").val("");
		    $("#join_email_check_form").hide();
		    emailCheck_On();
		    
			  $("form[name='join_form']").each(function() {
			       this.reset();
			  });
			  $("form[name='login_form']").each(function() {
			       this.reset();
			  });
		}
		
		//Join email 잠금
		var emailCheck_off =function(){
			$("#join_email_check").hide();
			$("#join_email_check_off").show();
			$("#join_email").attr("readonly",true);
		}
		//Join email 오픈
		var emailCheck_On =function(){
			$("#join_email_check").show();
			$("#join_email_check_off").hide();
			$("#join_email").attr("readonly",false);
		}
		//로그인 상태
		var login_on_func = function(){
			$("#login_on").hide();
			$("#login_off").show();
		}
		//로그오프 상태
		var login_off_func = function(){
			$("#login_on").show();
			$("#login_off").hide();
		}
		if(member_no!=null){
			login_on_func();
		}else{
			login_off_func();
		}
		
	</script>