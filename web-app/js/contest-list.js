$('.entry').click(function(e) {
    event.preventDefault();
    var id = this.getAttribute('contestantId');
    var entry = prompt('If you would like to assign a new number, type it in. Otherwise, cancel.','00000');
    if (entry == '00000') {
        alert('Value of 00000 is not valid.');
        return;
    }
    if (entry != null && entry != "") {    
        $.ajax('changeNumber', {
            cache: false,
            data: {
                id: id,
                entry: entry
            },
            success: function(data) {
                if (data == 'success') {
                    $('#entry'+id).html(entry);
                }

                if (data == 'error') {
                    alert('There was an error processing your request');
                }
            },
            error: function(request, status, error) {
                alert('There was an error processing your request: ' + error);
            }
        });
    }
});

$('.eligible').live('click', function(e) {
    event.preventDefault();
    var targetElement = this
    var id = targetElement.getAttribute('contestantId');
    var r = confirm('Are you sure you want to mark this contestant eligible?');
    if (r) {
        $.ajax('eligible', {
            cache: false,
            data: {
                id: id
            },
            success: function(data) {
                if (data == 'success') {
                    $('#eligibility'+id).html('&nbsp;');
                    $('#eligibilityReason'+id).html('&nbsp;');
                    $('#eligibilityLink'+id).html('<a href="#" class="ineligible" id="ineligible'+id+'" contestantId="'+id+'">Mark ineligible</a>');
                }
            },
            error: function(request, status, error) {
                alert('There was an error processing your request: ' + error);
            }
        });
    }
});

$('.ineligible').live('click', function(e) {
    event.preventDefault();
    var id = this.getAttribute('contestantId');
    var reason = prompt('Enter the inegibility reason (or you can cancel)','Not eligible');
    $.ajax('ineligible', {
        cache: false,
        data: {
            id: id,
            reason: reason
        },
        success: function(data) {
            if (data == 'success') {
                $('#eligibility'+id).html('Yes');
                $('#eligibilityReason'+id).html(reason);
                $('#eligibilityLink'+id).html('<a href="#" class="eligible" id="eligible'+id+'" contestantId="'+id+'">Mark eligible</a>');
            }
        },
        error: function(request, status, error) {
            alert('There was an error processing your request: ' + error);
        }
    });
});