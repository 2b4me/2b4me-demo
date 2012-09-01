package com.tobeforme.filters

import com.tobeforme.domain.*
import javax.servlet.http.Cookie

class SecurityFilters {
    
    def sessionService

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                /*
                println "Headers:"
                def n = request.headerNames
                while (n.hasMoreElements()) {
                    def e = n.nextElement()
                    println "${e}: ${request.getHeader(e)}"
                }
                 */
                
                /*
                log.debug "Controller: ${controllerName}, Action: ${actionName}"
                
                // invalidate the typical session, ensuring we're full on the custom
                // persisted session I've built
                session.invalidate()
                
                // synchronize the state of the Session
                Session.refresh()
                
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
                def sess = Session.findBySessionId(request.sessionId)
                if (!sess) {
                    flash.in = [:]
                    sess = new Session(sessionId: request.sessionId, sessionDate: new Date())
                    sess.save()
                } else {
                    log.debug "Session exists, reading flash now: ${sess.readFlash()}"
                    flash.in = sess.readFlash()
                    if (!flash.in) flash.in = [:]
                }
                
                request.sess = sess
                 */
            }
        }
        
        cleanSession(controller: 'admin', acion: 'writeFlash') {
            afterView = { Exception e ->
                /*
                // save flash scope, if present, otherwise clear it
                if (flash.out) {
                    log.debug "Flash found, writing it now: ${flash.out}"
                    request.sess.writeFlash(flash.out)
                    request.sess.save()
                } else {
                    request.sess.flash = null
                    request.sess.save()
                }
                 */
            }
        }
        
        adminLoginCheck(controller: 'admin', action: '*') {
            before = {
                def session = request.sess
                if ((!session || !session.admin) && actionName != "login" &&
                        actionName != 'writeFlash') {
                    redirect(controller: "admin", action: "login")
                    return false
                } else {
                    return true
                }
            }
        }
    }

}
