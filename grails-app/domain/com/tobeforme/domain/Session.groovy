package com.tobeforme.domain

class Session implements Serializable {
    
    String sessionId
    String userId
    Date sessionDate
    boolean admin
    
    static constraints = {
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [name: 'session_sequence', 
                    sequenceName: 'session_sequence',
                    initialValue: 1,
                    allocationSize: 1]
    }
    
}
