$('.templateLink').click(function(e) {
    e.preventDefault();
    if (!this.hasAttribute('href')) return;
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
    if (!this.hasAttribute('href')) return;
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
            toggleAnchor($('#viewSelectedTemplate'));
            toggleAnchor($('#editSelectedTemplate'));
            toggleAnchor($('#saveSelectedTemplate'));
            toggleAnchor($('#deleteSelectedTemplate'));
        },
        error: function(request, status, error) {
            $('#selectedTemplate').html(error);
        }
    });
    
});

$('#viewSelectedTemplate').click(function(e) {
    e.preventDefault();
    if (!this.hasAttribute('href')) return;
    var templateId = $('#selectedTemplate').attr('templateId');
    $.ajax('templateContent', {
        cache: false,
        data: {
            id: templateId
        },
        success: function(data) {
            $('#selectedTemplate').html(data);
            toggleAnchor($('#viewSelectedTemplate'));
            toggleAnchor($('#editSelectedTemplate'));
            toggleAnchor($('#saveSelectedTemplate'));
            toggleAnchor($('#deleteSelectedTemplate'));
        },
        error: function(request, status, error) {
            $('#selectedTemplate').html(error);
        }
    });
});

$('#saveSelectedTemplate').click(function(e) {
    e.preventDefault();
    if (!this.hasAttribute('href')) return;
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
            toggleAnchor($('#viewSelectedTemplate'));
            toggleAnchor($('#editSelectedTemplate'));
            toggleAnchor($('#saveSelectedTemplate'));
            toggleAnchor($('#deleteSelectedTemplate'));
        },
        error: function(request, status, error) {
            $('#selectedTemplate').html(error);
        }
    });
});

function toggleAnchor(anchor) {
    if (anchor.attr('href') == undefined) {
        anchor.attr('href','#');
        anchor.removeAttr('style');
    } else {
        anchor.removeAttr('href');
        anchor.attr('style', 'color: grey; text-decoration: none;');
    }
}