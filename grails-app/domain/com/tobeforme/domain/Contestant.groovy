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
           params: [sequence: 'contestant_id_sequence']
    }
    
    boolean equals(Object obj) {
        if (!(obj instanceof Contestant)) return false
        def other = (Contestant)obj
        return (this.id == null ? other.id == null : this.id == other.id)
    }

    int hashCode() {
        return 37*17 + (int)(id ^ (id >>> 32))
    }
    
}
