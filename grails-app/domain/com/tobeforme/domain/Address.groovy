package com.tobeforme.domain

class Address implements Serializable {
    
    String address1
    String address2
    String city
    String state
    String postalCode
    String countryCode

    static constraints = {
        address1 unique: ['address2','city','state','postalCode','countryCode']
    }
    
    static mapping = {
        id generator: 'sequence',
           params: [sequence: 'address_id_sequence']
    }
    
}
