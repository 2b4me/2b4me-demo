package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class AdminController {
    
    def loginService
    def sessionService

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
        [u: User.get(request.userId)]
    }
    
    def sidebarMenu() { }
    
    def login() {
        if (!params.login) {
            return [cn: params.cn, an: params.an]
        }
        
        if (params.login) {
            if (params.username == '' || params.password == '') {
                log.debug 'Username and/or password were blank'
                def err = 'Username and password must be supplied'
                return [err: err, cn: params.cn, an: params.an]
            }
            
            try {
                def u = loginService.login(params.username, params.password)
                request.userId = u.id
                request.admin = u.admin
                if (params.cn) {
                    redirect(controller: params.cn, action: params.an)
                } else {
                    redirect(action: 'index')
                }
            } catch (SecurityException e) {
                log.debug "There was a security exception trying to log on user ${params.username}: ${e}"
                def err = 'Username or password incorrect; please try again'
                return [err: err, cn: params.cn, an: params.an]
            }
        }
    }
    
    def logout() {
        sessionService.deleteSession(request.sid)
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
