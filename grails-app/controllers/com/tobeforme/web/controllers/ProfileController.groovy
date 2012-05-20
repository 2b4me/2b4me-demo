package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class ProfileController {

    def index() {
		def user = User.findByEmailAddress('daniel@silvanolte.com') // this should come from session
		def subscriptions = Subscription.list()
		def purchases = Purchase.findAllByBuyer(user, [sort: 'bought', order: 'desc', max: 2])
		[user: user, subscriptions: subscriptions, purchases: purchases]
	}
	
	def purchasedDeals() {
		def user = User.findByEmailAddress('daniel@silvanolte.com') // this should come from session
		def purchases = Purchase.findAllByBuyer(user, [sort: 'bought', order: 'desc'])
		[user: user, purchases: purchases]
	}
	
	def updateSub() {
		def user = User.findByEmailAddress('daniel@silvanolte.com') // this should come from session
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
