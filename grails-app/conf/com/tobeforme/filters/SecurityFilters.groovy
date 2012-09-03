package com.tobeforme.filters

import com.tobeforme.domain.*
import javax.servlet.http.Cookie

class SecurityFilters {
    
    def sessionService

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                log.debug "Before - /${controllerName}/${actionName}"
                
                def cookie
                request.cookies.each {
                    if (it.name == '2b4me_session') cookie = it
                }
                
                def session
                
                if (cookie) {
                    session = sessionService.getOrCreateSession(cookie.value)
                    cookie.value = session.sessionId
                } else {
                    session = sessionService.getOrCreateSession(request.sid)
                    cookie = new Cookie('2b4me_session', session.sessionId)
                }
                
                log.debug "Session: ${session}"
                
                cookie.path = '/'
                cookie.maxAge = 60*15 // 15 minutes
                response.addCookie(cookie)
                
                request.sid = session.sessionId
                request.userId = session.userId
                request.admin = session.admin
                request.data = session.readData()
                
                if (controllerName in ['admin','contest']) {
                    if ((!request.userId || !request.admin) && actionName != 'login') {
                        forward(controller: 'admin', action: 'login', params: [cn: controllerName, an: actionName])
                    }
                }
            }
            after = {
                log.debug "After - /${controllerName}/${actionName}"
                sessionService.updateSession(request.sid, request.userId, request.admin, request.data)
            }
        }
    }

}
