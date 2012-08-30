package com.tobeforme.filters

import com.tobeforme.domain.*
import javax.servlet.http.Cookie

class SecurityFilters {
    
    def sessionService

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                log.debug request.requestURI
                
                // invalidate the typical session, ensuring we're full on the custom
                // persisted session I've built
                session.invalidate()
                
                // get the session id, or generate one
                def sessionId
                request.cookies.each {
                    if (it.name == '2b4me_session') sessionId = it.value
                }
                if (!sessionId) {
                    sessionId = sessionService.generateSession() // create new session id
                }
                
                // refresh cookie
                def c = new Cookie('2b4me_session', sessionId)
                c.maxAge = 60*15 // 15 minutes idle invalidates the cookie
                response.addCookie(c)
                
                // set request scope session id
                request.sessionId = sessionId
                
                // set the request scope session
                def session = Session.findBySessionId(request.sessionId)
                if (!session) {
                    log.debug 'Creating new session'
                    session = new Session(sessionId: request.sessionId, sessionDate: new Date())
                    session.save()
                } else {
                    log.debug 'Session already created: ' + session.sessionId
                    
                    // restore flash scope
                    flash.obj = session.readFlash()
                    log.debug 'Flash: ' + flash.obj
                    session.flash = null
                    session.save()
                }
                
                request.sess = session
            }
            after = { Map model ->
                // save flash scope
                if (flash.obj) {
                    request.sess.writeFlash(flash.obj)
                    request.sess.save()
                }
            }
            afterView = { Exception e ->

            }
        }
        
        loginCheck(controller: 'admin', action: '*') {
            before = {
                def session = request.sess
                if ((!session || !session.admin) && actionName != "login") {
                    redirect(controller: "admin", action: "login")
                    return false
                } else {
                    // we have a valid session, let the request through
                    return true
                }
            }
        }
    }

}
