<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="w3ls_footer_grid">
				<div class="col-md-6 w3ls_footer_grid_left">
					<div class="w3ls_footer_grid_left1">
						<!-- <h2>Subscribe to us</h2>
						<div class="w3ls_footer_grid_left1_pos">
							<a href="index.html"><h2>CoBook<span></span></h2></a>
						</div> -->
					</div>
				</div>
				<div class="col-md-6 w3ls_footer_grid_right">
					<a href="index.html"><h2>CoBook<span></span></h2></a>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-5 w3ls_footer_grid1_left">
				<p>&copy; 2016 One ebook. All rights reserved | Design by <a href="https://github.com/co-book">Cobook</a></p>
			</div>
			<div class="col-md-7 w3ls_footer_grid1_right">
				<ul>
					<li>
						<a href="genres.html">Home</a>
					</li>
					<li>
						<a href="faq.html">Ebook</a>
					</li>
					<li>
						<a href="horror.html">Review</a>
					</li>
					<li>
						<a href="genres.html">Mybook</a>
					</li>
					<li>
						<a href="comedy.html">About</a>
					</li>
					<li>
						<a href="icons.html">Contact</a>
					</li>
					<li>
						<a href="contact.html">Mypage</a>
					</li>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //footer -->


<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->