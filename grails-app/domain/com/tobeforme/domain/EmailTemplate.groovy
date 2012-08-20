package com.tobeforme.domain

class EmailTemplate {
    
    String name
    String content

    static constraints = {
        name unique: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'email_template_id_sequence']
        content sqlType: 'text'
    }
    
}
