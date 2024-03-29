$('.templateLink').click(function(e) {
    e.preventDefault();
    if (!this.hasAttribute('href')) return;
    if ($('#editSelectedTemplate').attr('href') == undefined && $('#saveSelectedTemplate').attr('href') != undefined) {
        toggleAnchor($('#editSelectedTemplate'));
        toggleAnchor($('#saveSelectedTemplate'));
    }
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
            toggleAnchor($('#addNewTemplate'));
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
            toggleAnchor($('#addNewTemplate'));
        },
        error: function(request, status, error) {
            $('#selectedTemplate').html(error);
        }
    });
});

$('#saveSelectedTemplate').click(function(e) {
    e.preventDefault();
    if (!this.hasAttribute('href')) return;
    
    var name = $('#selectedTemplate input').val();
    var content = $('#selectedTemplate textarea').val();
    if (name == '' || content == '') return;
    
    var templateId = $('#selectedTemplate').attr('templateId');
    if (templateId != undefined) { // <--- need to figure out right way to do this
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
                toggleAnchor($('#addNewTemplate'));
            },
            error: function(request, status, error) {
                $('#selectedTemplate').html(error);
            }
        });
    } else {
        $.ajax('newTemplate', {
            cache: false,
            data: {
                name: name,
                content: content
            },
            success: function(data) {
                // update the lower area (back to blank?)
                // add the new template to the list of templates at the top
            },
            error: function(request, status, error) {
                // report the error somehow
            }
        });
    }
});

$('#addNewTemplate').click(function(e) {
    e.preventDefault();
    if ($('#editSelectedTemplate').attr('href') == undefined && $('#saveSelectedTemplate').attr('href') != undefined) return;
    $('#selectedTemplate').html(
        '<label>Name</label> <input type="text" id="newTemplateName" /> ' +
        '<label>Content</label> <textarea style="width: 500px; height: 500px;"></textarea>'
    );
    toggleAnchor($('#editSelectedTemplate'));
    toggleAnchor($('#saveSelectedTemplate'));
    $('#selectedTemplateControls').show();
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