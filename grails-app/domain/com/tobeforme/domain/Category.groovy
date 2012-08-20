package com.tobeforme.domain

class Category implements Serializable {
	
	String name
	int prio
	
	static hasMany = [deals: Deal]

    static constraints = {
        name unique: true
        prio unique: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [name: 'category_sequence', 
                    sequenceName: 'category_sequence',
                    initialValue: 1,
                    allocationSize: 1]
    }
    
}
