$(document).ready(function(){
    
    $('#registration-link').click(function() {
        event.preventDefault();
        $('#registration').submit();
    });
    
    $('#registration-signin').click(function() {
        event.preventDefault();
        $('#ext-fade').fadeTo('normal', 0.70);
        $('#ext-login').fadeIn();
    });
    
    $('#form-input.password2 input').keypress(function(event) {
   	    if (event.which == 13) {
   	        $('#registration-link').trigger('click');
   	    }
   	});
    
    $('#form-input.email input').focus(function(event) {
        $('#form-input.email input').removeClass('input-error');
        $('#form-input-error.email ul').fadeOut();
    });

    $('#form-input.password input').focus(function(event) {
        $('#form-input.password input').removeClass('input-error');
        $('#form-input-error.password ul').fadeOut();
    });
    
    $('#form-input.password2 input').focus(function(event) {
        $('#form-input.password2 input').removeClass('input-error');
        $('#form-input-error.password2 ul').fadeOut();
    });
    
});