package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class ProfileController {

    def index() {
		def user = User.get(request.sess.userId)
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
		def user = User.get(request.sess.userId)
		if (user == null) {
		    redirect controller: 'featured', action: 'index'
		    return
		}
        def purchases = Purchase.findAllByBuyer(user, [sort: 'bought', order: 'desc'])
		[user: user, purchases: purchases]
	}
	
	def updateSub() {
	    def user = User.get(request.sess.userId)
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
	
}
