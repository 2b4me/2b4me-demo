package com.tobeforme.services

import com.tobeforme.domain.*

class LoginService {
    
    def login(username, password) {
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
        return u
    }
    
}
