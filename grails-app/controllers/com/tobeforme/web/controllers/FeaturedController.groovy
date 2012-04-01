package com.tobeforme.web.controllers

class FeaturedController {

    def index() {
		deals = Deal.list()
		[deals: deals]
	}
}
