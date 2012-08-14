$('.templateLink').click(function(e) {
    e.preventDefault();
    var templateId = this.getAttribute('templateId');
    $.ajax('templateContent', {
        cache: false,
        data: {
            id: templateId
        },
        success: function(data) {
            $('#selectedTemplate').attr('templateId', templateId);
            $('#selectedTemplate').html(data);
            $('#selectedTemplateControls').show();
        },
        error: function(request, status, error) {
            $('#selectedTemplate').html(error);
        }
    });
});

$('#editSelectedTemplate').click(function(e) {
    e.preventDefault();
    var templateId = $('#selectedTemplate').attr('templateId');
    $.ajax('templateContent', {
        cache: false,
        data: {
            id: templateId
        },
        success: function(data) {
            $('#selectedTemplate').html(
                '<textarea style="width: 500px; height: 500px;">' +
                data + '</textarea>'
            );
        },
        error: function(request, status, error) {
            $('#selectedTemplate').html(error);
        }
    });
    
});

$('#viewSelectedTemplate').click(function(e) {
    e.preventDefault();
    var templateId = $('#selectedTemplate').attr('templateId');
    $.ajax('templateContent', {
        cache: false,
        data: {
            id: templateId
        },
        success: function(data) {
            $('#selectedTemplate').html(data);
        },
        error: function(request, status, error) {
            $('#selectedTemplate').html(error);
        }
    });
});

$('#saveSelectedTemplate').click(function(e) {
    e.preventDefault();
    var content = $('#selectedTemplate textarea').val();
    if (content == null) {
        return;
    }
    var templateId = $('#selectedTemplate').attr('templateId');
    $.ajax('saveTemplateContent', {
        cache: false,
        data: {
            id: templateId,
            content: content
        },
        success: function(data) {
            $('#selectedTemplate').html(data);
        },
        error: function(request, status, error) {
            $('#selectedTemplate').html(error);
        }
    });
});