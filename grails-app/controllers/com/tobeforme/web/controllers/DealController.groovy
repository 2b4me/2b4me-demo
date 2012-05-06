package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class DealController {

    def index() {
		def deal = Deal.findByShortName(params.id)
		def relatedDeals = []
		Deal.list().each {
			if (it.id != deal.id) relatedDeals << it
		}
		[deal: deal, relatedDeals: relatedDeals]
	}
	
	def purchaseFlow = {
		
		startFlow {
			action {
				flow.shortName = params.id
			}
			on('success').to 'paymentDetails'
		}
		
		paymentDetails {
			on('continue') {
				// validate playment details
			}.to 'reviewOrder'
			on('cancel').to 'cancelOrder'
		}
		
		reviewOrder {
			on('continue') {
				// process order
			}.to 'confirmation'
			on('back').to 'paymentDetails'
			on('cancel').to 'cancelOrder'
		}
		
		cancelOrder {
			redirect(controller: 'deal', action: 'index', id: flow.shortName)
		}
		
		confirmation()
		
	}
}
