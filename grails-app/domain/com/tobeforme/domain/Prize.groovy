package com.tobeforme.domain

class Prize {
    
    int prio
    String name
    String description

    static constraints = {
        prio unique: true
        name unique: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'prize_id_sequence']
    }
}
