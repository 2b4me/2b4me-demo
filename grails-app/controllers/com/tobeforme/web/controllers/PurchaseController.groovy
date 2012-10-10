package com.tobeforme.web.controllers

import com.tobeforme.domain.*;

class PurchaseController {
    
    def staticDataService
    
    def index() {
        log.debug '/purchase/index not supported'
        redirect controller: 'featured', action: 'index'
    }

    def deal() {
        if (!params.id) {
            log.debug 'Tried to make a purchase without picking a deal'
            redirect controller: 'featured', action: 'index'
            return
        }
        
        if (!request.userId) {
            log.debug 'Tried to make a purchase without being logged in; '+
                      'redirect to log in page first'
            request.data.targetController = 'purchase'
            request.data.targetAction = 'deal'
            request.data.targetId = params.id
            redirect controller: 'user', action: 'login'
            return
        }
        
        def user = User.get(request.userId)
        def deal = Deal.findByShortName(params.id)
        def states = staticDataService.states()
        def data = [:]
        def errors = [:]
        
        if (!params.continue) {
            return [user: user, deal: deal, states: states,
                    data: data, errors: errors]
        }
        
        // data binding
        
        // validation
        
        // process payment
        
        // redirect to review order to confirm
    }
}
