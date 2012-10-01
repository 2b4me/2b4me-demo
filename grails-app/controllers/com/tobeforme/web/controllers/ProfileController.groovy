package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class ProfileController {
    
    def validatorService
    def staticDataService

    def index() {
		def user = User.get(request.userId)
		def subscriptions = Subscription.list()
		def purchases = Purchase.findAllByBuyer(user, [sort: 'bought', order: 'desc', max: 2])
		def profilePhoto = user.emailAddress.replace('@','+')
		[ user: user, subscriptions: subscriptions, purchases: purchases, 
		  profilePhoto: profilePhoto, states: staticDataService.states() ]
	}
	
	def purchasedDeals() {
		def user = User.get(request.userId)
        def purchases = Purchase.findAllByBuyer(user, [sort: 'bought', order: 'desc'])
		[user: user, purchases: purchases]
	}
	
	def updateSub() {
	    def user = User.get(request.userId)
	    if (user == null) {
		    render 'Error: user not logged in'
		    return
		}
		def sub = Subscription.findByName(params.name)
		def checked = params.checked
		if (checked == 'false') {
			user.subscriptions.remove(sub)
		} else {
			user.subscriptions << sub
		}
		user.save()
		render 'Subscription updated'
	}
	
	def emailAddress() {
	    def user = User.get(request.userId)
	    if (!user) {
	        log.debug "Couldn't find a user with user id ${request.userId}"
	        render 'error'
	    } else {
	        render user.emailAddress
	    }
	}
	
	def updateEmailAddress() {
	    if (!params.emailAddress) {
	        log.debug "updateEmailAddress error: Email address not passed in"
	        render 'error'
	        return
	    }
	    if (!validatorService.validateEmailAddress(params.emailAddress)) {
	        log.debug "updateEmailAddress error: Email address not valid"
	        render 'error'
	        return
	    }
	    def user = User.get(request.userId)
	    if (!user) {
	        log.debug "updateEmailAddress error: Couldn't find a user with user id ${request.userId}"
	        render 'error'
	    } else {
	        user.emailAddress = params.emailAddress
	        try {
	            user.save(failOnError: true)
	        } catch (Exception e) {
	            log.debug "updateEmailAddress error: Error trying to update email address: ${e}"
	            render error
	            return
	        }
	        render 'success'
	    }
	}
	
	def updateAddress() {
	    if (!params.address || !params.city || !params.state || !params.zipcode) {
	        log.debug 'updateAddress error: Not all fields were filled'
	        render 'error'
	        return
        }
        def user  = User.get(request.userId)
        if (!user) {
            log.debug "updateAddress error: Couldn't find a user with user id ${request.userId}"
	        render 'error'
        } else {
            def address = user.address
            if (!address) {
                address = new UserAddress()
            }
            address.code = user.emailAddress
            address.address1 = params.address
            address.address2 = ''
            address.city = params.city
            address.state = params.state
            address.postalCode = params.zipcode
            address.countryCode = 'US'
            try {
                address.save(failOnError: true)
            } catch (Exception e) {
                log.debug "updateAddress error: Error trying to save user address: ${e}"
	            render error
	            return
	        }
	        if (!user.address) {
	            user.address = address
	            try {
                    user.save(failOnError: true)
                } catch (Exception e) {
                    address.delete()
                    log.debug "updateAddress error: Error trying to save user address: ${e}"
    	            render error
    	            return
    	        }
	        }
	        render 'success'
        }
	}

	def name() {
	    def user = User.get(request.userId)
	    if (!user) {
	        log.debug "Couldn't find a user with user id ${request.userId}"
	        render 'N/A'
	    } else {
	        if (user.firstName) {
	            render user.firstName + ' ' + user.lastName
	        } else {
	            render 'N/A'
	        }
	    }
	}
	
	def updateName() {
	    if (!params.firstName || !params.lastName) {
	        log.debug "updateName error: First name or Last name not provided"
	        render 'error'
	        return
	    }
	    if (!validatorService.validateName(params.firstName, params.lastName)) {
	        log.debug "updateName error: Name not valid"
	        render 'error'
	        return
	    }
	    def user = User.get(request.userId)
	    if (!user) {
	        log.debug "updateName error: Couldn't find a user with user id ${request.userId}"
	        render 'error'
	    } else {
	        user.firstName = params.firstName
	        user.lastName = params.lastName
	        try {
	            user.save(failOnError: true)
	        } catch (Exception e) {
	            log.debug "updateName error: Error trying to update name: ${e}"
	            render error
	            return
	        }
	        render 'success'
	    }
	}
	
	def updateProfileInfo() {
	    def user = User.get(request.userId)	    
	    if (!params.submit) {
	        def profilePhoto = user.emailAddress.replace('@','+')
    		return [ user: user, profilePhoto: profilePhoto,
    		         states: staticDataService.states() ]
	    }
	}
	
	def saveProfileInfo() {
	    if (params.firstName == null || params.lastName == null ||
	        params.address == null || params.city == null ||
	        params.state == null || params.zipcode == null ||
	        params.email == null) {
	        log.debug 'One or more fields were null'
	        render "Error: All fields must be filled"
	        return
	    }
	    
	    if (params.firstName == 'First name' || params.lastName == 'Last name' ||
	        params.address == 'Address' || params.city == 'City' ||
	        params.state == '' || params.zipcode == 'Zip code' ||
	        params.email == '') {
	        log.debug 'One ore more fields had a default or blank value'
	        render "Error: All fields must be filled"
	        return
	    }
	    
	    if (!validatorService.validateEmailAddress(params.email)) {
	        render 'Error: Email address invalid'
	        return
	    }
	    
	    def user = User.get(request.userId)
	    if (!user) {
	        render "Error: Login session expired; please log in and try again."
	        return
	    }
	    
	    def address = user.address
        if (!address) {
            address = new UserAddress()
        }
        address.code = user.emailAddress
        address.address1 = params.address
        address.address2 = ''
        address.city = params.city
        address.state = params.state
        address.postalCode = params.zipcode
        address.countryCode = 'US'
        try {
            address.save(failOnError: true)
        } catch (Exception e) {
            log.debug e
            render "Error: Update failed; please try again in a few minutes"
            return
        }
        
        user.firstName = params.firstName
        user.lastName = params.lastName
        user.emailAddress = params.email
        if (!user.address) user.address = address
        user.save()
        
        log.debug "Success!"
        render 'success'
	}
	
}
