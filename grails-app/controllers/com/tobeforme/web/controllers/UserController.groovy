package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class UserController {
    
    def index() {
        redirect action: 'signup'
    }
    
    def signup() { }
    
    def loginForm() { }
    
    def registration(SignupCommand cmd) {
        if (User.findByEmailAddress(cmd.emailAddress)) {
            cmd.errors.rejectValue('emailAddress', 'signupCommand.emailAddress.unique.error')
        }
        
        if (cmd.hasErrors()) {
            flash.user = cmd
            redirect action: 'signup'
            return
        }
        
        def user = new User(emailAddress: cmd.emailAddress, password: cmd.password)
        if (user.save()) {
            flash.user = user
            redirect action: 'registrationComplete'
        } else {
            flash.user = cmd
            flash.message = 'Oops... there was a problem creating your account. Please try again in a few minutes.'
            redirect action: 'signup'
        }
    }
    
    def registrationComplete() {
        if (flash.user == null) {
            redirect controller: 'featured', action: 'index'
        }
        session.user = flash.user.id
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

class SignupCommand {
    String emailAddress
    String password
    String password2

    static constraints = {
        importFrom User
        password2 size: 8..14, blank: false, validator: { val, obj -> obj.password == val }
    }
}