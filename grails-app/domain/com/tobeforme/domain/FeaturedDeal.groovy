package com.tobeforme.domain

class FeaturedDeal {
	
	Deal deal
	int prio

    static constraints = {
		prio unique: true
    }
}
