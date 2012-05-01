package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class BrowseController {

    def index() {
		def deals = Deal.list(max: 4)
		def categories = Category.list()
		def selectedCategory = 0
		if (params.cat) {
			selectedCategory = params.cat
		}
		[deals: deals, categories: categories, selectedCategory: selectedCategory]
	}

}
