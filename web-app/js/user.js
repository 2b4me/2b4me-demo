$(document).ready(function(){
    
    $('#registration-link').click(function() {
        event.preventDefault();
        $('#registration').fadeToggle(200, 'linear', function() {
            $('#registration-loading').fadeIn(200);
        });
    });
    
    $('#registration-signin').click(function() {
        event.preventDefault();
        $('#ext-fade').fadeTo('normal', 0.70);
        $('#ext-login').fadeIn();
    });
    
});