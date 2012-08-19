package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class AdminController {
    
    def loginService

    def index() { }
    
    def addDealFlow = {
        
        start {
            action {
                [categories: Category.list()]
            }
            on('success').to 'details'
        }
        
        details {
            on('continue') {
                
            }.to 'images'
        }
        
        images {
            on('continue') {
                [vendors: Vendor.list()]
            }.to 'vendor'
            on('back').to 'details'
        }
        
        vendor {
            on('continue') {
                
            }.to 'review'
            on('back').to 'images'
        }
        
        review {
            on('continue') {
                
            }.to 'confirmation'
            on('details').to 'details'
            on('images').to 'images'
            on('back').to 'vendor'
        }
        
        confirmation()
        
    }
    
    def addVendor() { }
    
    def topMenu() {
        def s = Session.findBySessionId(session.id)
        [u: User.get(s.userId)]
    }
    
    def sidebarMenu() { }
    
    def login() {
        if (params.login) {
            log.debug "'${params.username}'"
            log.debug "'${params.password}'"
            
            if (params.username == '' || params.password == '') {
                log.debug 'Username and/or password were blank'
                def err = 'Username and password must be supplied'
                return [err: err]
            }
            
            try {
                loginService.login(params.username, params.password, session.id)
                redirect(action:'index')
            } catch (SecurityException e) {
                log.debug "There was a security exception trying to log on user ${params.username}: ${e}"
                def err = 'Username or password incorrect; please try again'
                return [err: err]
            }
        }
    }
    
    def logout() {
        loginService.logout(session.id)
        redirect(action: 'login')
    }
    
    def users() {
        [users: User.list()]
    }
    
}

class DealDetailsCommand {
    String shortName
    
}

class DealImagesCommand {
    
}

class DealVendorCommand {
    
}
