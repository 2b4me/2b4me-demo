package com.tobeforme.domain

class Vendor implements Serializable {
    
    String code
    String name
    Address address
    
    static hasMany = [deals: Deal]
    
    static constraints = {
        code matches: '([A-Z]|[0-9])([A-Z]|[0-9])', unique: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [name: 'vendor_sequence', 
                    sequenceName: 'vendor_sequence',
                    initialValue: 1,
                    allocationSize: 1]
    }
    
}
