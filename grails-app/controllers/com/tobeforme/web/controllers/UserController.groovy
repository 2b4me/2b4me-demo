package com.tobeforme.web.controllers

class UserController {
    
    def index() { }
    
    def login() {
        def u = User.findByLogin(params.login)
        if (u) {
            if (u.password == params.password) {
                session.user = u
                render('Success')
            } else {
                render('Error: Password incorrect')
            }
        } else {
            render('Error: User not found')
        }
    }

}