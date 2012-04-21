package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class FeaturedController {

    def index() {
		def featuredDeals = FeaturedDeal.list(sort: 'prio', order: 'asc', max: 4)
		[featuredDeals: featuredDeals, dealIndex: 0]
	}
	
	def header() {
		
	}
	
}
