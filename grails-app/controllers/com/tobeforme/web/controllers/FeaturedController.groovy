package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class FeaturedController {
    
    def contestService

    def index() {
        def contest = contestService.generateContestModel()
		def nextDrawingDate = NextDrawing.get(1).date
		def prizes = Prize.list(sort: 'prio', order: 'asc')
        
        [contest: contest, nextDrawingDate: nextDrawingDate, prizes: prizes]
    }
	
	def top() { }
	
	def bottom() { }
	
	def deals() {
		def selectedDealIndex = params.selectedDealIndex?.toInteger()
		if (selectedDealIndex == null || selectedDealIndex > 3) {
			throw new IllegalArgumentException("Selected deal index either null or too high (${params.selectedDealIndex})")
		}
		
		def fdList = FeaturedDeal.list(sort: 'prio', order: 'asc', max: 4)
		def featuredDeal = fdList.get(selectedDealIndex).deal
		def otherDeals = []
		def i = selectedDealIndex
		while (otherDeals.size() != 3) {
			if (i == 3) {
				i = 0
			} else {
				i++
			}
			otherDeals << fdList.get(i).deal
		}
		
		[featuredDeal: featuredDeal, otherDeals: otherDeals, sliderIndex: 1]
	}
	
}
