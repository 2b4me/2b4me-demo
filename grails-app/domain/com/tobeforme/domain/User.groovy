package com.tobeforme.domain

class User {
	
	String emailAddress
	String password
	String firstName
	String lastName
	
	static hasOne = [address: Address]
	
	static hasMany = [subscriptions: Subscription]

    static constraints = {
		address unique: true
    }
}
