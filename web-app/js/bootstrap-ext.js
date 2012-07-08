$('#continueBtn').click(function(event) {
    event.preventDefault();
    $('#_eventId_continue').trigger('click');
});

$('#backBtn').click(function(event) {
    event.preventDefault();
    $('#_eventId_back').trigger('click');
});

$('#detailsBtn').click(function(event) {
    event.preventDefault();
    $('#_eventId_details').trigger('click');
});

$('#imagesBtn').click(function(event) {
    event.preventDefault();
    $('#_eventId_images').trigger('click');
});

$('.nyi').click(function(event) {
    event.preventDefault();
    alert('Not yet implemented.');
});