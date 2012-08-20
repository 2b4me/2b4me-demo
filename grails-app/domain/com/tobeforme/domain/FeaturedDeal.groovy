package com.tobeforme.domain

class FeaturedDeal {
	
	Deal deal
	int prio

    static constraints = {
		prio unique: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [name: 'featured_deal_sequence', 
                    sequenceName: 'featured_deal_sequence',
                    initialValue: 1,
                    allocationSize: 1]
    }
    
}
