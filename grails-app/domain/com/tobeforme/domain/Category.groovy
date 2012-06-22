package com.tobeforme.domain

class Category implements Serializable {
	
	String name
	int prio
	
	static hasMany = [deals: Deal]

    static constraints = {
        name unique: true
        prio unique: true
    }
}
