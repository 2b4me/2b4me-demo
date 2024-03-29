package com.tobeforme.domain

class Subscription implements Serializable {
	
	String code
	String name

    static constraints = {
        code unique: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'subscription_id_sequence']
    }
    
    boolean equals(Object obj) {
        // if (this == obj) return true
        if (!(obj instanceof Subscription)) return false
        def otherSub = (Subscription)obj
        return (this.id == null ? otherSub.id == null : this.id == otherSub.id)
    }
    
    int hashCode() {
        return 37*17 + (int)(id ^ (id >>> 32))
    }
    
}
