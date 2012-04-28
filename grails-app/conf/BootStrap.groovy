import com.tobeforme.domain.*

class BootStrap {

    def init = { servletContext ->
		// initialize some deals for the demo
		Deal a = new Deal(
			shortName: 'sobe',
			hoverTitle: 'Lavish, All-Inclusive South Beach Resort',
			hoverTeaser: 'Enjoy days on the beach and nights on the dance floor with our package',
			title: 'South Beach Fun & Sun',
			teaser: 'Take a breather from the every day routine with ' +
			        'a 5 day and 4 night all-inclusive stay at the famous Sands Hotel, ' +
			        'located directly on the beach.',
			originalPrice: 800,
			price: 400
		).save()
		Deal b = new Deal(
			shortName: 'oneburger',
			hoverTitle: 'OneBurger Meal for \$5',
			hoverTeaser: 'The best burgers in Miami at 50% off',
			title: '\$10 for \$5 at One Burger',
			teaser: 'Enjoy \$10 worth of juicy burgers and delicious' +
			        'fries for \$5 at One Burger located in the heart ' +
			        'of Coral Gables!',
			originalPrice: 10,
			price: 5
		).save()
		Deal c = new Deal(
			shortName: 'sparetreat',
			hoverTitle: 'Spa Retreat for Two',
			hoverTeaser: 'It’s time to get pampered at Massage Paradise',
			title: 'Spa Retreat for two',
			teaser: 'Giving yourself a massage is a surefire disappointment. Leave ' +
			        'kneading to the knowledgeable with today\'s 2B4ME special.',
			originalPrice: 150,
			price: 300
		).save()
		Deal d = new Deal(
			shortName: 'openbar',
			hoverTitle: 'Open Bar at Five Miami Beach Bars for \$100',
			hoverTeaser: 'Be the life of the party as the master cocktail warlock.',
			title: 'Open Bar in Miami Beach',
			teaser: 'Bar Hopper’s party-savvy guides steer revelers through lively city neighborhoods, ' +
			        'stopping at esteemed watering holes along the way.',
			originalPrice: 150,
			price: 100
		).save()
		
		/*
		largeImage: '/images/home-slider-main-photo.jpg',
		smallImage: '/images/home-slider-image3.jpg',
		*/
		
		FeaturedDeal fa = new FeaturedDeal(deal: a, prio: 1).save()
		FeaturedDeal fb = new FeaturedDeal(deal: b, prio: 2).save()
		FeaturedDeal fc = new FeaturedDeal(deal: c, prio: 3).save()
		FeaturedDeal fd = new FeaturedDeal(deal: d, prio: 4).save()

    }

    def destroy = {
    }
}
