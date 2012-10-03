package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class DealController {
    
    def transient sessionFactory
    
    def voucherNumberGeneratorService
    
    def loginService
    
    def staticDataService

    def index() {
        def id = params.id
        
        if (id == 'purchase') {
            forward(action: 'purchase')
        }
        
        if (id == 'confirmation') {
            forward(action: 'confirmation')
        }

        if (id == 'deletePurchase') {
            forward(action: 'deletePurchase')
        }
    
        def deal = Deal.findByShortName(params.id)
        // bring some properties into memory form the db
        deal.vendor.name
        deal.vendor.address.address1
        deal.vendor.address.address2
        deal.vendor.address.city
        deal.vendor.address.state
        deal.vendor.address.postalCode
        deal.vendor.address.countryCode
        
        def daysRemaining = staticDataService.daysBetween(new Date(), deal.expiration)
        
        [deal: deal, daysRemaining: daysRemaining]
    }
    
    def relatedDeals() {
        def deal = Deal.get(params.id)
        def relatedDeals = []
        Deal.list().each {
            if (it.id != deal.id) relatedDeals << it
        }
        [relatedDeals: relatedDeals]
    }
    
    def purchaseFlow = {
        
        startFlow {
            action {
                flow.user = User.get(request.data.userId)
                flow.deal = Deal.findByShortName(params.id)
                flow.states = ['FL','CA','DC','NY']
                if (!flow.user) {
                    return login()
                } else {
                    return success()
                }
            }
            on('success').to 'paymentDetails'
            on('login').to 'login'
        }
        
        paymentDetails {
            on('continue') { PaymentDetailsCommand pdc ->
                flow.pdc = pdc
                if (pdc.hasErrors()) {
                    return error()
                }
            }.to 'reviewOrder'
            on('cancel').to 'cancelOrder'
        }
        
        reviewOrder {
            on('continue') {
                def p = new Purchase()
                p.bought = new Date()
                p.deal = flow.deal
                p.buyer = flow.user
                p.voucher = voucherNumberGeneratorService.getNext(flow.deal.vendor.code, flow.user.code())
                p.price = flow.deal.price
                try {
                    p.save(failOnError: true)
                    flow.purchase = p
                } catch (Exception e) {
                    flash.message = "Could not complete the purchase: ${e.message}"
                    return error()
                }
            }.to 'confirmation'
            on('back').to 'paymentDetails'
            on('cancel').to 'cancelOrder'
        }
        
        cancelOrder {
            redirect action: 'index', id: flow.deal.shortName
        }
        
        confirmation {
            redirect action: 'confirmation', id: flow.deal.shortName, params: [purchaseId: flow.purchase.id]
        }
        
        login {
            on('login') { PurchaseLoginCommand cmd ->
                flow.pld = cmd
                def valid = flow.pld.validate()
                
                if (valid) {
                    try {
                        loginService.login(flow.pld.emailAddress, flow.pld.password, request.sessionId)
                    } catch (SecurityException e) {
                        log.debug "There was a security exception trying to log on user ${params.username}: ${e}"
                        valid = false
                    }
                }
                 
                if (!valid) {
                    return error()
                }
            }.to 'paymentDetails'
            on('cancel').to 'cancelOrder'
        }
        
    }
    
    def confirmation() {
        if (params.purchaseId) {
            def purchase = Purchase.get(params.purchaseId)
            def deal = Deal.findByShortName(params.id)
            [deal: deal, purchase: purchase, date: new java.util.Date()]
        } else {
            redirect controller: 'featured', action: 'index'
        }
    }
    
    def deletePurchase() {
        // temporary action to delete a specific deal
        def p = Purchase.get(params.purchaseId)
        try {
            p.delete()
            render "Deleted"
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            render "Could not delete person ${p.name}"
        }
    }
    
    def mapImage() {
        def address = Deal.get(params.id).vendor.address
        def apikey = grailsApplication.config.grails.google.staticmapsapi.key
        
        def encodedAddress = (address.address1+', '+address.city+', '+address.state+' '+address.postalCode).replace(' ','+')
        log.debug encodedAddress
        
        render '<img src="http://maps.googleapis.com/maps/api/staticmap?'+
               'center='+encodedAddress+'&'+
               'zoom=13&'+
               'size='+params.w+'x'+params.h+'&'+
               'maptype=roadmap&'+
               'markers=size%3Amid%7Ccolor%3Ared%7C'+encodedAddress+'&'+
               'sensor=false&'+
               'key='+apikey+
               '" />'
    }
    
    def mapLink() {
        def address = Deal.get(params.id).vendor.address
        def encodedAddress = (address.address1+', '+address.city+', '+address.state+' '+address.postalCode).replace(' ','+')
        def link = 'https://maps.google.com/maps?q='+encodedAddress+'&z=16'
        
        render '<a target="new" href="'+link+'">Map and Directions</a>'
    }
}

class PaymentDetailsCommand implements Serializable {
    String name
    String address1
    String address2
    String city
    String state
    String zipCode
    String ccNum
    String ccExp
    String ccCvv

    static constraints = {
        name(blank: false)
        address1(blank: false)
        city(blank: false)
        state(blank: false)
        zipCode(blank: false)
        ccNum(blank: false)
        ccExp(blank: false)
        ccCvv(blank: false)
    }
}

class PurchaseLoginCommand implements Serializable {
    String emailAddress
    String password
    
    static constraints = {
        emailAddress blank: false, email: true
        password blank: false
    }
}