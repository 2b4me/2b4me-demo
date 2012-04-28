package com.tobeforme.web.controllers

import com.tobeforme.domain.*

class DealController {

    def index() {
		[deal: Deal.findByShortName(params.id)]
	}
}
