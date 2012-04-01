import com.tobeforme.domain.Deal

class BootStrap {

    def init = { servletContext ->
		// initialize some deals for the demo
		Deal a = new Deal(
			hoverTitle: "South Beach Summer Special",
			hoverTeaser: "Enjoy days on the beach and nights on the dance floor with our package.",
			title: "5-Day South Beach Vacation",
			teaser: "Rediscover the magic of South Beach with a 5 day/4 night stay in a historic art deco hotel right on Ocean Avenue.",
			originalPrice: 699.00,
			price: 399.00
		).save()
		Deal b = new Deal(
			hoverTitle: "",
			hoverTeaser: "",
			title: "Five OneBurger Meals",
			teaser: "tbd",
			originalPrice: 35.00,
			price: 20.00
		).save()
		Deal c = new Deal(
			hoverTitle: "",
			hoverTeaser: "",
			title: "Spa Retreat Special",
			teaser: "tbd",
			originalPrice: 199.00,
			price: 99.00
		).save()
		Deal d = new Deal(
			hoverTitle: "",
			hoverTeaser: "",
			title: "Five Mixologist Classes",
			teaser: "tbd",
			originalPrice: 499.00,
			price: 199.00
		).save()
	
    }
    def destroy = {
    }
}
