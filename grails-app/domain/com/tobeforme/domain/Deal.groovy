package com.tobeforme.domain

class Deal {

	String shortName
	String hoverTitle
	String hoverTeaser
	String title
	String teaser
	double originalPrice
	double price
	Category category
	
	static constraints = {
    }

	static mapping = {
		teaser sqlType: 'text'
	}
	
	def discountInPct() {
		def diff = price/originalPrice
		def pct = (1.0 - diff) * 100
		return Math.round(pct)
	}
	
}
