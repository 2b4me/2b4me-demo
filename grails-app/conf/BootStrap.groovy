import com.tobeforme.domain.*
import java.util.*
import com.tobeforme.services.BCryptService

class BootStrap {

    def init = { servletContext ->
        
        Address vendorAddress = new Address(
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
        
        Address userAddress = new Address(
            address1: '20752 SW 87th Court',
            address2: '',
            city: 'Miami',
            state: 'FL',
            postalCode: '33189',
            countryCode: 'US'
        ).save()
        
        def hash = BCryptService.hashpw('hello123', BCryptService.gensalt(4))
        User user = new User(
            emailAddress: 'daniel@silvanolte.com',
            password: hash,
            firstName: 'Daniel',
            lastName: 'Silva',
            address: userAddress,
            admin: true,
            subscriptions: [dailyDeals, travelDeals]
        ).save()
        
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
        
        def currentSignups = [
            'gdrossi@caviarmujjol.com	00207	3/26/2012	8:11:22	✔ 	x	Related to contest sponsor',
            'Zeneido@yahoo.com	07853	3/26/2012	15:00:25	✔ 		',
            'ldrossi@lfiplaw.com	05654	3/29/2012	5:58:53	✔ 	x	Related to contest sponsor',
            'kingomiami@gmail.com	05884	4/12/2012	9:35:50	✔ 		',
            'alessike@gmail.com	04384	4/18/2012	8:49:47	✔ 		',
            'gdelrossi@hotmail.com	03124	5/4/2012	11:03:15	✔ 	x	Related to contest sponsor',
            'lymontells@hotmail.com	02291	5/8/2012	17:18:04	✔ 		',
            'chefrobcmb@gmail.com	06680	5/11/2012	10:15:38	✔ 		',
            'lcaviar48@gmail.com	08113	6/3/2012	10:50:55	✔ 		',
            'chrisderoux@gmail.com	03369	6/4/2012	21:52:25	✔ 	x	Not a US resident',
            'Zarta79@gmail.com	04873	6/6/2012	10:55:47	✔ 		',
            'Fafosselman@gmail.com	08041	6/7/2012	11:26:57	✔ 		',
            'haaskeeka@hotmail.com	03773	6/9/2012	1:08:44	✔ 		',
            'lilione79@yahoo.com	01932	6/9/2012	1:09:30	✔ 		',
            'yisney20@yahoo.com	06915	6/12/2012	15:52:31	✔ 		',
            'yismey20@gmail.com	06279	6/12/2012	15:53:10	✔ 	x	Suspected repeat entrant',
            'saturnina2004@yahoo.com	00349	6/12/2012	15:53:31	✔ 	x	Suspected repeat entrant',
            'yisleidyh@yahoo.com	06407	6/12/2012	15:53:45	✔ 	x	Suspected repeat entrant',
            'lazarocaviarsales@live.com	06269	6/12/2012	23:53:28	✔ 		',
            'Vivyjo@bellsouth.net	06773	6/13/2012	11:21:38	✔ 		',
            'jsilva@medifastcenters.com	06083	6/13/2012	22:23:06	✔ 		',
            'giofixer@hotmail.com	04743	6/18/2012	14:48:44	✔ 		',
            'jdrossi@gmail.com	00469	6/18/2012	18:49:13	✔ 	x	Related to contest sponsor',
            'eevaldes@msn.com	05563	6/18/2012	18:55:01	✔ 		',
            'rrivero814@aol.com	00020	6/18/2012	20:45:12	✔ 		',
            'retraish@gmail.com	03464	6/19/2012	9:52:35	✔ 		',
            'dougmunro64@gmail.com	01143	6/19/2012	9:58:21	✔ 		',
            'evelynetejada@gmail.com	07535	6/19/2012	10:06:57	✔ 		',
            'j_cameron@earthlink.net	06754	6/19/2012	10:18:35	✔ 		',
            'Rtorres@urbietaoil.com	06079	6/19/2012	10:55:42	✔ 		',
            'ely0624@yahoo.com	00896	6/19/2012	11:18:49	✔ 		',
            'Pfdocumet@xcast3d.com	03862	6/19/2012	12:02:49	✔ 		',
            'Daphne.thissen@gmail.com	00150	6/19/2012	12:11:14	✔ 	x	Not a US resident',
            'marilyncasares@hotmail.com	07301	6/19/2012	12:25:11	✔ 		',
            'Waterchicken@yahoo.com	06435	6/19/2012	13:24:52	✔ 		',
            'katycamilo@yahoo.com	00394	6/19/2012	20:00:04	✔ 	x	Related to contest sponsor',
            'shsims@cfl.rr.com	03165	6/20/2012	17:11:44	✔ 		',
            'mfsaballos@gmail.com	00111	6/20/2012	23:38:17	✔ 		',
            'eduran1978@yahoo.com	01182	6/21/2012	10:11:34	✔ 		',
            'Apalacio131@yahoo.com	04876	6/21/2012	15:47:19	✔ 		',
            'Drum_baby_246@yahoo.com	08828	6/26/2012	9:17:53	✔ 		',
            'natec22@aol.com	08543	6/26/2012	17:25:22	✔ 		',
            'Missimc@me.com	04804	6/26/2012	21:56:59	✔ 		',
            'walker.peter@gmail.com	02121	6/28/2012	10:09:48	✔ 		',
            'YSILVA07@YAHOO.COM	08304	6/28/2012	10:27:45	✔ 		',
            'honeybeedi@yahoo.com	09721	6/28/2012	16:39:22	✔ 		',
            'catalinatransfer@gmail.com	06402	6/29/2012	13:01:34	✔ 		',
            'pgonzalez@scff.com	09371	6/29/2012	14:46:25	✔ 		',
            'Xingrocks@yahoo.com	04624	6/29/2012	18:49:46	✔ 		',
            'ivetteaparicio23@yahoo.com	03187	7/1/2012	16:49:12	✔ 		',
            'alecaparicio@gmail.com	09536	7/1/2012	16:52:15	✔ 		',
            'iaparicio@dadeschools.net	03020	7/1/2012	16:53:37	✔ 		',
            'kmueller@scff.com	03314	7/2/2012	15:35:44	✔ 		',
            'maeisenson@aol.com	09014	7/2/2012	15:40:25	✔ 		',
            'Omar.benavides@ymail.com	04199	7/5/2012	13:46:03	✔ 		',
            'Leonelpinapoll@hotmail.com	01029	7/5/2012	13:54:19	✔ 		',
            'MSPEGGYO@YAHOO.COM	03974	7/5/2012	18:12:50	✔'
        ]
        
        currentSignups.each {
            def t = it.tokenize('\t')
            def signupDate = t[2].tokenize('/')
            def signupTime = t[3].tokenize(':')
            def year = new Integer(signupDate[2]).intValue()
            def month
            switch (signupDate[0]) {
                case '3':
                    month = Calendar.MARCH
                    break
                case '4':
                    month = Calendar.APRIL
                    break
                case '5':
                    month = Calendar.MAY
                    break
                case '6':
                    month = Calendar.JUNE
                    break
                case '7':
                    month = Calendar.JULY
                    break
                default:
                    throw new IllegalStateException('Unable to parse month from signup date: ' + signupDate[0])
            }
            def day = new Integer(signupDate[1]).intValue()
            def hour = new Integer(signupTime[0]).intValue()
            def minute = new Integer(signupTime[1]).intValue()
            def second = new Integer(signupTime[2]).intValue()
            def signup = new GregorianCalendar(year, month, day, hour, minute, second).time
            def ineligible = t[5] == 'x'
            def c = new Contestant()
            c.email = t[0].toLowerCase()
            c.signupDate = signup
            c.ineligible = ineligible
            if (ineligible) {
                c.ineligibilityReason = t[6]
            }
            c.entry = t[1]
            c.save()
        }

    }

    def destroy = {
    }
    
}
