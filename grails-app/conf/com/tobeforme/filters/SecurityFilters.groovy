package com.tobeforme.filters

import com.tobeforme.domain.*
import javax.servlet.http.Cookie

class SecurityFilters {
    
    def sessionService

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                log.debug "Before: Controller: ${controllerName}, Action: ${actionName}"
                
                def cookie
                request.cookies.each {
                    if (it.name == '2b4me_session') cookie = it
                }
                if (!cookie) {
                    cookie = new Cookie('2b4me_session', sessionService.generateSessionId())
                }
                cookie.maxAge = 60*15 // 15 minutes idle invalidates the cookie
                response.addCookie(cookie)
                
                def session = sessionService.getOrCreateSession(cookie.value)
                
                request.sid = session.sessionId
                request.userId = session.userId
                request.admin = session.admin
                request.data = session.readData()
                
                if (controllerName == 'admin') {
                    if ((!request.userId || !request.admin) && actionName != 'login') {
                        redirect(controller: 'admin', action: 'login')
                        return false
                    }
                }
            }
            after = {
                log.debug "After: ${controllerName}, Action: ${actionName}"
                sessionService.updateSession(request.sid, request.userId, request.admin, request.data)
            }
        }
    }

}
