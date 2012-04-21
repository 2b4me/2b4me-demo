package com.tobeforme.domain

class Deal {

	String hoverTitle
	String hoverTeaser
	String title
	String teaser
	String largeImage
	double originalPrice
	double price
	
	static constraints = {
		largeImage nullable: true
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
