package com.tobeforme.domain

class Address {
	
	String address1
	String address2
	String city
	String state
	String postalCode
	String countryCode
	
	static belongsTo = [user:User]

    static constraints = {
    }
}
