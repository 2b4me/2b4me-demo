package com.tobeforme.domain

class Deal {

    static constraints = {
    }
	
	String hoverTitle
	String hoverTeaser
	String title
	String teaser
	double originalPrice
	double price
	
	def discountInPct() {
		def diff = price/originalPrice
		def pct = (1.0 - diff) * 100
		return Math.round(pct)
	}
	
}
