package com.tobeforme.domain

class EmailTemplate {
    
    String name
    String content

    static constraints = {
        name unique: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [name: 'email_template_sequence', 
                    sequenceName: 'email_template_sequence',
                    initialValue: 1,
                    allocationSize: 1]
        content sqlType: 'text'
    }
    
}
