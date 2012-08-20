package com.tobeforme.domain

class FeaturedDeal {
	
	Deal deal
	int prio

    static constraints = {
		prio unique: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'featured_deal_id_sequence']
    }
    
}
