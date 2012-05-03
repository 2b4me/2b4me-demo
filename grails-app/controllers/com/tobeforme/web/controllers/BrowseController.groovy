package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class BrowseController {

    def index() {
		def selectedCategory = 0
		def selectedCategoryTitle = 'All Deals'
		if (params.cat) {
			selectedCategory = params.cat
			selectedCategoryTitle = Category.get(params.cat).name
		}
		def categories = Category.list()
		
		def deals
		if (selectedCategory == 0) {
			deals = Deal.list(max: 4)
		} else {
			deals = Deal.findAllByCategory(Category.get(selectedCategory), [max: 4])
		}
		
		
		[deals: deals, categories: categories,
		 selectedCategory: selectedCategory,
		 selectedCategoryTitle: selectedCategoryTitle]
	}

}
