<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- FaceBook sdk -->
<script>
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
<!-- Google sdk -->
<script async defer src="https://apis.google.com/js/api.js"
	onload="this.onload=function(){};handleClientLoad()"
	onreadystatechange="if (this.readyState === 'complete') this.onload()">
	
</script>
<!-- login -->
<script type="text/javascript" src="resources/js/login.js"></script>
<script type="text/javascript" src="resources/js/google.js"></script>


<!-- header -->
<div class="header">
		<div class="container">
			<div class="w3layouts_logo">
				<a href="index.html"><h1>CoBook<span></span></h1></a>
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
											<li><a href="#">1권</a></li>
											<li><a href="#">뱀파이어와의 인터뷰</a></li>
											 <div class="dropdown-divider"><a></a></div>
											 <li><a href="#">Action</a></li>
											<li><a href="#">Biography</a></li>
											 
										</ul>
									</div>
									<div class="clearfix"></div>
									</li>
								</ul>
					</li>
					<li><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
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
							<li class="active"><a href="index.html">Home</a></li>
							<li class="dropdown">
								<a href="genres.html" class="dropdown-toggle" data-toggle="dropdown">Genres <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<li>
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<li><a href="genres.html">Action</a></li>
											<li><a href="genres.html">Biography</a></li>
											<li><a href="genres.html">Crime</a></li>
											<li><a href="genres.html">Family</a></li>
											<li><a href="horror.html">Horror</a></li>
											<li><a href="genres.html">Romance</a></li>
											<li><a href="genres.html">Sports</a></li>
											<li><a href="genres.html">War</a></li>
										</ul>
									</div>
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<li><a href="genres.html">Adventure</a></li>
											<li><a href="comedy.html">Comedy</a></li>
											<li><a href="genres.html">Documentary</a></li>
											<li><a href="genres.html">Fantasy</a></li>
											<li><a href="genres.html">Thriller</a></li>
										</ul>
									</div>
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<li><a href="genres.html">Animation</a></li>
											<li><a href="genres.html">Costume</a></li>
											<li><a href="genres.html">Drama</a></li>
											<li><a href="genres.html">History</a></li>
											<li><a href="genres.html">Musical</a></li>
											<li><a href="genres.html">Psychological</a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
									</li>
								</ul>
							</li>
							<li><a href="news.html">Review</a></li> 
							<li><a href="list.html">Mybook</a></li>
							<li><a href="#">About</a></li>
							<li><a href="contact.html">Contact</a></li>
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
							  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
								<div class="tooltip">Click it!</div>
							  </div>
							  <div class="form">
								<h3>CoBook 로그인</h3>
								<form class="login" onsubmit="login_cobook_function(); return false ">
								  <input id="login_email" type="email" name="Email"  style="width:100%;"  placeholder="Email" required="">
								  <input id="login_password" type="password" name="Password" placeholder="Password" required="">
								  <input id="login_cobook" type="submit" value="Login">
								</form>
								<div class="social-icons">
									<div class="login-button">
											<a class="fa" id="login_facebook" href="#"><i class="anc-fa"></i><span>Facebook</span><div class="clear"></div></a> 
											<a class="go" id="login_google" href="#"><i class="anc-go"></i><span>Google+</span><div class="clear"></div></a>
										<div class="clear"></div>
									</div>
								</div>
							  </div>

							  <div class="form">
								<h3>CoBook 회원가입</h3>
								<form class="login" onsubmit="join_cobook_function(); return false;">
								<div>
								  <input id="join_email" type="email" name="Email" placeholder="이메일" required="">
								  <a id="join_email_check" class="emailCheck" href="#">인증</a>
								 </div>
								 <div>
								  <input id="join_email_check_key" type=text name="EmailCheckKey"  style="width:80%;display:inline-block ;" placeholder="인증번호" required="" >
								  <a id="join_email_check_key_btn" class="emailCheck" href="#" >확인</a>
								 </div>
								  <input id="join_password" type="password" name="Password" placeholder="비밀번호" required="">
								  <input id="join_username" type="text" name="Username" placeholder="닉네임" required="">
								   <div>
								  <input id="join_age" type="number" name="Age" placeholder="나이" required="" >
								  <a id="join_gender" class="genderSelect" href="#" >
								  	<label class="radio-inline">
								  			<input  type="radio" name="Gender" placeholder="성별" value="M" required="">남성
								  		</label>
										<label class="radio-inline">
											<input type="radio" name="Gender" placeholder="성별" value="W" required="">여성
								  		</label>
								  </a>
								 </div>
								  <input id="join_cobook" type="submit" value="Register">
								</form>
								<div class="social-icons">
									<div class="login-button">
											<a class="fa" id="join_facebook" href="#"><i class="anc-fa"></i><span>Facebook</span><div class="clear"></div></a> 
											<a class="go" id="join_google" href="#"><i class="anc-go"></i><span>Google+</span><div class="clear"></div></a>
										<div class="clear"></div>
									</div>
								</div>
							  </div>

									<div class="cta">
										<a id="forgotPassword" href="#">Forgot your password?</a>
									</div>
								</div>
							</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script>
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
		});

		//Cobook 로그인 버튼   - form의 onsubmit에 등록
		var login_cobook_function = function(){
			cobookLogin($("#login_email").val(),$("#login_password").val(),"COBOOKLOGIN");
		} 
		
		var join_cobook_function = function(){
			console.log("ddddddddddddddddddddddd");
		}
		//Cobook 가입 버튼 
		$("#join_cobook").on("click", function() {

		});
		
		//로그인 facebook 버튼
		$("#login_facebook").on("click", function() {

		});
		//가입 facebook 버튼
		$("#join_facebook").on("click", function() {

		});
		//로그인 google 버튼
		$("#login_google").on("click", function() {

		});
		//가입 google 버튼
		$("#join_google").on("click", function() {

		});
		
		function ChangeJoinForm(){
				  // Switches the Icon
				  $('.toggle').children('i').toggleClass('fa-pencil');
				  // Switches the forms  
				  $('.form').animate({
					height: "toggle",
					'padding-top': 'toggle',
					'padding-bottom': 'toggle',
					opacity: "toggle"
				  }, "slow");
				  
				  SetJoinForm('test@test','M','ID');
		};
		function SetJoinForm(email,gender, id){
			
		};

		//모달 닫을때, form 초기화 작업
		$('.modal').on('hidden.bs.modal', function (e) {
		    $(this).find('form')[0].reset();
		    $(this).find('form')[1].reset();
		});
	</script>