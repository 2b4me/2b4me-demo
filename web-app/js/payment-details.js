$(document).ready(function(){
	// note:
	//     <g:submitButton name="cancel" ... />
	// turns into
	//     <input type="submit" id="_eventId_cancel" name="_eventId_cancel" ... />
	
	$('#pd-cancel-link').click(function() {
		$('#_eventId_cancel').trigger('click');
		return false;
	});
	
	$('#pd-continue-link').click(function() {
		$('#_eventId_continue').trigger('click');
		return false;
	});
	
	$('#purchaseDeal #purchase-deal-content input.zipCode').keypress(function(event) {
        if (event.which == 13) {
            $('#_eventId_continue').trigger('click');
        }
    });
	
});