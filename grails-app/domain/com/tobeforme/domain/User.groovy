package com.tobeforme.domain

class User implements Serializable {
	
	String emailAddress
	String password
	String firstName
	String lastName
	Address address
	boolean admin
	
	static hasMany = [subscriptions: Subscription]

    static constraints = {
        firstName nullable: true
        lastName nullable: true
        address nullable: true
        subscriptions nullable: true
        password blank: false
        emailAddress  email: true, blank: false, unique: true
    }
    
    static mapping = {
        table '"user"'
        subscriptions lazy: false, joinTable: [name: '"user_subscriptions"',
                                               key: 'user_id',
                                               column: 'subscription_id']
    }
    
    def code() {
        emailAddress.substring(0,2)
    }
}
