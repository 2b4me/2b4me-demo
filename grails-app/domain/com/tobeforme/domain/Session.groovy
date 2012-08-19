package com.tobeforme.domain

class Session implements Serializable {
    
    String sessionId
    String userId
    Date sessionDate
    boolean admin
    
    static constraints = {
    }
}
