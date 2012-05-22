package com.tobeforme.filters

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
				if (!session.admin && actionName != "login") {
					redirect(controller: "admin", action: "login")
					return false
                }
            }
		}
    }

}
