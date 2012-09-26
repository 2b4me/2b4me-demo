package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class ProfileController {
    
    def validatorService

    def index() {
		def user = User.get(request.userId)
		if (user == null) {
		    redirect controller: 'featured', action: 'index'
		    return
		}
		def subscriptions = Subscription.list()
		def purchases = Purchase.findAllByBuyer(user, [sort: 'bought', order: 'desc', max: 2])
		def profilePhoto = user.emailAddress.replace('@','+')
		[user: user, subscriptions: subscriptions, purchases: purchases, profilePhoto: profilePhoto]
	}
	
	def purchasedDeals() {
		def user = User.get(request.data.userId)
		if (user == null) {
		    redirect controller: 'featured', action: 'index'
		    return
		}
        def purchases = Purchase.findAllByBuyer(user, [sort: 'bought', order: 'desc'])
		[user: user, purchases: purchases]
	}
	
	def updateSub() {
	    def user = User.get(request.data.userId)
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
	
}
