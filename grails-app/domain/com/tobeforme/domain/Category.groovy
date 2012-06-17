package com.tobeforme.domain

class Category {
	
	String name
	int prio
	
	static hasMany = [deals: Deal]

    static constraints = {
        name unique: true
        prio unique: true
    }
}
