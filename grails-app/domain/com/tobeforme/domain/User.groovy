package com.tobeforme.domain

class User implements Serializable {
	
	String emailAddress
	String password
	String firstName
	String lastName
	
	static hasOne = [address: Address]
	
	static hasMany = [subscriptions: Subscription]

    static constraints = {
        firstName nullable: true
        lastName nullable: true
        address nullable: true
        subscriptions nullable: true
        password size: 8..14, blank: false
        emailAddress  email: true, blank: false, unique: true
    }
    
    static mapping = {
        table '"user"'
        subscriptions lazy: false, joinTable: [name: '"user_subscriptions"',
                                               key: 'user_id',
                                               column: 'subscription_id']
    }
}
