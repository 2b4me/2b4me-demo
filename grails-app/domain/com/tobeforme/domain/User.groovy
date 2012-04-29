package com.tobeforme.domain

class User {
	
	String emailAddress
	String password
	String firstName
	String lastName
	Address address
	
	static hasMany = [subscriptions: Subscription]

    static constraints = {
    }
}
