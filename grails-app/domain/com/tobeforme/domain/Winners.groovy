package com.tobeforme.domain

class Winners {
    
    Prize prize
    
    static hasMany = [winners: Contestant]
    
    static constraints = {
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'winners_id_sequence']
    }
}
