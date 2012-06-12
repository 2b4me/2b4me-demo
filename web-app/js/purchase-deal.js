$(document).ready(function(){
    // note:
    //     <g:submitButton name="cancel" ... />
    // turns into
    //     <input type="submit" id="_eventId_cancel" name="_eventId_cancel" ... />
    
    $('#li-cancel-link').click(function(event) {
        event.preventDefault();
        $('#_eventId_cancel').trigger('click');
    });
    
    $('#li-login-link').click(function(event) {
        event.preventDefault();
        $('#_eventId_login').trigger('click');
    });
    
    $('#form-input.password input').keypress(function(event) {
        if (event.which == 13) {
            $('#li-login-link').trigger('click');
        }
    });
    
});