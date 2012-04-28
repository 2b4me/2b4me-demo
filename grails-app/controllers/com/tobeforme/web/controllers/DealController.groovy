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
}
