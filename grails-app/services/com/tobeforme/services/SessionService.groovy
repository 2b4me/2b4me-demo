package com.tobeforme.services

import java.util.UUID
import com.tobeforme.domain.Session

class SessionService {

    synchronized getOrCreateSession(sid) {
        def session
        if (!sid) {
            session = createSession()
        } else {
            try {
                session = Session.findBySessionId(sid)
            } catch (Exception e) {
                log.debug "Caught an exception trying to find a session by session ID ${sid}: ${e}"
                session = null
            }
            if (!session) {
                session = createSession(sid)
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
    
    synchronized cleanSession(sid) {
        def session = Session.findBySessionId(sid)
        if (session) {
            def m = session.readData()
            def keys = m.keySet()
            def keysToRemove = []
            m.keySet().each { if (m.get(it) == null) keysToRemove << it }
            keysToRemove.each { m.remove(it) }
            session.writeData(m)
        }
    }
    
    synchronized deleteSession(sid) {
        def session = Session.findBySessionId(sid)
        session.delete()
        return null
    }
    
}
