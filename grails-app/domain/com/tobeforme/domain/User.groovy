package com.tobeforme.domain

class User implements Serializable {
	
	String emailAddress
	String password
	String firstName
	String lastName
	
	static hasOne = [address: Address]
	
	static hasMany = [subscriptions: Subscription]

    static constraints = {
    }
}
