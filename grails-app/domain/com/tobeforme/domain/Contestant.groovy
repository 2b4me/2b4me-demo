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
}
