package com.tobeforme.services

import com.tobeforme.domain.*

class LoginService {
    
    def login(username, password, sessionId) {
        log.debug username
        def u = User.findByEmailAddress(username)
        if (!u) {
            throw new SecurityException("User not found")
        }
        if (!BCryptService.checkpw(password, u.password)) {
            throw new SecurityException("Password incorrect")
        }
        def s = new Session()
        s.sessionId = sessionId
        s.userId = u.id
        s.sessionDate = new Date()
        s.admin = u.admin
        s.save()
        return s
    }
    
    def logout(sessionId) {
        def s = Session.findBySessionId(sessionId)
        s.delete(flush: true)
        return true
    }
}
