package com.tobeforme.web.controllers

import com.tobeforme.domain.*
import com.tobeforme.services.BCryptService

class UserController {
    
    def loginService
    
    def index() {
        redirect action: 'signup'
    }
    
    def signup() { }
    
    def loginForm() { }
    
    def registration() {
        if (User.findByEmailAddress(params.emailAddress)) {
            request.session2.writeFlash([error: 'Email address already exists'])
            request.session2.save(flush: true)
            redirect action: 'signup'
            return
        }
        
        def password = BCryptService.hashpw(params.password, BCryptService.gensalt(4))
        def user = new User(emailAddress: params.emailAddress, password: password)
        if (user.save()) {
            request.session2.writeFlash([userId: user.id])
            request.session2.save(flush: true)
            redirect action: 'registrationComplete'
        } else {
            def msg = 'Oops... there was a problem creating your account. ' +
                      'Please try again in a few minutes.'
            request.session2.writeFlash([error: msg])
            request.session2.save(flush: true)
            redirect action: 'signup'
        }
    }
    
    def registrationComplete() {
        def userId = request.session2.readFlash().userId
        if (!userId) {
            throw new IllegalStateException('Not allowed')
        }
        def user = User.get(userId)
        loginService.createSession(request.sessionId, user.id, user.admin)
    }
    
    def login() {
        if (params.username == '' || params.password == '') {
            log.debug 'Username and/or password were blank'
            def err = 'Username and password must be supplied'
            render('Error')
        }
        
        try {
            loginService.login(params.username, params.password, request.sessionId)
            render('Success')
        } catch (SecurityException e) {
            log.debug "There was a security exception trying to log on user ${params.username}: ${e}"
            render('Error')
        }
    }
    
    def logout() {
        loginService.logout(request.sessionId)
        render('Success')
    }
    
}