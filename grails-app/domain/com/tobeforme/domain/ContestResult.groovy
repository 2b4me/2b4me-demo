package com.tobeforme.domain

class ContestResult {
    
    String email
    String contestNum
    Date dateWon
    Date dateExpires
    Prize prize
    boolean claimed
    long seed
    
    static constraints = {
        seed nullable: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'contest_result_id_sequence']
    }
    
}
