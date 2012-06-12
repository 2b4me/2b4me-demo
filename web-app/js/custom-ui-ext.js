function toBeForMeOrigin() {
    var origin = window.location.origin
    if (origin.indexOf('localhost') > 0) {
        return origin + '/2b4me-demo';
    } else {
        return origin;
    }
}

//********************************* CUSTOM LOGIN MODAL ************************************//
$('#signin').click(function(event){
    event.preventDefault();
    $('#ext-fade').fadeTo('normal', 0.70);
    $('#ext-login').fadeIn();
});

$('#ext-login .login-input').keypress(function(event) {
    if (event.which == 13) {
        $('#ext-login #login-actions button').trigger('click');
    }
});

$('#ext-fade, a#close-btn, a#cancel').live('click', function(event){
    $('#ext-fade').stop().fadeOut(300);
    $('#ext-login').stop().fadeOut(300);
    event.preventDefault();
});

$('#ext-login #login-actions button').click(function(event) {
    var username = $('#ext-login .login-input input[type=text]').val();
    var password = $('#ext-login .login-input input[type=password]').val();
    $.ajax({
        type: 'post',
        url: toBeForMeOrigin() + '/user/login',
        data: {
            username: username,
            password: password
        },
        cache: false
    }).done(function(html) {
        if (html == 'Error') {
            alert('Username and/or Password Incorrect');
        } else {
            $('#ext-fade').stop().fadeOut(300);
            $('#ext-login').stop().fadeOut(300);
            $('#nav.logged-off').fadeToggle(100, 'linear', function() {
                $('#nav.logged-on').fadeIn(100);
            });
        }
    });
});

$('#logout-link').click(function(event) {
    if (confirm('Do you really want to log out?')) {
        $.ajax({
            type: 'post',
            url: 'user/logout',
            cache: false
        }).done(function(html) {
            window.location.replace(toBeForMeOrigin());
        });
    }
    event.preventDefault();
});
//******************************* END CUSTOM LOGIN MODAL **********************************//

//********************************** START AUTH CHECK *************************************//
/*
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
 */
//********************************** END AUTH CHECK *************************************//

$(".nyi").click(function(event) {
    alert("Not yet implemented");
    event.preventDefault();
});