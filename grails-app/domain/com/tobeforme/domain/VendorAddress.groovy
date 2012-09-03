package com.tobeforme.domain

class VendorAddress implements Serializable {
    
    String address1
    String address2
    String city
    String state
    String postalCode
    String countryCode

    static constraints = {
        address1 unique: ['address2','city','state','postalCode','countryCode']
        address2 blank: true
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'vendor_address_id_sequence']
    }
    
}
