import com.tobeforme.domain.*

class BootStrap {

    def init = { servletContext ->
		// initialize some deals for the demo
		Deal a = new Deal(
			hoverTitle: 'Lavish, All-Inclusive South Beach Resort',
			hoverTeaser: 'Enjoy days on the beach and nights on the dance floor with our package',
			title: 'Enjoy Sun and Fun on South Beach!',
			teaser: 'Take a breather from the every day routine with ' +
			        'a 5 day and 4 night all-inclusive stay at the famous Sands Hotel, ' +
			        'located directly on the beach.',
			largeImage: 'images/home-slider-main-photo.jpg',
			originalPrice: 800,
			price: 400
		).save()
		Deal b = new Deal(
			hoverTitle: 'OneBurger Meal for \$5',
			hoverTeaser: 'The best burgers in Miami at 50% off',
			title: '\$10 to spend for \$5 at One Burger (\$10 VALUE)',
			teaser: 'Enjoy \$10 worth of juicy burgers and delicious' +
			        'fries for \$5 at One Burger located in the heart ' +
			        'of Coral Gables!',
			originalPrice: 10,
			price: 5
		).save()
		Deal c = new Deal(
			hoverTitle: 'Spa Retreat for Two',
			hoverTeaser: 'It’s time to get pampered at Massage Paradise',
			title: 'Spa Retreat for two for \$150 (\$300 VALUE)',
			teaser: 'Giving yourself a massage, like throwing yourself a surprise birthday party ' +
			        'or asking for your own hand in marriage, is a surefire disappointment. Leave ' +
			        'kneading to the knowledgeable with today\'s 2B4ME special: for \$25, you get a ' +
			        '60-minute massage at a certified clinic from Massage Paradise - valid at all five ' +
			        'Miami-area locations (a \$300 value).',
			originalPrice: 150,
			price: 300
		).save()
		Deal d = new Deal(
			hoverTitle: 'Open Bar at Five Miami Beach Bars for \$100',
			hoverTeaser: 'Be the life of the party as the master cocktail warlock.',
			title: 'Open Bar at Five Miami Beach Bars for \$100 (VALUE \$150)',
			teaser: 'Bar Hopper’s party-savvy guides steer revelers through lively city neighborhoods, ' +
			        'stopping at esteemed watering holes along the way. The guides chart courses ' +
			        'by strolling the pre-designated route to ensure that bars are conveniently spaced ' +
			        'apart.',
			originalPrice: 150,
			price: 100
		).save()
		
		FeaturedDeal fa = new FeaturedDeal(deal: a, prio: 1).save()
		FeaturedDeal fb = new FeaturedDeal(deal: b, prio: 2).save()
		FeaturedDeal fc = new FeaturedDeal(deal: c, prio: 3).save()
		FeaturedDeal fd = new FeaturedDeal(deal: d, prio: 4).save()

    }

    def destroy = {
    }
}
