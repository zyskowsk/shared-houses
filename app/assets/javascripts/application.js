// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){
	$(".welcome_sign_in").hide();
	$(".welcome_sign_up").hide();
	
	$('.sign_in_button').click(function(){
		if( $(".welcome_sign_in").is(":visible") ){
			$(".welcome_sign_in").slideUp(800);
		}
		else if( $(".welcome_sign_up").is(":visible") ){
			$(".welcome_sign_up").slideUp(800, function(){
				$(".welcome_sign_in").slideDown(800);
			});
		}
		else{
			$(".welcome_sign_in").slideDown(800);
		}
	});
	
	$('.sign_up_button').click(function(){
		if( $(".welcome_sign_up").is(":visible") ){
			$(".welcome_sign_up").slideUp(800);
		}
		else if( $(".welcome_sign_in").is(":visible") ){
			$(".welcome_sign_in").slideUp(800, function(){
				$(".welcome_sign_up").slideDown(800);
			});
			
		}
		else{
			$(".welcome_sign_up").slideDown(800);
		}
	});
	
	//Add Hover effect to menus
	jQuery('ul.nav li.dropdown').hover(function() {
	  jQuery(this).find('.dropdown-menu').stop(true, true).delay(100).slideDown();
	}, function() {
	  jQuery(this).find('.dropdown-menu').stop(true, true).delay(100).slideUp();
	});
	
});