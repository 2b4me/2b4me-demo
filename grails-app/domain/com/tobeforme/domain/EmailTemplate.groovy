package com.tobeforme.domain

class EmailTemplate {
    
    String name
    String content
    
    static mapping = {
		content sqlType: 'text'
	}

    static constraints = {
        name unique: true
    }
}
