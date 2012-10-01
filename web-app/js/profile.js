function getPrefix() {
    return window.document.location.protocol+'//'+window.document.location.host+window.document.location.pathname+'/';
}

function showUpdateEmailForm(control, event) {
    event.preventDefault();
    $('#'+control).html('<input type="text" id="'+control+'-input" style="border: 1px solid gray;" value="'+$('#'+control).html()+'" />');
    $('#'+control+'-update-link').hide();
    $('#'+control+'-cancel-link').show();
}

function cancelUpdateEmail(control, event) {
    event.preventDefault();
    $.ajax(getPrefix()+'emailAddress', {
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
        $.ajax(getPrefix()+'updateEmailAddress', {
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

function saveAddress() {
    $('#profile-address-1-input').prop('disabled', true);
    $('#profile-city-input').prop('disabled', true);
    $('#profile-state-input').prop('disabled', true);
    $('#profile-zipcode-input').prop('disabled', true);
    var address = $('#profile-address-1-input').val();
    var city = $('#profile-city-input').val();
    var state = $('#profile-state-input').val();
    var zipcode = $('#profile-zipcode-input').val();
    $.ajax(getPrefix()+'updateAddress', {
        data: {
            address: address,
            city: city,
            state: state,
            zipcode: zipcode
        },
        success: function(data) {
            if (data == 'success') {
                $('#user-address-1').html(address);
                $('#user-address-2').html(city + ',&nbsp;' + state + '&nbsp;&nbsp;' + zipcode);
                $('#profile-address-section-form').hide();
                $('#profile-address-section-data').show();
                $('#profile-email-section').show();
                $('#master-profile-update-link').show();
            } else {
                alert("Error trying to update the name");
                $('#profile-address-1-input').prop('disabled', false);
                $('#profile-city-input').prop('disabled', false);
                $('#profile-state-input').prop('disabled', false);
                $('#profile-zipcode-input').prop('disabled', false);
            }
        }
    });
}

function watermark(field, conditionalValue, newValue, targetColor) {
    if ($(field).val() == conditionalValue) {
        $(field).val(newValue);
        $(field).css('color', targetColor);
    }
}

$(document).ready(function() {
    
	$('.sub').click(function() {
		this.disabled = true;
    	$("#subUpdating").slideDown();
    	var checked = this.checked;
    	var name = this.name;
    	$.ajax({
    		url: getPrefix()+"updateSub?name="+name+"&checked="+checked,
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
	
	$('#profile-name-update-link').click(function(event) {
	    event.preventDefault();
        $('#profile-name').html(
            '<input type="text" id="profile-first-name-input" value="First name" style="border: 1px solid gray; color: #D3D3D3;" /> ' +
            '<input type="text" id="profile-last-name-input" style="border: 1px solid gray; color: #D3D3D3;" value="Last name" />'
        );
        $('#profile-name-update-link').hide();
        $('#profile-name-cancel-link').show();
	});
	
	$('#profile-name-cancel-link').click(function(event) {
	    event.preventDefault();
	    $.ajax(getPrefix()+'name', {
            success: function(data) {
                $('#profile-name').html(data);
                $('#profile-name-cancel-link').hide();
                $('#profile-name-update-link').show();
            }
        });
	});
	
	$('#profile-first-name-input').live("focus", function(event) {
	    watermark('#profile-first-name-input',
	              'First name', '', 'black');
    });

	$('#profile-first-name-input').live("blur", function(event) {
	    watermark('#profile-first-name-input',
	              '', 'First name', '#D3D3D3');
    });
	
	$('#profile-last-name-input').live("focus", function(event) {
	    watermark('#profile-last-name-input',
	              'Last name', '', 'black');
    });
    
    $('#profile-last-name-input').live("blur", function(event) {
        watermark('#profile-last-name-input',
	              '', 'Last name', '#D3D3D3');
    });
    
    $('#update-profile-first-name-input').focus(function(event) {
        watermark('#update-profile-first-name-input',
	              'First name', '', 'black');
    });

	$('#update-profile-first-name-input').blur(function(event) {
	    watermark('#update-profile-first-name-input',
	              '', 'First name', '#D3D3D3');
    });
    
    $('#update-profile-last-name-input').focus(function(event) {
        watermark('#update-profile-last-name-input',
	              'Last name', '', 'black');
    });

	$('#update-profile-last-name-input').blur(function(event) {
	    watermark('#update-profile-last-name-input',
	              '', 'Last name', '#D3D3D3');
    });
	
	$('#profile-last-name-input').live("keypress", function(event) {
	    if (event.which == 13) {
            event.preventDefault();
            $('#profile-first-name-input').prop('disabled', true);
            $('#profile-last-name-input').prop('disabled', true);
            var firstName = $('#profile-first-name-input').val();
            var lastName = $('#profile-last-name-input').val();
            $.ajax(getPrefix()+'updateName', {
                data: {
                    firstName: firstName,
                    lastName: lastName
                },
                success: function(data) {
                    if (data == 'success') {
                        $('#profile-name').html(firstName + ' ' + lastName);
                        $('#profile-name-big').html(firstName + ' ' + lastName);
                        $('#profile-name-options').hide();
                    } else {
                        alert("Error trying to update the name");
                        $('#profile-first-name-input').prop('disabled', false);
                        $('#profile-last-name-input').prop('disabled', false);
                    }
                }
            });
        }
	});
	
	$('#profile-address-update-link').click(function(event) {
	    event.preventDefault();
	    $('#profile-email-section').hide();
	    $('#master-profile-update-link').hide();
	    $('#profile-address-section').hide();
	    $('#profile-address-section-form').show();
	});
	
	$('#profile-address-cancel-link').click(function(event) {
	    event.preventDefault();
	    $('#profile-address-section-form').hide();
	    $('#profile-address-section').show();
	    $('#master-profile-update-link').show();
	    $('#profile-email-section').show();
	});
	
	$('#profile-address-save-link').click(function(event) {
	    event.preventDefault();
	    saveAddress();
	});
	
	$('#profile-zipcode-input').keypress(function(event) {
	    if (event.which == 13) {
            event.preventDefault();
            saveAddress();
        }
	});
	
	$('#update-profile-state-input').change(function(event) {
	    if ($('#update-profile-state-input').val() != '') {
	        $('#update-profile-state-input').css('color', 'black');
	    } else {
	        $('#update-profile-state-input').css('color', '#D3D3D3');
	    }
	});
	
	$('#update-profile-cancel-changes').click(function(event) {
	    event.preventDefault();
	    window.location = './';
	});
	
	$('#update-profile-save-changes').click(function(event) {
	    event.preventDefault();
	    $.ajax(getPrefix()+'../saveProfileInfo', {
            data: {
                firstName: $('#update-profile-first-name-input').val(),
                lastName: $('#update-profile-last-name-input').val(),
                address: $('#update-profile-address-1-input').val(),
                city: $('#update-profile-city-input').val(),
                state: $('#update-profile-state-input').val(),
                zipcode: $('#update-profile-zipcode-input').val(),
                email: $('#update-profile-email-input').val()
            },
            success: function(data) {
                if (data == 'success') {
                    window.location = './';
                } else {
                    $('#update-profile-error-message p').html(data);
                    $('#update-profile-error-message').show();
                }
            }
        });
	});
	
});