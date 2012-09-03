package com.tobeforme.services

import java.util.UUID
import com.tobeforme.domain.Session

class SessionService {

    synchronized getOrCreateSession(sid) {
        def session
        if (!sid) {
            session = createSession()
        } else {
            // log.debug 'Grabbing an already created session using sid ' + sid
            session = Session.findBySessionId(sid)
            if (!session) {
                // log.debug 'Could not find the session'
                session = createSession(sid)
            } else {
                // log.debug 'Session found'
            }
        }
        return session
    }
    
    synchronized createSession(sid) {
        if (!sid) sid = UUID.randomUUID().toString()
        // log.debug 'Creating a new session: ' + sid
        def session = new Session(sessionId: sid, sessionDate: new Date())
        session.writeData([:])
        session.save()
        return session
    }
    
    synchronized updateSession(sid, userId, admin, data) {
        // log.debug "Updating session - sid: ${sid}, userId: ${userId}, admin: ${admin}, data: ${data}"
        def session = Session.findBySessionId(sid)
        if (session) {
            session.userId = userId
            session.admin = (admin == null ? false : admin)
            session.writeData(data)
            session.save()
        }
        return session
    }
    
    synchronized deleteSession(sid) {
        def session = Session.findBySessionId(sid)
        session.delete()
        return null
    }
    
}
