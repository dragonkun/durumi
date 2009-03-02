// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
	$("#user_login").change(function() {
		$.get('/users/login_check', {'user_login':$("#user_login").val()}, function(result) {
			$("#login_check").html(result);
		});
	});

	$("#user_email").change(function() {
		$.get('/users/email_check', {'user_email':$("#user_email").val()}, function(result) {
			$("#email_check").html(result);
		});
	});

	$("#user_password_confirmation").change(function() {
		$.get('/users/password_check', {'user_password':$("#user_password").val(), 'user_password_confirmation':$("#user_password_confirmation").val()}, function(result) {
			$("#password_check").html(result);
		});
	});

});
