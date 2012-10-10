$(document).ready(function(){
	// note:
	//     <g:submitButton name="cancel" ... />
	// turns into
	//     <input type="submit" id="_eventId_cancel" name="_eventId_cancel" ... />
	
	$('#pd-continue-link').click(function(event) {
	    event.preventDefault();
		$('#continue').trigger('click');
	});
	
	$('#purchaseDeal #purchase-deal-content input.zipCode').keypress(function(event) {
        if (event.which == 13) {
            $('#continue').trigger('click');
        }
    });
	
});