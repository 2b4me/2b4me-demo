package com.tobeforme.web.controllers

import com.tobeforme.domain.*
import com.tobeforme.services.BCryptService

class UserController {
    
    def loginService
    def validatorService
    
    def index() {
        redirect action: 'signup'
    }
    
    def signup() {
        def error = request.data.error; if (request.data.error) request.data.error = null
        def email = request.data.email; if (request.data.email) request.data.email = null
        def pass1 = request.data.pass1; if (request.data.pass1) request.data.pass1 = null
        def pass2 = request.data.pass2; if (request.data.pass2) request.data.pass2 = null
        [error: error, email: email, pass1: pass1, pass2: pass2]
    }
    
    def loginForm() { }
    
    def registration() {
        if (!validatorService.validateEmailAddress(params.emailAddress)) {
            handleRegistrationError(request, params, 'Email address not valid.')
            redirect action: 'signup'
            return
        }
        
        if (params.password == '') {
            handleRegistrationError(request, params, 'Password field cannot be empty.')
            redirect action: 'signup'
            return
        }
        
        if (params.password2 == '' || params.password != params.password2) {
            handleRegistrationError(request, params, 'The password fields do not match.')
            redirect action: 'signup'
            return
        }
        
        if (User.findByEmailAddress(params.emailAddress)) {
            handleRegistrationError(request, params, 'Email address already exists in our database.')
            redirect action: 'signup'
            return
        }
        
        def password = BCryptService.hashpw(params.password, BCryptService.gensalt(4))
        def user = new User(emailAddress: params.emailAddress, password: password)
        if (user.save()) {
            request.data.userId = user.id
            redirect action: 'registrationComplete'
        } else {
            request.data.error = 'Oops... there was a problem creating your account. ' +
                                 'Please try again in a few minutes.'
            redirect action: 'signup'
        }
    }
    
    def handleRegistrationError(request, params, msg) {
        request.data.error = msg
        request.data.email = params.emailAddress
        request.data.pass1 = params.password
        request.data.pass2 = params.password2
    }
    
    def registrationComplete() {
        def userId = request.data.userId
        if (!userId) {
            throw new IllegalStateException('Not allowed')
        }
    }
    
    def login() {
        if (params.username == '' || params.password == '') {
            log.debug 'Username and/or password were blank'
            def err = 'Username and password must be supplied'
            render('Error')
        }
        
        try {
            def u = loginService.login(params.username, params.password)
            request.data.userId = u.id
            request.data.admin= u.admin
            render('Success')
        } catch (SecurityException e) {
            log.debug "There was a security exception trying to log on user ${params.username}: ${e}"
            render('Error')
        }
    }
    
    def logout() {
        request.data.admin = false
        request.data.userId = null
        render('Success')
    }
    
}