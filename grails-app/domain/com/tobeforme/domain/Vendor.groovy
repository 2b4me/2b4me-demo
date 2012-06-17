package com.tobeforme.domain

class Vendor implements Serializable {
    
    String code
    String name
    Address address
    
    static hasMany = [deals: Deal]
    
    static constraints = {
        code matches: '([A-Z]|[0-9])([A-Z]|[0-9])'
    }
}
