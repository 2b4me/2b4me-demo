function showUpdateEmailForm(control, event) {
    event.preventDefault();
    $('#'+control).html('<input type="text" id="'+control+'-input" style="border: 1px solid gray;" value="'+$('#'+control).html()+'" />');
    $('#'+control+'-update-link').hide();
    $('#'+control+'-cancel-link').show();
}

function cancelUpdateEmail(control, event) {
    event.preventDefault();
    $.ajax('profile/emailAddress', {
        success: function(data) {
            $('#'+control).html(data);
            $('#'+control+'-cancel-link').hide();
	        $('#'+control+'-update-link').show();
        }
    });
}

function updateEmail(control, event) {
    if (event.which == 13) {
        event.preventDefault();
        $('#'+control+'-input').prop('disabled', true);
        var newEmailAddress = $('#'+control+'-input').val()
        $.ajax('profile/updateEmailAddress', {
            data: {
                emailAddress: newEmailAddress
            },
            success: function(data) {
                if (data == 'success') {
                    $('#'+control).html(newEmailAddress);
                    $('#'+control+'-cancel-link').hide();
        	        $('#'+control+'-update-link').show();
                } else {
                    alert("Error trying to update the e-mail address");
                    $('#'+control+'-input').prop('disabled', false);
                }
            }
        });
        return newEmailAddress;
    } else {
        return null;
    }
}

function refreshEmailData(control, emailAddress) {
    $('#'+control).html(emailAddress);
}

$(document).ready(function(){
	$('.sub').click(function(){
		this.disabled = true;
    	$("#subUpdating").slideDown();
    	var checked = this.checked;
    	var name = this.name;
    	$.ajax({
    		url: "profile/updateSub?name="+name+"&checked="+checked,
    		cache: false
    	}).done(function( html ) {
    		setTimeout(function() {
    			$("#subUpdating").hide();
    			$("#subDone").show();
    		},1250);
    		setTimeout(function() {
    			$("#subDone").slideUp();
    			this.disabled = false;
    		},2500);
    	});
	});
	
	$('#profile-email-address-1-update-link').click(function(event) {
	    showUpdateEmailForm('profile-email-address-1', event);
	});
	
	$('#profile-email-address-1-cancel-link').click(function(event) {
	    cancelUpdateEmail('profile-email-address-1', event);
	});
	
	$('#profile-email-address-1-input').live("keypress", function(event) {
	    var newEmailAddress = updateEmail('profile-email-address-1', event);
	    if (newEmailAddress != null) {
	        refreshEmailData('profile-email-address-2', newEmailAddress)
	    }
	});
	
	$('#profile-email-address-2-update-link').click(function(event) {
	    showUpdateEmailForm('profile-email-address-2', event);
	});
	
	$('#profile-email-address-2-cancel-link').click(function(event) {
	    cancelUpdateEmail('profile-email-address-2', event);
	});
	
	$('#profile-email-address-2-input').live("keypress", function(event) {
	    var newEmailAddress = updateEmail('profile-email-address-2', event);
	    if (newEmailAddress != null) {
	        refreshEmailData('profile-email-address-1', newEmailAddress)
	    }
	});
	
	
});