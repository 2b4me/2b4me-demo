package com.tobeforme.web.controllers

import com.tobeforme.domain.*;

class PurchaseController {
    
    def staticDataService
    def creditCardService
    def validatorService
    
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
        data.name = params.name
        data.address1 = params.address1
        data.address2 = params.address2
        data.city = params.city
        data.state = params.state
        data.zipCode = params.zipCode
        data.ccNum = params.ccNum?.replaceAll('[^0-9]+', '')
        data.ccExp = params.ccExp
        data.ccCvv = params.ccCvv
        
        // validation
        if (!validatorService.validateNotBlank(params.name)) {
            errors.put 'name', 'Name cannot be blank'
        }
        if (!validatorService.validateNotBlank(params.address1)) {
            errors.put 'address1', 'Address cannot be blank'
        }
        if (!validatorService.validateNotBlank(params.city)) {
            errors.put 'city', 'City cannot be blank'
        }
        if (!validatorService.validateNotBlank(params.state)) {
            errors.put 'state', 'State cannot be blank'
        }
        if (!validatorService.validateZipCode(params.zipCode)) {
            errors.put 'zipCode', 'Zip Code invalid'
        }
        if (!validatorService.validateCreditCard(params.ccNum,
                creditCardService.getCreditCardType(ccNum))) {
            errors.put 'ccNum', 'Credit card number invalid'
        }
        if (!validatorService.validateCreditCardExpDate(params.ccExp)) {
            errors.put 'ccExp', 'Expiration date format not valid, must be mm/yy'
        }
        if (!validatorService.validateNotBlank(params.ccCvv)) {
            errors.put 'ccCvv', 'CVV2 cannot be blank'
        }
        
        if (!errors.isEmpty()) {
            return [user: user, deal: deal, states: states,
                    data: data, errors: errors]
        }
        
        // save payment details to session
        requests.data.paymentDetails = data
        
        // redirect to review order to confirm
        
    }
}
