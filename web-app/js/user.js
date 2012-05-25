$(document).ready(function(){
    
    $('#registration-link').click(function() {
        event.preventDefault();
        var p1 = $('#registration-password').val();
        var p2 = $('#registration-password2').val();
        if (p1 == p2) {
            $('#registration').submit();
        } else {
            alert("Passwords didn't match");
        }
    });
    
    $('#registration-signin').click(function() {
        event.preventDefault();
        $('#ext-fade').fadeTo('normal', 0.70);
        $('#ext-login').fadeIn();
    });
    
});