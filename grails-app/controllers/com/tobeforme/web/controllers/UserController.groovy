package com.tobeforme.web.controllers

import com.tobeforme.domain.*
import com.tobeforme.services.BCryptService

class UserController {
    
    def loginService
    def validatorService
    def sessionService
    def userService
    
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
        def user = new User(emailAddress: params.emailAddress, password: password,
                            registrationKey: userService.generateRegistrationKey())
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
        userService.sendConfirmationEmail(userId)
        request.userId = request.data.userId
        if (!userId) {
            throw new IllegalStateException('Not allowed')
        }
    }
    
    def confirm() {
        def errors = [:]
        def data = [:]
        
        log.debug "formSubmitted: ${params.formSubmitted}"
        
        if (!params.formSubmitted && !params.key) {
            return [errors: errors, data: data]
        }
        
        if (!params.key) {
            log.debug 'Key field is blank and this is not supported'
            errors.put 'Key blank', 'Please enter a key to confirm your account'
            return [errors: errors, data: data]
        }
        
        def user = User.findByRegistrationKey(params.key)
        if (user) {
            if (!user.confirmed) {
                user.confirmed = true
                render template: 'confirmComplete', model: [:]
            } else {
                errors.put 'User already registered', 'The account associated with this key has already been activated'
                data.put ('key', params.key)
                return [errors: errors, data: data]
            }
        } else {
            errors.put 'Key invalid', 'The key you entered was not found'
            data.put ('key', params.key)
            return [errors: errors, data: data]
        }
    }
    
    def login() {
        if (!params.username) {
            def err = request.data.loginError; request.data.loginError = null
            def targetController = request.data.targetController; request.data.targetController = null
            if (!targetController && params.cn) targetController = params.cn
            def targetAction = request.data.targetAction; request.data.targetAction = null
            if (!targetAction && params.an) targetAction = params.an
            def targetId = request.data.targetId; request.data.targetId = null
            log.debug "targetController: ${targetController}"
            log.debug "targetAction: ${targetAction}"
            log.debug "targetId: ${targetId}"
            return [err: err, targetController: targetController, targetAction: targetAction, targetId: targetId]
        }
        
        if (params.username == '' || params.password == '') {
            log.debug 'Username and/or password were blank'
            def err = 'Username and password must be supplied'
            render('Error')
        }
        
        try {
            def u = loginService.login(params.username, params.password)
            request.userId = u.id
            request.admin = u.admin
            render('Success')
        } catch (SecurityException e) {
            log.debug "There was a security exception trying to log on user ${params.username}: ${e}"
            render('Error')
        }
    }
    
    def logout() {
        sessionService.deleteSession(request.sid)
        render('Success')
    }
    
    def processLoginForm() {
        if (params.username == '' || params.password == '') {
            request.data.loginError = 'Username and/or password were blank'
            redirect action: 'login'
            return
        }
        
        def targetController = params.targetController ? params.targetController : 'featured'
        def targetAction = params.targetAction ? params.targetAction : 'index'
        def targetId = params.targetId ? params.targetId : null
        
        try {
            def u = loginService.login(params.username, params.password)
            request.userId = u.id
            request.admin = u.admin
            if (targetId) {
                redirect controller: targetController, action: targetAction, id: targetId
            } else {
                redirect controller: targetController, action: targetAction
            }
        } catch (SecurityException e) {
            log.debug "There was a security exception trying to log on user ${params.username}: ${e}"
            request.data.loginError = 'Username and/or password not found'
            redirect action: 'login'
        }
    }
    
}