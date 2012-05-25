package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class UserController {
    
    def index() {
        redirect action: 'signup'
    }
    
    def signup() { }
    
    def loginForm() { }
    
    def registration() {
        def user = new User(params)
        if (user.hasErrors()) {
            flash.user = user
            redirect action: 'signup'
        }
        if (user.save()) { 
            flash.user = user
            redirect action: 'registrationComplete'
        } else {
            flash.user = user
            redirect action: 'signup'
        }
    }
    
    def registrationComplete() {
        if (flash.user == null) {
            redirect controller: 'featured', action: 'index'
        }
    }
    
    def login() {
        def u = User.findByEmailAddress(params.username)
        if (u) {
            if (u.password == params.password) {
                session.user = u.id
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