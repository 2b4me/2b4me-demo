package com.tobeforme.services

import java.util.UUID
import com.tobeforme.domain.Session

class SessionService {

    def generateSessionId() {
        return UUID.randomUUID().toString()
    }
    
    synchronized getOrCreateSession(sid) {
        def session = Session.findBySessionId(sid)
        if (!session) {
            session = new Session(sessionId: sid, sessionDate: new Date())
            session.writeData([:])
            session.save()
        }
        return session
    }
    
    synchronized updateSession(sid, userId, admin, data) {
        def session = Session.findBySessionId(sid)
        session.userId = userId
        session.admin = admin
        session.writeData(data)
        session.save()
        return session
    }
    
}
