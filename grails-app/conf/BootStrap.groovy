import com.tobeforme.domain.Deal

class BootStrap {

    def init = { servletContext ->
		// initialize some deals for the demo
		Deal a = new Deal(
			hoverTitle: 'South Beach Summer Special',
			hoverTeaser: 'Enjoy days on the beach and nights on the dance floor with our package.',
			title: 'Enjoy 5 days and 4 Nights of Sun and Fun on South Beach!',
			teaser: 'Rediscover the magic of South Beach with a 5 day/4 night stay in a historic art deco hotel right on Ocean Avenue.',
			originalPrice: 699.00,
			price: 399.00
		).save()
		Deal b = new Deal(
			hoverTitle: 'A Burger Deal That Is Too Sweet',
			hoverTeaser: 'The best burgers in Miami',
			title: 'Five OneBurger Meals',
			teaser: 'Enjoy \$10 worth of juicy burgers and delicious' +
			        'fries for \$5 at One Burger located in the heart ' +
			        'of Coral Gables!',
			originalPrice: 10.00,
			price: 5.00
		).save()
		Deal c = new Deal(
			hoverTitle: 'Spa Retreat Special',
			hoverTeaser: 'Get pampered in style',
			title: 'Spa Retreat Special',
			teaser: 'tbd',
			originalPrice: 199.00,
			price: 99.00
		).save()
		Deal d = new Deal(
			hoverTitle: 'Five Mixologist Classes',
			hoverTeaser: 'Be the life of the party as the master cocktail warlock.',
			title: 'Five Mixologist Classes',
			teaser: 'tbd',
			originalPrice: 499.00,
			price: 199.00
		).save()	
    }

    def destroy = {
    }
}
