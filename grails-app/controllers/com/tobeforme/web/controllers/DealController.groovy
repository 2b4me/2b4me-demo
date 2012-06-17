package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class DealController {
    
    def transient sessionFactory
    
    def voucherNumberGeneratorService

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
        [deal: deal]
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
                flow.user = User.get(session.user)
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
                    p.save(flush: true, failOnError: true)
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
                    def user = User.findByEmailAddress(flow.pld.emailAddress)
                    if (user?.password == flow.pld.password) {
                        session.user = user.id
                        flow.user = user
                    } else {
                        flow.pld.errors.rejectValue('emailAddress',
                            'purchaseLoginCommand.emailAddress.wrongCreds.error')
                        flow.pld.errors.rejectValue('password',
                            'purchaseLoginCommand.emailAddress.wrongCreds.error')
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
            p.delete(flush: true)
            render "Deleted"
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            render "Could not delete person ${p.name}"
        }
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