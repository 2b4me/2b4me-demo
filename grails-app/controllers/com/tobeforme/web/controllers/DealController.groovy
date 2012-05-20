package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class DealController {
	
	def transient sessionFactory

    def index() {
		def id = params.id
		
		if (id == 'purchase') {
			forward(action: 'purchase')
		}
		
		if (id == 'confirmation') {
			forward(action: 'confirmation')
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
				flow.user = User.findByEmailAddress('daniel@silvanolte.com') // this should come from session
				flow.deal = Deal.findByShortName(params.id)
				flow.states = ['FL','CA','DC','NY']
			}
			on('success').to 'paymentDetails'
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
				p.voucher = '124938573'
				p.price = flow.deal.price
				try {
				    p.save(flush: true, failOnError: true)
				} catch (Exception e) {
				    flash.message = "Could not complete the purchase: ${e.message}"
					return error()
				}
			}.to 'confirmation'
			on('back').to 'paymentDetails'
			on('cancel').to 'cancelOrder'
		}
		
		cancelOrder {
			redirect(action: 'index', id: flow.deal.shortName)
		}
		
		confirmation {
			redirect(action: 'confirmation', id: flow.deal.shortName)
		}
		
	}
	
	def confirmation() {
		def deal = Deal.findByShortName(params.id)
		[deal: deal, date: new java.util.Date()]
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
