import com.tobeforme.domain.*
import java.util.*
import com.tobeforme.services.BCryptService

class BootStrap {

    def init = { servletContext ->
        
        def addr = new UserAddress(
            code: 'daniel@2b4me.com',
            address1: '333 Aragon Avenue',
            address2: '',
            city: 'Coral Gables',
            state: 'FL',
            postalCode: '33134',
            countryCode: 'US'
        ).save()
        
        new User(
            emailAddress: 'daniel@2b4me.com',
        	password: BCryptService.hashpw('$uperMan23884!', BCryptService.gensalt(4)),
        	firstName: 'Daniel',
        	lastName: 'Silva',
        	address: addr,
        	admin: true,
        	confirmed: true,
        	registrationKey: '00001'
        ).save()
        
        VendorAddress vendorAddress = new VendorAddress(
            code: '2B',
            address1: '333 Aragon Avenue',
            address2: '',
            city: 'Coral Gables',
            state: 'FL',
            postalCode: '33134',
            countryCode: 'US'
        ).save()
        
        Vendor vendor = new Vendor(code: '2B', name: '2b4me', address: vendorAddress).save()
    
        Category wedding = new Category(name: 'Wedding', prio: 1, deals: []).save()
        Category dining = new Category(name: 'Dining', prio: 2, deals: []).save()
        Category retail = new Category(name: 'Retail', prio: 3, deals: []).save()
        Category fashion = new Category(name: 'Fashion', prio: 4, deals: []).save()
        Category travel = new Category(name: 'Travel', prio: 5, deals: []).save()
        Category entertainment = new Category(name: 'Entertainment', prio: 6, deals: []).save()
        Category salon = new Category(name: 'Salon', prio: 7, deals: []).save()
        
        def effective = new GregorianCalendar(2012, Calendar.MAY, 20).getTime()
        def expiration = new GregorianCalendar(2012, Calendar.NOVEMBER, 30).getTime()
        
        Deal sobe = new Deal(
            shortName: 'sobe',
            hoverTitle: 'Lavish, All-Inclusive South Beach Resort',
            hoverTeaser: 'Enjoy days on the beach and nights on the dance floor with our package',
            title: 'South Beach Fun & Sun',
            teaser: 'Take a breather from the every day routine with a 5 day and 4 night all-inclusive stay at the famous Sands Hotel, located directly on the beach.',
            fullDescription: 'Take a breather from the every day routine with a 5 day and 4 night all-inclusive stay at the famous Sands Hotel, located directly on the beach. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel rhoncus leo. Aenean eu enim orci. Etiam vitae mollis lacus. Nulla in sapien ac diam pretium eleifend at at metus. Vivamus faucibus vehicula leo, eu elementum ipsum cursus vel. Ut aliquam justo a nibh aliquam in rutrum neque auctor. Nam a varius felis. Nunc eleifend, eros vel viverra convallis, elit est vulputate est, at luctus justo urna eu enim.',
            originalPrice: 800,
            price: 400,
            category: wedding,
            effective: effective,
            expiration: expiration,
            vendor: vendor,
            terms: [
                'Limit 1 per purchaser, additional as gifts.',
                'Limit 1 voucher per customer per redemption.',
                'Must be 18 years or older.',
                'All services must be redeemed within 8 weeks from initial redemption by same customer.'
            ]
        ).save()        
        Deal burgerTown = new Deal(
            shortName: 'burgertown',
            hoverTitle: 'Burger Town Meal for \$5',
            hoverTeaser: 'The best burgers in town now 50% off, a delicious deal for lunch or dinner!',
            title: '\$10 for \$5 at Burger Town',
            teaser: 'Enjoy \$10 worth of juicy burgers and delicious fries for \$5 at Burger Town located in the heart of Coconut Grove!',
            fullDescription: 'Enjoy \$10 worth of juicy burgers and delicious fries for \$5 at Burger Town located in the heart of Coconut Grove! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel rhoncus leo. Aenean eu enim orci. Etiam vitae mollis lacus. Nulla in sapien ac diam pretium eleifend at at metus. Vivamus faucibus vehicula leo, eu elementum ipsum cursus vel. Ut aliquam justo a nibh aliquam in rutrum neque auctor. Nam a varius felis. Nunc eleifend, eros vel viverra convallis, elit est vulputate est, at luctus justo urna eu enim.',
            originalPrice: 10,
            price: 5,
            category: dining,
            effective: effective,
            expiration: expiration,
            vendor: vendor,
            terms: [
                'Limit 1 per purchaser, additional as gifts.',
                'Limit 1 voucher per customer per redemption.',
                'Must be 18 years or older.',
                'All services must be redeemed within 8 weeks from initial redemption by same customer.'
            ]
        ).save()
        Deal spaRetreat = new Deal(
            shortName: 'sparetreat',
            hoverTitle: 'Spa Retreat for Two',
            hoverTeaser: 'Take a break and get pampered by one of the best Spas in South Florida.',
            title: 'Spa Retreat for two',
            teaser: 'Giving yourself a massage is a surefire disappointment. Leave kneading to the knowledgeable with today\'s 2B4ME special.',
            fullDescription: 'Giving yourself a massage is a surefire disappointment. Leave kneading to the knowledgeable with today\'s 2B4ME special. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel rhoncus leo. Aenean eu enim orci. Etiam vitae mollis lacus. Nulla in sapien ac diam pretium eleifend at at metus. Vivamus faucibus vehicula leo, eu elementum ipsum cursus vel. Ut aliquam justo a nibh aliquam in rutrum neque auctor. Nam a varius felis. Nunc eleifend, eros vel viverra convallis, elit est vulputate est, at luctus justo urna eu enim.',
            originalPrice: 300,
            price: 150,
            category: salon,
            effective: effective,
            expiration: expiration,
            vendor: vendor,
            terms: [
                'Limit 1 per purchaser, additional as gifts.',
                'Limit 1 voucher per customer per redemption.',
                'Must be 18 years or older.',
                'All services must be redeemed within 8 weeks from initial redemption by same customer.'
            ]
        ).save()
        Deal openBar = new Deal(
            shortName: 'openbar',
            hoverTitle: 'Open Bar at Five Miami Beach Bars for \$100',
            hoverTeaser: 'Be the life of the party and make it happen as the master cocktail warlock.',
            title: 'Open Bar in Miami Beach',
            teaser: 'Bar Hopper’s party-savvy guides steer revelers through lively city neighborhoods, stopping at esteemed watering holes along the way.',
            fullDescription: 'Bar Hopper’s party-savvy guides steer revelers through lively city neighborhoods, stopping at esteemed watering holes along the way. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel rhoncus leo. Aenean eu enim orci. Etiam vitae mollis lacus. Nulla in sapien ac diam pretium eleifend at at metus. Vivamus faucibus vehicula leo, eu elementum ipsum cursus vel. Ut aliquam justo a nibh aliquam in rutrum neque auctor. Nam a varius felis. Nunc eleifend, eros vel viverra convallis, elit est vulputate est, at luctus justo urna eu enim.',
            originalPrice: 150,
            price: 100,
            category: entertainment,
            effective: effective,
            expiration: expiration,
            vendor: vendor,
            terms: [
                'Limit 1 per purchaser, additional as gifts.',
                'Limit 1 voucher per customer per redemption.',
                'Must be 21 years or older.',
                'All services must be redeemed within 8 weeks from initial redemption by same customer.'
            ]
        ).save()
        
        FeaturedDeal fSobe = new FeaturedDeal(deal: sobe, prio: 1).save()
        FeaturedDeal fBurgerTown = new FeaturedDeal(deal: burgerTown, prio: 2).save()
        FeaturedDeal fSpaRetreat = new FeaturedDeal(deal: spaRetreat, prio: 3).save()
        FeaturedDeal fOpenBar = new FeaturedDeal(deal: openBar, prio: 4).save()
        
        Subscription dailyDeals = new Subscription(code: 'DD', name: 'Daily Deals').save()
        Subscription weddingDeals = new Subscription(code: 'WD', name: 'Wedding Deals').save()
        Subscription travelDeals = new Subscription(code: 'TD', name: 'Travel Deals').save()
        
        def nextDrawingDate = new GregorianCalendar(2009, Calendar.JULY, 22)
        NextDrawing nd = new NextDrawing(date: nextDrawingDate.getTime()).save()
    }

    def destroy = {
    }
    
}
