package com.tobeforme.domain

class Deal implements Serializable {

	String shortName
	String hoverTitle
	String hoverTeaser
	String title
	String teaser
	double originalPrice
	double price
	Category category
	Date effective
	Date expiration
	String fullDescription
	
	static hasMany = [terms: String]
	
	static belongsTo = [vendor: Vendor]
	
	static constraints = {
	    shortName unique: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'deal_id_sequence']
        teaser sqlType: 'text'
        fullDescription sqlType: 'text'
        hasMany joinTable: [name: 'deal_terms',
                            key: 'deal_id',
                            column: 'term',
                            type: "text"]
    }
	
	def discountInPct() {
		def diff = price/originalPrice
		def pct = (1.0 - diff) * 100
		return Math.round(pct)
	}
	
}
