package com.tobeforme.domain

class NextDrawing {
    
    Date date

    static constraints = {
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'next_drawing_id_sequence']
    }
}
