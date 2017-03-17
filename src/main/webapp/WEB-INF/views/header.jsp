<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
								<div class="tooltip">Sign Up!</div>
							  </div>
							  <div class="form">
								<h3>Login to your account</h3>
								<form class="login" action="#" method="post">
								  <input type="text" name="Username" placeholder="Username" required="">
								  <input type="password" name="Password" placeholder="Password" required="">
								  <input type="submit" value="Login">
								</form>
							  </div>
							  <!-- <div class="social-icons">
									<div class="login-button">
											<a class="fa" href="#"><i class="anc-fa"></i><span>Facebook</span><div class="clear"></div></a> 
											<a class="go" href="#"><i class="anc-go"></i><span>Google+</span><div class="clear"></div></a>
										<div class="clear"></div>
									</div>
								</div> -->
							  <div class="form">
								<h3>Create an account</h3>
								<form class="login" action="#" method="post">
								  <input type="text" name="Username" placeholder="Username" required="">
								  <input type="password" name="Password" placeholder="Password" required="">
								  <input type="email" name="Email" placeholder="Email Address" required="">
								  <input type="text" name="Phone" placeholder="Phone Number" required="">
								  <input type="submit" value="Register">
								</form>
							  </div>
								 <div class="social-icons">
									<div class="login-button">
											<a class="fa" href="#"><i class="anc-fa"></i><span>Facebook</span><div class="clear"></div></a> 
											<a class="go" href="#"><i class="anc-go"></i><span>Google+</span><div class="clear"></div></a>
										<div class="clear"></div>
									</div>
								</div>
									<div class="cta">
										<a href="#">Forgot your password?</a>
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
	</script>