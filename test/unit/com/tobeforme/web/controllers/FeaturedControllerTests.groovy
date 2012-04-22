package com.tobeforme.web.controllers

import grails.test.mixin.*
import org.junit.*
import com.tobeforme.domain.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(FeaturedController)
@Mock(Deal)
class FeaturedControllerTests {
	
	void setUp() {
		Deal a = new Deal(hoverTitle: '', hoverTeaser: '', title: '', teaser: '',
		                  largeImage: '', smallImage: '', originalPrice: 0,
		                  price: 0).save()
		Deal b = new Deal(hoverTitle: '', hoverTeaser: '', title: '', teaser: '',
		                  largeImage: '', smallImage: '', originalPrice: 0,
		                  price: 0).save()
		Deal c = new Deal(hoverTitle: '', hoverTeaser: '', title: '', teaser: '',
		                  largeImage: '', smallImage: '', originalPrice: 0,
		                  price: 0).save()
		Deal d = new Deal(hoverTitle: '', hoverTeaser: '', title: '', teaser: '',
		                  largeImage: '', smallImage: '', originalPrice: 0,
		                  price: 0).save()
		
		FeaturedDeal fa = new FeaturedDeal(deal: a, prio: 1).save()
		FeaturedDeal fb = new FeaturedDeal(deal: b, prio: 2).save()
		FeaturedDeal fc = new FeaturedDeal(deal: c, prio: 3).save()
		FeaturedDeal fd = new FeaturedDeal(deal: d, prio: 4).save()
	}

    void testFeaturedDeals() {
		params.selectedDealIndex = 0
		
		controller.deals()
		
		assert model.featuredDeal != null
		assert model.otherDeals.size() == 3
	}


}
