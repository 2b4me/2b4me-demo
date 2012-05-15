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
				def dbDeal = Deal.findByShortName(params.id)
				def deal = [:]
				deal.id = dbDeal.id
				deal.shortName = dbDeal.shortName
				deal.title = dbDeal.title
				deal.teaser = dbDeal.teaser
				deal.price = dbDeal.price
				deal.discountInPct = dbDeal.discountInPct()
				flow.deal = deal
			}
			on('success').to 'paymentDetails'
		}
		
		paymentDetails {
			on('continue') {
				def pd = [:]
				pd.name = params.name
				flow.paymentDetails = pd
			}.to 'reviewOrder'
			on('cancel').to 'cancelOrder'
		}
		
		reviewOrder {
			on('continue') {
				
			}.to 'confirmation'
			on('back').to 'paymentDetails'
			on('cancel').to 'cancelOrder'
		}
		
		cancelOrder {
			redirect(action: 'index', id: flow.shortName)
		}
		
		confirmation {
			redirect(action: 'confirmation', id: flow.shortName)
		}
		
	}
	
	def confirmation() {
		[shortName: params.id]
	}
}
