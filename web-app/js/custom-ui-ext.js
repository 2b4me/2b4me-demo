//********************************* CUSTOM LOGIN MODAL ************************************//

//******************************* END CUSTOM LOGIN MODAL **********************************//

//********************************** START AUTH CHECK *************************************//
$.ajax({
	url: "featured/isAuthenticated",
	cache: false
}).done(function( html ) {
	if (html == 'null') {
		$('body').append('<div id="demo-login" class="modal-box demo-hide"><h2>To see this demo, you must log in:</h2><div class="login-input"><label for="login-user" class="blue-label">User Name:</label><input type="text" value="" class="text-input lvl2" id="demo-login-user" /></div><div class="login-input"><label for="login-pass" class="blue-label">Password:</label><input type="password" value="" class="text-input lvl2" id="demo-login-pass" /></div><div id="login-actions">&nbsp;<button type="submit" class="green-btn lvl2" id="demo-login-submit">log in</button></div><a href="#" title="cancel" id="close-btn"></a></div>');
		$('body').append('<div id="demo-fade"></div>');
		$('#demo-fade').css({position:'fixed', top:'0',  left:'0', zIndex:'99',
					   background:'#000', width:'100%', height:'100%', 
					   display:'none'});
		function submitDemoLoginForm() {
			var u = $('#demo-login-user').val();
			var p = $('#demo-login-pass').val();
			$.ajax({
				url: "featured/authenticate?u="+u+"&p="+p,
				cache: false
			}).done(function( html ) {
				if (html == 'true') {
					$('#demo-login').stop().fadeOut(300);
					$('#demo-fade').stop().fadeOut(300);
				} else {
					alert("Username or password is wrong. Please try again.");
				}
			});
		}
		$('#demo-login-submit').click(function(){
			submitDemoLoginForm();
		});
		$('#demo-login-pass').keyup(function(e) {
			if(e.keyCode == 13) {
				submitDemoLoginForm();
			}
		});
		$('#demo-fade').fadeTo('normal', 0.95);
		$('#demo-login').fadeIn();
	}
});
//********************************** END AUTH CHECK *************************************//

$(".nyi").click(function() {
	alert("Not yet implemented");
	return false;
});