package com.tobeforme.services

import com.tobeforme.domain.*

class LoginService {
    
    def login(username, password, sessionId) {
        log.debug username
        def u = User.findByEmailAddress(username)
        if (!u) {
            throw new SecurityException("User not found")
        }
        def auth = false
        try {
            auth = BCryptService.checkpw(password, u.password)
        } catch (Exception e) {
            throw new SecurityException(e.message)
        }
        if (!auth) {
            throw new SecurityException("Password incorrect")
        }
        return createSession(sessionId, u.id, u.admin)
    }
    
    def logout(sessionId) {
        def s = Session.findBySessionId(sessionId)
        s.delete()
        return true
    }
    
    def createSession(sessionId, userId, admin) {
        def s = Session.get(sessionId)
        s.userId = userId
        s.admin = admin
        s.save()
        return s
    }
}
