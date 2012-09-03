import com.tobeforme.domain.*
import java.util.*
import com.tobeforme.services.BCryptService

class BootStrap {

    def init = { servletContext ->
        
        def address = new UserAddress(
            address1: '20752 SW 87TH CT',
            address2: '',
            city: 'CUTLER BAY',
            state: 'FL',
            postalCode: '33189',
            countryCode: 'US'
        ).save()
        
        new User(
            emailAddress: 'daniel@2b4me.com.com',
            password: BCryptService.hashpw('$uperMan23884!', BCryptService.gensalt(4)),
        	firstName: 'Daniel',
        	lastName: 'Silva',
        	address: address,
        	admin: true
        ).save()
        
        new User(
            emailAddress: 'gdrossi@2b4me.com',
            password: BCryptService.hashpw('summer99', BCryptService.gensalt(4)),
        	firstName: 'Giorgio',
        	lastName: 'Del Rossi',
        	admin: true
        ).save()
        
        VendorAddress vendorAddress = new VendorAddress(
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
            originalPrice: 800,
            price: 400,
            category: wedding,
            effective: effective,
            expiration: expiration,
            vendor: vendor
        ).save()        
        Deal burgerTown = new Deal(
            shortName: 'burgertown',
            hoverTitle: 'Burger Town Meal for \$5',
            hoverTeaser: 'The best burgers in Miami at 50% off',
            title: '\$10 for \$5 at Burger Town',
            teaser: 'Enjoy \$10 worth of juicy burgers and delicious fries for \$5 at Burger Town located in the heart of Coconut Grove!',
            originalPrice: 10,
            price: 5,
            category: dining,
            effective: effective,
            expiration: expiration,
            vendor: vendor
        ).save()
        Deal spaRetreat = new Deal(
            shortName: 'sparetreat',
            hoverTitle: 'Spa Retreat for Two',
            hoverTeaser: 'It’s time to get pampered at Massage Paradise',
            title: 'Spa Retreat for two',
            teaser: 'Giving yourself a massage is a surefire disappointment. Leave kneading to the knowledgeable with today\'s 2B4ME special.',
            originalPrice: 300,
            price: 150,
            category: salon,
            effective: effective,
            expiration: expiration,
            vendor: vendor
        ).save()
        Deal openBar = new Deal(
            shortName: 'openbar',
            hoverTitle: 'Open Bar at Five Miami Beach Bars for \$100',
            hoverTeaser: 'Be the life of the party as the master cocktail warlock.',
            title: 'Open Bar in Miami Beach',
            teaser: 'Bar Hopper’s party-savvy guides steer revelers through lively city neighborhoods, stopping at esteemed watering holes along the way.',
            originalPrice: 150,
            price: 100,
            category: entertainment,
            effective: effective,
            expiration: expiration,
            vendor: vendor
        ).save()
        
        FeaturedDeal fSobe = new FeaturedDeal(deal: sobe, prio: 1).save()
        FeaturedDeal fBurgerTown = new FeaturedDeal(deal: burgerTown, prio: 2).save()
        FeaturedDeal fSpaRetreat = new FeaturedDeal(deal: spaRetreat, prio: 3).save()
        FeaturedDeal fOpenBar = new FeaturedDeal(deal: openBar, prio: 4).save()
        
        Subscription dailyDeals = new Subscription(code: 'DD', name: 'Daily Deals').save()
        Subscription weddingDeals = new Subscription(code: 'WD', name: 'Wedding Deals').save()
        Subscription travelDeals = new Subscription(code: 'TD', name: 'Travel Deals').save()
        
        /*
        
        def welcomeContent = '''\
<html>

<body> <!--  style="font-family: arial,sans-serif; font-size: 12px" -->

<p>Thank you for signing up at 2b4me.com. We are very excited to launch this company and
   to connect people with some of the really cool stuff South Florida has to offer.</p>

<p>In our ramp up to launch we are running a promotion to help spread the word on our
   company AND give you a chance to win some major cash and prizes in the process.</p>

<p>You signed up on #var and your contest number is:</p>

<h1>#var</h1>

<p>Keep this number safe. Whenever we run a contest drawing, we will publish the winners
   on the website <a href="http://2b4me.com">http://2b4me.com</a>, so check back often.
   We will be notifying on our <a href="http://facebook.com/2b4me">Facebook</a> page when
   new winners are published.</p>

<p>Thank you again for your participation. And remember to please tell your friends!</p>

<p>&nbsp;</p>

<p>Love,<br/>
<strong>Team 2b4me</strong></p>

<p>Like us on Facebook: <a href="http://facebook.com/2b4me">facebook.com/2b4me</a><br/>
   Follow us on Twitter: <a href="http://twitter.com/2b4me_deals">@2b4me_deals</a></p>

<p>&nbsp;</p>

<hr/>

<p>Don't care for these emails? You can
   <a href="mailto:info@2b4me.com?subject=UNSUBSCRIBE">click here</a> to unsubscribe from
   all future contest notifications with no fuss:
   <a href="mailto:info@2b4me.com?subject=UNSUBSCRIBE">Unsubscribe</a>.</p>

<p><strong>2b4me.com Inc.</strong>, 55 Merrick Way, Coral Gables, FL 33134. To contact us,
   <a href="mailto:info@2b4me.com">click here</a>.</p>

</body>

</html>'''
        
        def winnersContent = '''\
<html>

<body> <!--  style="font-family: arial,sans-serif; font-size: 12px" -->

<p>We have recently published the latest winners in our Launch Promotion contest on the
   website!</p>

<p>As a reminder, your contest number is:</p>

<h1>#var</h1>

<p>All you have to do is go to <a href="http://2b4me.com">http://2b4me.com</a> and see
   if you're number was drawn! <em>If you won, send an email to info@2b4me.com with your
   legal name and address so that we can mail you your prize.</em></p>

<p>We've given away several $50 and $20 cash prizes thus far, and we're going to do it
   again soon! You've already signed up so there's nothing more for you to do.
   Just keeping checking the site to see if your number is drawn in a future drawing.</p>

<p>If you have any questions, please send them to
   <a href="mailto:info@2b4me.com">info@2b4me.com</a> and we'll be more than happy to
   assist.</p>

<p>Thank you again for your participation. And remember to please tell your friends!</p>

<p>Good luck!</p>

<p>&nbsp;</p>

<p>Love,<br/>
<strong>Team 2b4me</strong></p>

<p>Like us on Facebook: <a href="http://facebook.com/2b4me">facebook.com/2b4me</a><br/>
   Follow us on Twitter: <a href="http://twitter.com/2b4me_deals">@2b4me_deals</a></p>

<p>&nbsp;</p>

<hr/>

<p>Don't care for these emails? You can
   <a href="mailto:info@2b4me.com?subject=UNSUBSCRIBE">click here</a> to unsubscribe from
   all future contest notifications with no fuss:
   <a href="mailto:info@2b4me.com?subject=UNSUBSCRIBE">Unsubscribe</a>.</p>

<p><strong>2b4me.com Inc.</strong>, 55 Merrick Way, Coral Gables, FL 33134. To contact us,
   <a href="mailto:info@2b4me.com">click here</a>.</p>

</body>

</html>'''
        
        def claimContent = '''\
<html>

<body> <!--  style="font-family: arial,sans-serif; font-size: 12px" -->

<p>Hi #var,</p>

<p>Congratulations on winning the #var from the #var drawing! We're excited to spread the
   word around on 2b4me and what we want to offer the South Florida market (and beyond)!
   Please allow up to two weeks for your prize to arrive. And because this is an on-going
   promotion, you are eligible to win at every drawing until the end of the contest! So
   keep checking back to see if your contest number is drawn in a future drawing.</p>

<p>Thank you for participating, good luck in future drawings and please remember to tell
   your friends!</p>

<p>&nbsp;</p>

<p>Love,<br/>
<strong>Team 2b4me</strong></p>

<p>Like us on Facebook: <a href="http://facebook.com/2b4me">facebook.com/2b4me</a><br/>
   Follow us on Twitter: <a href="http://twitter.com/2b4me_deals">@2b4me_deals</a></p>

<p>&nbsp;</p>

<hr/>

<p>Don't care for these emails? You can
   <a href="mailto:info@2b4me.com?subject=UNSUBSCRIBE">click here</a> to unsubscribe from
   all future contest notifications with no fuss:
   <a href="mailto:info@2b4me.com?subject=UNSUBSCRIBE">Unsubscribe</a>.</p>

<p><strong>2b4me.com Inc.</strong>, 55 Merrick Way, Coral Gables, FL 33134. To contact us,
   <a href="mailto:info@2b4me.com">click here</a>.</p>

</body>

</html>'''
        
        def messageContent = '''\
<html>

<body> <!--  style="font-family: arial,sans-serif; font-size: 12px" -->

<p>Hi there,</p>

<p>#var</p>

<p>&nbsp;</p>

<p>Love,<br/>
<strong>Team 2b4me</strong></p>

<p>Like us on Facebook: <a href="http://facebook.com/2b4me">facebook.com/2b4me</a><br/>
   Follow us on Twitter: <a href="http://twitter.com/2b4me_deals">@2b4me_deals</a></p>

<p>&nbsp;</p>

<hr/>

<p>Don't care for these emails? You can
   <a href="mailto:info@2b4me.com?subject=UNSUBSCRIBE">click here</a> to unsubscribe from
   all future contest notifications with no fuss:
   <a href="mailto:info@2b4me.com?subject=UNSUBSCRIBE">Unsubscribe</a>.</p>

<p><strong>2b4me.com Inc.</strong>, 55 Merrick Way, Coral Gables, FL 33134. To contact us,
   <a href="mailto:info@2b4me.com">click here</a>.</p>

</body>

</html>'''

        def emt
        emt = new EmailTemplate(name: 'welcome', content: welcomeContent).save()
        emt = new EmailTemplate(name: 'winners', content: winnersContent).save()
        emt = new EmailTemplate(name: 'claim', content: claimContent).save()
        emt = new EmailTemplate(name: 'message', content: messageContent).save()
        
        def prize
        prize = new Prize(name: '$50 Cash Prize').save()
        prize = new Prize(name: '$20 Cash Prize').save()
         */
    }

    def destroy = {
    }
    
}
