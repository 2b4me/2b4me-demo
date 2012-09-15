package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class AdminController {
    
    def loginService
    def sessionService
    def vendorService
    def staticDataService

    def index() { }
    
    def deals() {
        def dealAdded = false
        if (request.data.dealAdded) {
            request.data.dealAdded = null
            dealAdded = true
        }
        return [deals: Deal.list(), dealAdded: dealAdded]
    }
    
    def addDeal() {
        if (!params.formSubmitted) {
            return [vendors: Vendor.list(),
                    categories: Category.list()]
        }
        
        // binding
        def data = [:]
        data.vendorId = params.vendorId
        data.shortName = params.shortName?.toLowerCase()
        data.title = params.title
        data.teaser = params.teaser
        data.hoverTitle = params.hoverTitle
        data.hoverTeaser = params.hoverTeaser
    	data.originalPrice = params.originalPrice
    	data.price = params.price
    	data.categoryId = params.categoryId
    	data.effectiveDate = params.effectiveDate
    	data.expirationDate = params.expirationDate
        
        // validation
        def errors = [] as Set
        data.values().each { if (it == '') errors << 'All fields must be filled' }
        if (data.shortName.indexOf(' ') != -1) errors << 'Short name cannot have any spaces'
        if (!errors.isEmpty()) return [vendors: Vendor.list(),
                            categories: Category.list(),
                            data: data, errors: errors]
        
        // do the work
        try {
            vendorService.saveVendor(data)
        } catch (Exception e) {
            log.debug "There was an exeption trying to add the vendor: ${e}"
            errors << 'There was a problem saving the vendor; please try again in a few minutes'
            return [vendors: Vendor.list(),
                    categories: Category.list(),
                    data: data, errors: errors]
        }
        
        request.data.dealAdded = true
        redirect action: 'deals'
    }
    
    /*   
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
     */
    
    def vendors() {
        def vendorAdded = false
        if (request.data.vendorAdded) {
            request.data.vendorAdded = null
            vendorAdded = true
        }
        return [vendors: Vendor.list(), vendorAdded: vendorAdded]
    }
    
    def addVendor() {
        if (!params.formSubmitted) {
            return [states: staticDataService.states(),
                    countries: staticDataService.countries()]
        }
        
        // binding
        def data = [:]
        data.vendorCode = params.vendorCode
        data.vendorName = params.vendorName
        data.vendorAddress1 = params.vendorAddress1
        data.vendorAddress2 = params.vendorAddress2
        data.vendorCity = params.vendorCity
        data.vendorState = params.vendorState
        data.vendorZipCode = params.vendorZipCode
        data.vendorCountry = params.vendorCountry
        
        // binding cleanup
        if (data.vendorAddress2 == '') data.vendorAddress2 = ' '
        
        // validation
        def error
        data.values().each {
            if (it == '' && !error) {
                error = 'All fields must be filled'
            }
        }
        if (!error) {
            if (!(data.vendorCode =~ /[A-Z0-9][A-Z0-9]/) || data.vendorCode.size() != 2) {
                error = 'Vendor code must be two capital letters'
            }
        }
        if (error) return [states: staticDataService.states(),
                           countries: staticDataService.countries(),
                           data: data, error: error]
        
        // do the work
        try {
            vendorService.saveVendor(data)
        } catch (Exception e) {
            log.debug "There was an exeption trying to add the vendor: ${e}"
            error = 'There was a problem saving the vendor; please try again in a few minutes'
            return [states: staticDataService.states(),
                    countries: staticDataService.countries(),
                    data: data, error: error]
        }
        
        request.data.vendorAdded = true
        redirect action: 'vendors'
    }
    
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
