package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class UserController {
    
    def index() { }
    
    def login() {
        def u = User.findByEmailAddress(params.username)
        if (u) {
            if (u.password == params.password) {
                session.user = u
                render('Success')
            } else {
                render('Error')
            }
        } else {
            render('Error')
        }
    }
    
    def logout() {
        session.user = null
        render('Success')
    }

}