package com.tobeforme.filters

import com.tobeforme.domain.*
import javax.servlet.http.Cookie

class SecurityFilters {
    
    def sessionService

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                log.debug "Controller: ${controllerName}, Action: ${actionName}"
                
                def cookie
                request.cookies.each {
                    if (it.name == '2b4me_session') cookie = it
                }
                if (!cookie) {
                    cookie = new Cookie('2b4me_session', sessionService.generateSession())
                }
                cookie.maxAge = 60*15 // 15 minutes idle invalidates the cookie
                response.addCookie(cookie)
                
                def session = Session.findBySessionId(cookie.value)
                if (!session) {
                    session = new Session(sessionId: cookie.value, sessionDate: new Date())
                    session.writeData([:])
                    session.save()
                }
                
                request.sid = session.sessionId
                request.userId = session.userId
                request.admin = session.admin
                request.data = session.readData()
            }
            after = {
                def session = Session.findBySessionId(request.sid)
                session.userId = request.userId
                session.admin = request.admin
                session.writeData(request.data)
                session.save()
            }
        }
        
        adminLoginCheck(controller: 'admin', action: '*') {
            before = {
                def session = request.sess
                if ((!session || !session.admin) && actionName != "login") {
                    redirect(controller: "admin", action: "login")
                    return false
                } else {
                    return true
                }
            }
        }
    }

}
