package com.tobeforme.domain

class Contestant {
    
    String email
    String entry
    Date signupDate
    boolean ineligible
    String ineligibilityReason

    static constraints = {
        email unique: true
        ineligibilityReason nullable: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [name: 'contestant_sequence', 
                    sequenceName: 'contestant_sequence',
                    initialValue: 1,
                    allocationSize: 1]
    }
    
}
