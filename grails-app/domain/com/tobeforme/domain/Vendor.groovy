package com.tobeforme.domain

class Vendor implements Serializable {
    
    String code
    String name
    VendorAddress address
    
    static hasMany = [deals: Deal]
    
    static constraints = {
        code matches: '([A-Z]|[0-9])([A-Z]|[0-9])', unique: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'vendor_id_sequence']
    }
    
}
