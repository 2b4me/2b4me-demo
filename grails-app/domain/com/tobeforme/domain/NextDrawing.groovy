package com.tobeforme.domain

class NextDrawing {
    
    String code
    Date date

    static constraints = {
        code unique: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'next_drawing_id_sequence']
    }
}
