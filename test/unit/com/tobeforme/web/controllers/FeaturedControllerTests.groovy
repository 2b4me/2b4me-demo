package com.tobeforme.web.controllers

import grails.test.mixin.*
import org.junit.*
import com.tobeforme.domain.Deal

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(FeaturedController)
@Mock(Deal)
class FeaturedControllerTests {

    void testSomething() {
       	def d
		
		d = new Deal()
		d.originalPrice = 100.00
		d.price = 50.00
		assert d.discountInPct() == 50
		
		d = new Deal()
		d.originalPrice = 250.00
		d.price = 100.00
		assert d.discountInPct() == 60
		
		d = new Deal()
		d.originalPrice = 25.00
		d.price = 15.00
		assert d.discountInPct() == 40
    }
}
