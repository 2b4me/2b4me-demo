package com.tobeforme.domain

class Prize {
    
    String name

    static constraints = {
        name unique: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'prize_id_sequence']
    }
}
