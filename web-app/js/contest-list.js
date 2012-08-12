$('#entry').click(function(e) {
    event.preventDefault();
    var id = this.getAttribute('contestantId');
    var entry = prompt('If you would like to assign a new number, type it in. Otherwise, cancel.','00000');
    if (entry == '00000') {
        alert('Value of 00000 is not valid.');
        return;
    }
    
    $.ajax('changeNumber', {
        cache: false,
        data: {
            id: id,
            entry: entry
        },
        error: function(request, status, error) {
            alert('There was an error processing your request: ' + error);
        }
    }).done(function(data) {
        if (data == 'success') {
            $('#entry').html(entry);
        }
        
        if (data == 'error') {
            alert('There was an error processing your request');
        }
    });
});

$('#eligible').live('click', function(e) {
    event.preventDefault();
    var id = this.getAttribute('contestantId');
    var r = confirm('Are you sure you want to mark this contestant eligible?');
    if (r) {
        $.ajax('eligible', {
            cache: false,
            data: {
                id: id
            },
            error: function(request, status, error) {
                alert('There was an error processing your request: ' + error);
            }
        }).done(function(data) {
            if (data == 'success') {
                $('#eligibility').html('&nbsp;');
                $('#eligibilityReason').html('&nbsp;');
                $('#eligibilityLink').html('<a href="#" id="ineligible" contestantId="'+id+'">Mark ineligible</a>');
            } 
        });
    }
});

$('#ineligible').live('click', function(e) {
    event.preventDefault();
    var id = this.getAttribute('contestantId');
    var reason = prompt('Enter the inegibility reason (or you can cancel)','Not eligible');
    $.ajax('ineligible', {
        cache: false,
        data: {
            id: id,
            reason: reason
        },
        error: function(request, status, error) {
            alert('There was an error processing your request: ' + error);
        }
    }).done(function(data) {
        if (data == 'success') {
            $('#eligibility').html('Yes');
            $('#eligibilityReason').html(reason);
            $('#eligibilityLink').html('<a href="#" id="eligible" contestantId="'+id+'">Mark eligible</a>');
        }
    });
});