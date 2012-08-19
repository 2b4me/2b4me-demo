package com.tobeforme.filters

import com.tobeforme.domain.*

class SecurityFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
        
        loginCheck(controller: 'admin', action: '*') {
            before = {
                def session = Session.findBySessionId(session.id)
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
