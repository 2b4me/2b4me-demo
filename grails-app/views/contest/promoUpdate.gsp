<!DOCTYPE html>

<g:if test="${renderForm}">

<html>

<body>
   <g:form action="promoUpdate" method="post">
   <p>
      Upcoming date:<br/><input type="text" name="upcomingDate" value="mm/dd/yyyy" />
   </p>
   <p>
      <input type="submit" name="formSubmit" value="Submit" />
   </p>
   </g:form>
</body>

</html>

</g:if>
<g:else>

<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>2b4me - I want it all!</title>
      <link rel="stylesheet" type="text/css" href="bootstrap.css" />
      <link rel="stylesheet" type="text/css" href="style.css" />
      <link rel="stylesheet" type="text/css" href="style-ext.css" />
      <link rel="stylesheet" type="text/css" href="style2.css" />
      <link rel="stylesheet" type="text/css" href="normalize.css" />
   </head>
   <body style="background-color: white;  ">
      <img src="images/bg2.png" id="bg" />
      <!--START HEADER-->
      <div id="header">
         <div id="header-inner">
            <a href="index.html" id="logo"><img src="images/2b4me-logo.png" /></a>
            <ul id="nav">
               <li><a href="#" id="merchantSignupLinkHeader">merchant sign up</a></li>
               <li><a href="http://demo.2b4me.com">view demo</a></li>
               <li id="contact"><a href="mailto:info@2b4me.com?subject=Tell me more about 2b4me!">contact</a></li>
            </ul>
            <!-- <img id="fb" src="images/facebook-like-us.png" href="" /> -->
         </div>
      </div>
      <!--END HEADER-->
      <div id="container">
         <div class="headline">True local DEALS... with a TWIST</div>
         <div class="bluebox">
            <div class="stamps"><img src="images/stamps.png" /></div>
            <!-- 240 x 200 -->
            <p>
               <span class="headline">WEBSITE LAUNCH PROMOTION!</span><br />
               <span class="sub">You could win CASH and DEALS up to $50 value!</span>
            </p>
            <div>
               <form>
                  <input id="contest-signup-email-input" class="textfieldstyle" name="textfield" type="text" size="30" value="Enter Your Email Address" />  <input id="contest-signup-zipCode-input" class="textfieldstyle" name="textfield" type="text" size="15" value="Enter Your Zip Code" />  <button id="contest-signup-submit-btn" type="submit" class="button">Sign up</button>
               </form>
               <p class="small" id="terms">For full contest rules  <a data-toggle="modal" href="#contestModal">click here</a>. If you lose your contest number, just submit your e-mail address again and it will be e-mailed to you. Your privacy is very important to us, <a data-toggle="modal" href="#privacyModal">click here to read our privacy policy</a>.</p>
            </div>
            <br />
            <span style="font-size:18px; color:#004262; letter-spacing:0.1em;">NEXT DRAWING'S PRIZES ON <span style="font-weight: bold;">${upcomingDate}</span></span><br />
            <div style="display:block; margin-bottom:5px; font-size:16px; color:#004262; font-style:italic;"><img style="margin-bottom:3px; margin-right:3px;" src="images/clock.png" /><span id="d2">2</span> <span id="d2desc">DAYS</span> : <span id="h2">23</span> HOURS : <span id="m2">59</span> MINS : <span id="s2">59</span> SEC</div>
            
            <!--row-->
            <div class="row">
             	<div class="ad">
              	<img src="images/thumb10.jpg">
                  <div style="padding:10px 15px 5px 220px;">
                  <img style="float:right;"src="images/cafe_demetrio.jpg"/>
                  <span class="prize">$10 Gift Certificate to<br/>CAFE DEMETRIO</span><br>
                  <span class="description">Located at 300 Alhambra Circel, Coral Gables, FL.<br>
      			Ph. (305) 448-4949<br><br>
                  <strong style="font-size:11px;">Opening Hours:</strong><br>
                  <span style="font-size:11px; color:#666;"><strong>Monday - Thursday:</strong> 7:30am - 7pm,  <strong>Friday:</strong> 7:30am - Midnight<br>
                  <strong>Saturday:</strong> 10:00am - 6:00pm, <strong>Sunday:</strong> Closed</span>
                  </span>
                  </div>
              </div>
              
              <!--

              <div class="ad">
              	<img src="img/thumb10.jpg">
                  <div style="padding:10px 15px 5px 220px;">
                  <img style="float:right;"src="images/cafe_demetrio.jpg"/>
                  <span class="prize">CAFE DEMETRIO</span><br>
                  <span class="description">Located at 300 Alhambra Circel, Coral Gables, FL.<br>
      			Ph. (305) 448-4949<br><br>
                  <strong style="font-size:11px;">Opening Hours:</strong><br>
                  <span style="font-size:11px; color:#666;"><strong>Monday - Thursday:</strong> 7:30am - 7pm,  <strong>Friday:</strong> 7:30am - Midnight<br>
                  <strong>Saturday:</strong> 10:00am - 6:00pm, <strong>Sunday:</strong> Closed</span>
                  </span>
                  </div>
              </div>

              <div class="ad">
              	<img src="img/thumb10.jpg">
                  <div style="padding:10px 15px 5px 220px;">
                  <img style="float:right;"src="images/cafe_demetrio.jpg"/>
                  <span class="prize">CAFE DEMETRIO</span><br>
                  <span class="description">Located at 300 Alhambra Circel, Coral Gables, FL.<br>
      			Ph. (305) 448-4949<br><br>
                  <strong style="font-size:11px;">Opening Hours:</strong><br>
                  <span style="font-size:11px; color:#666;"><strong>Monday - Thursday:</strong> 7:30am - 7pm,  <strong>Friday:</strong> 7:30am - Midnight<br>
                  <strong>Saturday:</strong> 10:00am - 6:00pm, <strong>Sunday:</strong> Closed</span>
                  </span>
                  </div>
              </div>
              
              -->

            </div>
            <!--row ends-->
            
            <!--row-->
            <div class="row">
               <div class="item" style="margin-left: 110px;">
                  <img src="images/50.jpg" />
                  <div style="padding:10px 15px 5px 15px;">
                     <span class="prize">$50 Cash Prize</span><br />
                     <span class="description">$50 cash to spend<br/>however you like!</span>
                  </div>
               </div>
               <div class="item">
                  <img src="images/20.jpg" />
                  <div style="padding:10px 15px 5px 15px;">
                     <span class="prize">$20 Cash Prize</span><br />
                     <span class="description">$20 cash to spend<br/>however you like!</span>
                  </div>
               </div>
               <!--
               <div class="item">
                  <img src="images/thumb3.jpg" />
                  <div style="padding:10px 15px 5px 15px;">
                     <span class="prize">$10 Gift Certificate</span><br />
                     <span class="description">$10 to spend at One Burger!</span>
                  </div>
               </div>
                -->
            </div>
            <!--row ends-->
            <br />
         </div>
         <div class="greenbox">
            <p class="green"><a id="show-winners" href="#" style="color: #437B18; font-size:16px;">Click here to see winners</a></p>
            <p class="green"><a id="hide-winners" href="#" style="color: #437B18; font-size:16px; display: none;">Click here to hide winners</a></p>
            <!-- <div id="previous-winners" style="display: none;"> -->
            <div id="previous-winners">
               &nbsp;<br />
               <span class="headline"><g:formatDate format="MM/dd/yyyy" date="${currentWinners.date}"/> RAFFLE WINNERS</span><br /><br />
               <!--row-->
               <div class="row">
                  <div class="item"> <!-- style="margin-left: 110px;" -->
                     <img src="images/50.jpg" />
                     <div style="padding:10px 15px 5px 15px;">
                        <span class="idnumber">05454</span><br />
                        <span class="prize">$50 Cash Prize</span><br />
                        <span class="description">$50 cash to spend<br/>however you like!</span>
                     </div>
                     <div class="button"><a href="mailto:info@2b4me.com?subject=Claim prize, contestant 07301">Claim Prize</a></div>
                  </div>
                  <div class="item">
                     <img src="images/20.jpg" />
                     <div style="padding:10px 15px 5px 15px;">
                        <span class="idnumber">04199</span><br />
                        <span class="prize">$20 Cash Prize</span><br />
                        <span class="description">$20 cash to spend<br/>however you like!</span>
                     </div>
                     <div class="button"><a href="mailto:info@2b4me.com?subject=Claim prize, contestant 09338">Claim Prize</a></div>
                  </div>
                  <div class="item">
                  	<img src="images/thumb10.jpg">
                      <div style="padding:10px 15px 5px 15px;">
                  	<span class="idnumber">07886</span><br>
                      <span class="prize">$10 Gift Certificate</span><br>
                      <span class="description">Smooth coffee and treats at<br/>Cafe Demetrio</span>
                      </div>
                      <div class="button"><a href="mailto:info@2b4me.com?subject=Claim prize, contestant 04883">Claim Prize</a></div>
                  </div>
               </div>
               <!--row ends-->
               <!--
                  <span class="headline">07/24/2012 RAFFLE WINNERS</span><br><br>
                   -->
               <!--row-->
               <!--
                  <div class="row">
                   	<div class="item">
                    	<img src="images/thumb7.jpg">
                        <div style="padding:10px 15px 5px 15px;">
                    	<span class="idnumber">45678</span><br>
                        <span class="prize">$40 GIFT CERTIFICATE</span><br>
                        <span class="description">Mirko's A Taste of Europe European Cuisine</span>
                        </div>
                        <div class="button"><a href="#">Claim Prize</a></div>
                    </div>
                  
                    <div class="item">
                    	<img src="images/thumb8.jpg">
                        <div style="padding:10px 15px 5px 15px;">
                    	<span class="idnumber">45678</span><br>
                        <span class="prize">$40 GIFT CERTIFICATE</span><br>
                        <span class="description">Mirko's A Taste of Europe European Cuisine</span>
                        </div>
                        <div class="button"><a href="#">Claim Prize</a></div>
                    </div>
                  
                    <div class="item">
                    	<img src="images/thumb9.jpg">
                        <div style="padding:10px 15px 5px 15px;">
                    	<span class="idnumber">45678</span><br>
                        <span class="prize">$40 GIFT CERTIFICATE</span><br>
                        <span class="description">Mirko's A Taste of Europe European Cuisine</span>
                        </div>
                        <div class="button"><a href="#">Claim Prize</a></div>
                    </div>
                  </div>
                  -->
               <!--row ends-->
               <p class="alert">Prizes expired in seven (7) days from being awarded. Don't delay!</p>
               <div class="sub">PREVIOUS WINNERS</div>
               <br />
               
               <p class="prevwin">Drawing of 09/05/2012 <span class="prevwinid">07767</span> wins $50 Cash! <a href="mailto:info@2b4me.com?subject=Claim prize, contestant 02291"><em>Did you win? Claim it now!</em></a></p>
               <br />
               <p class="prevwin">Drawing of 09/05/2012 <span class="prevwinid">09347</span> wins $20 Cash! <a href="mailto:info@2b4me.com?subject=Claim prize, contestant 02291"><em>Did you win? Claim it now!</em></a></p>
               <br />
               <p class="prevwin">Drawing of 09/05/2012 <span class="prevwinid">Mario, from Miami, FL</span> wins $10 Cafe Demetrio Gift Certificate!</p>
               <br />
               
               <p class="prevwin">Drawing of 09/01/2012 <span class="prevwinid">07301</span> wins $50 Cash! <span class="expired">Expired</span></p>
               <br />
               <p class="prevwin">Drawing of 09/01/2012 <span class="prevwinid">Nairobis, from West Miami, FL</span> wins $20 Cash!</p>
               <br />
               <p class="prevwin">Drawing of 09/01/2012 <span class="prevwinid">Melanie, from Miami, FL</span> wins $10 Cafe Demetrio Gift Certificate!</p>
               <br />
               
               <p class="prevwin">Drawing of 08/28/2012 <span class="prevwinid">Fred, from Hialeah, FL</span> wins $50 Cash!</p>
               <br />
               <p class="prevwin">Drawing of 08/28/2012 <span class="prevwinid">02291</span> wins $20 Cash! <span class="expired">Expired</span></p>
               <br />
               
               <p class="prevwin">Drawing of 08/24/2012 <span class="prevwinid">Kevin, from Miami, FL</span> wins $50 Cash!</p>
               <br />
               <p class="prevwin">Drawing of 08/24/2012 <span class="prevwinid">Eddy, from Homestead, FL</span> wins $20 Cash!</p>
               <br />
               
               <p class="prevwin">Drawing of 08/21/2012 <span class="prevwinid">00020</span> wins $50 Cash! <span class="expired">Expired</span></p>
               <br />
               <p class="prevwin">Drawing of 08/21/2012 <span class="prevwinid">01848</span> wins $20 Cash! <span class="expired">Expired</span></p>
               <br />
               
               <!--
               <br />
               <p class="green"><a href="#" id="hide-winners2" style="color: #437B18;">Close</a></p>
                -->
            </div>
         </div>
         <!--greenbox ends-->
      </div>
      <!--! end of #container -->
      <div id="savewed" style="height: 525px; width: 1000px; padding: 0px;">
         <!-- <h2>True local DEALS... with a TWIST</h2> -->
         <div id="countxt" style="margin-left: 150px;"></div>
         <div class="col left" style="margin-top: 32px;">
            <div>
               <h3>Expert Opinions</h3>
               <p class="small">Local experts weigh in on the quality of our offers to give you confidence in the deals you buy. Not sure which deal is best for you? Trust our experts to show you the way.</p>
            </div>
            <div class="second">
               <h3>Mega Deals</h3>
               <p class="small">Some deals just make sense together... and you can benefit! Buying multiple deals at once can net you some big savings ON TOP of the savings you will already have.</p>
            </div>
         </div>
         <img src="images/image-large2.png" style="margin-top: 60px;" />
         <div class="col right" style="margin-top: 32px;">
            <div>
               <h3>Financing</h3>
               <p class="small">Make the dream a reality with available financing on our mega-deals and travel packages. Our financing packages are accessible to most consumers and open the doors to new possibilities.</p>
            </div>
            <div class="second">
               <h3>Local Flavor</h3>
               <p class="small">We don't pretend to know Miami... we live here! We employ local people that know the city inside and out. And we will offer exclusive deals that will let you rediscover the city you love!</p>
            </div>
         </div>
      </div>
      <div class="blocks">
         <img src="images/rings.png" class="smallimage" />
         <div class="subblocks">
            <h2>Wedding Deals</h2>
            <p>We want to offer you the very best in Wedding related deals to ensure the wedding of your dreams! Let us connect you with the perfect wedding venue for your wedding and the best vendors that will give you the highest quality products and services. We can also provide you with event planning that will cover all the aspects of the wedding planning process to start creating your perfect day!</p>
            <ul class="list">
               <li>Event Planning</li>
               <li>Wedding Dresses</li>
               <li>Wedding Venue</li>
            </ul>
            <ul class="list">
               <li>Catering</li>
               <li>Honeymoon</li>
               <li>Gift Registry</li>
            </ul>
         </div>
      </div>
      <div class="blocks">
         <img src="images/travel.png" class="smallimage" />
         <div class="subblocks">
            <h2>Travel Deals</h2>
            <p>If you love traveling, than we have the services you need! We make it easy to plan your next business or leisure trip with exclusive packages available at deep discounts over market prices. Discover destination ideas and see special pricing flights, hotels, car rentals, cruises and more. Or book them all together to get the biggest discounts available. And with available financing, you can make your dream trip a reality!</p>
            <ul class="list">
               <li>Planning</li>
               <li>Discovery</li>
               <li>Vacations</li>
            </ul>
            <ul class="list">
               <li>Flights</li>
               <li>Hotels</li>
               <li>Cars</li>
            </ul>
         </div>
      </div>
      <div class="blocks">
         <img src="images/dining.png" class="smallimage" />
         <div class="subblocks">
            <h2>Dining Deals</h2>
            <p>If you have a big appetite for Miami's unique fare, then 2b4me is the place to be! We can help you find the very best that Miami has to offer at the deepest discounts available. From American to Vietnamese cuisine, we can help you connect with the truly unique offerings Miami has. And if you have a doubt, our <strong>expert chefs</strong> will help you make your choice with confidence. Go, eat, drink and be merry!</p>
            <ul class="list">
               <li>Quality offers</li>
               <li>Best restaurants</li>
               <li>Exclusive deals</li>
            </ul>
            <ul class="list">
               <li>Uniquely local</li>
               <li>Authentic</li>
               <li>Expert opinions</li>
            </ul>
         </div>
         <!--
            <div class="expert-opinion">
               <div class="left">
                  <div class="portrait">
                     <img src="images/chefs.png" />
                  </div>
               </div>
               <div class="right">
                  <div class="opinions">
                     <h3 class="heading">Best Restaurants in Miami</h3>
                     <p>We have expert chefs on staff to provide unbiased commentary on all of our
                        Dining-related deals.
                        No more wondering if a certain deal really is worth the trouble. No more
                        surprises, as you can go confidently to your dining experience knowing what
                        to expect. Focus on having a good time, and let us show you the way.</p>
                     <h3><em>Bon Appetit!</em></h3>
                     <!-
                     <ul>
                        <li>Rest 1</li>
                        <li>Rest 2</li>
                        <li>Rest 3</li>
                     </ul>
                     ->
                  </div>
                  <!-
                  <div class="dishes">
                     <div class="description">
                        Lorem ipsum...
                     </div>
                     <div class="picture">
                        <img src="http://placehold.it/160x90" />
                     </div>
                     <div class="clear-both"></div>
                  </div>
                   ->
               </div>
               <div class="clear-both"></div>
            </div>
             -->
      </div>
      <div class="blocks">
         <img src="images/deals.png" class="smallimage" />
         <div class="subblocks">
            <h2>Connecting Customers and Businesses</h2>
            <p>We pride ourselves on connecting customers with the best Miami has to offer. So it makes sense for businesses to consider promoting their brand, goods and services on 2b4me.com. We work with merchants to help create useful promotions that will be compelling for consumers and generate more business. Fill out our <a id="merchantSignupLink" href="#">Merchant Form</a> and we'll let you know how 2b4me can serve you.</p>
            <ul class="list" style="margin-right: 80px;">
               <li>No upfront costs</li>
               <li>Only pay for deals sold</li>
               <li>Promotion statistics</li>
            </ul>
            <ul class="list">
               <li>Quick turnaround</li>
               <li>POS <strong>and</strong> Online validation</li>
               <li>Promotion advice</li>
            </ul>
         </div>
      </div>
      <div class="blocks" id="expop">
         <div class="block1">
            <h2>Expert Opinions &amp; Reviews</h2>
            <div id="dlg-box">
               <img src="images/chef.png" />
               <h3>The best Dining in town...</h3>
               <p class="small">Our local expert on staff will share their opinions to help you make the best decisions on all of our exclusive 2b4me deals.</p>
            </div>
         </div>
         <div class="block2">
            <h4>Get the best local advice for:</h4>
            <ul class="list">
               <li>Weddings</li>
               <li>Dining</li>
               <li>Retail</li>
               <li>Fashion</li>
            </ul>
            <ul class="list list2" style="padding-top: 14px;">
               <li>Travel</li>
               <li>Entertainment</li>
               <li>Salon and Spa</li>
            </ul>
         </div>
      </div>
      <div class="blocks" id="lastblock">
         <h2>What make us different?</h2>
         <div class="block1">
            <h3>Mega Deals</h3>
            <p class="small">Combine deals or buy pre-packaged deals, the result is the same: <strong>More savings for you!</strong> With our Mega Deals, you will save even more when you buy two more qualifying deals together.</p>
            <div class="deal">
               <h4>Hotel + Flight + Meals </h4>
               <div class="save">
                  <span class="green">SAVE UP TO</span>
                  <span class="percent">40%</span>						
               </div>
            </div>
            <div class="deal">
               <h4>Wedding Rings + Honeymoon</h4>
               <div class="save">
                  <span class="green">SAVE UP TO</span>
                  <span class="percent">33%</span>						
               </div>
            </div>
         </div>
         <div class="block2">
            <h3>Truly Local</h3>
            <p class="small">We don't use the word "Local" lightly. To us, "Local" means offering you deals that make the city you live in unique and special. With our deals you will have access to the best Miami has to offer, in terms of quality and uniqueness. We want you to live and play in the city you love!</p>
            <p>&nbsp;</p>
            <h3>Financing Available</h3>
            <p class="small">Our financing options, available on most deals, will give you unprecedented access to most exciting deals. Let us help you enjoy the vacation of your dreams.</p>
            <p>&nbsp;</p>
         </div>
      </div>
      <!--START FOOTER-->
      <div id="footer">
         <div id="footer-inner">
            <p id="copyright-2b4me">Copyright &copy; 2011 - <span>2012</span> 2b4me, Inc</p>
            <p id="subnav"><a href="http://www.facebook.com/2b4me/posts/320871854654031">Our Story</a></p>
            <p id="social">Follow Us<a href="http://www.facebook.com/2b4me" class="social-btns" id="fb-btn"></a> <a href="https://twitter.com/2b4me_deals" class="social-btns" id="twitter-btn"></a></p>
         </div>
      </div>
      <!--END FOOTER-->
      <div id="shadow-bottom">
         <!--required--> 
      </div>
      <!-- START Email signup success modal -->
      <div class="modal hide fade" id="emailSuccess">
         <div class="modal-header">
            <h3>Thank you for signing up!</h3>
         </div>
         <div class="modal-body">
            <p>You are on your way to possibly winning a $50 deal on 2b4me.com! Keep an eye on your e-mail inbox for an early access link to the demo before the official launch!</p>
         </div>
         <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">Close</a>
         </div>
      </div>
      <!-- END Email signup success modal -->
      <!-- START Merchant signup modal -->
      <div class="modal hide fade" id="merchantSignup">
         <div class="modal-header">
            <h3>Merchant Signup Form</h3>
         </div>
         <div class="modal-body">
            <div id="merchantSignupCopy">
               <p>You are just <strong>moments away</strong> from connecting with the future of online promotions in South Florida! Please fill out the form below, and we will send get in touch to discuss how <strong>2b4me can make a difference in your business</strong>.</p>
               <img id="merchantSignupLogo" src="images/time-is-ticking.png" />
            </div>
            <div id="merchantSignupForm">
               <div id="merchantContactName" class="control-group"><label>Contact name:</label><input type="text" /></div>
               <div id="merchantCompanyName" class="control-group"><label>Company name:</label><input type="text" /></div>
               <div id="merchantContactInfo" class="control-group"><label>Email address (or Phone Number):</label><input type="text" /></div>
               <div id="merchantBusiness" class="control-group"><label>Type of business:</label><input type="text" /></div>
            </div>
            <div id="merchantClearLeft"></div>
            <div id="merchantThankYou" class="hide">
               <div id="merchantThankYouLogo">
                  <img src="images/2b4me-logo-blue-2.png" />
               </div>
               <div id="merchantThankYouMessage">
                  <h3>Thank you for your interest.</h3>
                  <h3>Someone will contact you soon!</h3>
               </div>
            </div>
         </div>
         <div class="modal-footer">
            <span class="help-inline hide">Oops... something went wrong. Please try again.</span>
            <a id="merchantCancel" href="#" class="btn" data-dismiss="modal">Cancel</a>
            <a id="merchantSubmit" href="#" class="btn btn-primary">Submit information</a>
            <a id="merchantClose" href="#" class="btn hide" data-dismiss="modal">Close</a>
         </div>
      </div>
      <!-- END Merchant signup modal -->
      <!-- START contest terms and conditions modal -->
      <div class="modal hide fade" id="contestModal">
         <div class="modal-header">
            <h3>Terms and Conditions</h3>
         </div>
         <div class="modal-body">
            <dl>
               <dt>GENERAL OVERVIEW &amp; CONTEST PERIOD</dt>
               <dd>During the 2B4ME Deal Competition (the "Contest"), 2B4ME (hereinafter "Sponsor") participants will be eligible to win one of the following:  (1) a cash prize in the amount of $50, (2) a cash prize in the amount of $20, (3) a cash prize in the amount of $10, OR (4) a coupon code to get one free deal on <a href="http://www.2b4me.com">http://www.2b4me.com</a> up to $50 in value (four prizes available), or for a discount at a participating retailer. All prizes are in U.S. Dollars. Individuals can participate in the Contest by entering his or her email address on the website: <a href="http://www.2b4me.com">http://www.2b4me.com</a>. The Contest starts on June 18, 2012 at 10 a.m. EST. Winners will be drawn every few days and published on the website. Winners must provide their legal name and address where the cash prize will be mailed. If you are a winner, please allow 2 to 3 weeks for your prize to arrive. Your name and address will be on an official winner's list, only to be shared upon request. Winners have 15 days to claim their prize. You can visit <a href="http://www.2b4me.com">http://www.2b4me.com</a> for more information about the entry requirements, prizes being awarded and current/previous winners, all of which are incorporated herein by reference.</dd>
               <dt>ELIGIBILITY</dt>
               <dd>Contest is open to legal residents of the United States, 18 years of age or older. Employees of Sponsor, prize providers, and their respective parents, subsidiaries, affiliates, promotion and advertising agencies, and members of their immediate family (spouse, parent, children, siblings and their respective spouses, regardless of where they reside) and persons living in the same household, whether or not related, of such employees, are not eligible to enter or win. Void outside the area stated above and where prohibited by law. Contest is subject to all applicable federal, state and local laws.</dd>
               <dt>HOW TO ENTER</dt>
               <dd>During the Contest Period, visit <a href="http://www.2b4me.com">http://www.2b4me.com</a> and enter your email address (the "Entry"). Limit one Entry per person, per email address per Contest. Entries received from any person or email address in excess of the limitation for any Contest will be void. All Entries become the sole property of the Sponsor and will not be returned.</dd>
               <dt>WINNER NOTIFICATION</dt>
               <dd>Sponsor's decisions are final and binding on all matters relating to this Contest.  The potential winner for each Contest will be notified by e-mail at about 4:30 PM EST on the day following Contest drawings and may be required to complete an Affidavit of Eligibility and any other documents required by Sponsor which must be returned within three days of the date appearing on prize notification. Return of prize or prize notification as undeliverable, failure to sign and return requested documentation within the specified time period, the inability of Sponsor to contact a potential winner within a reasonable time period or noncompliance with these Official Rules by any potential winner will result in disqualification and, at Sponsor's sole discretion, the prize may be awarded to a runner-up for the Contest at issue.</dd>
               <dt>PRIZES</dt>
               <dd>Deals expire on the date specified thereon. Prizes are awarded "as is" with no warranty or guarantee, either express or implied by Sponsor. Winners are responsible for all applicable federal, state and local taxes, if any, as well as any other costs and expenses associated with prize acceptance and use not specified herein as being provided.  All prize details are at Sponsor's sole discretion.</dd>
               <dt>GENERAL CONDITIONS</dt>
               <dd>By participating, each entrant agrees: (a) to abide by these Official Rules (including any other requirements and guidelines posted on <a href="http://www.2b4me.com">http://www.2b4me.com</a>, which are incorporated herein by reference) and decisions of Sponsor, which shall be final and binding in all respects relating to this Contest; (b) to release, discharge and hold harmless Sponsor, and their respective parents, affiliates, subsidiaries, and advertising and promotion agencies, and the respective officers, directors, shareholders, employees, agents and representatives of the forgoing (collectively, "Released Parties") from any and all injuries, liability, losses and damages of any kind to persons, including death, or property resulting, in whole or in part, directly or indirectly, from entrant's participation in the Contest or any Contest-related activity or the acceptance, possession, use or misuse of any awarded prize; and (c) to the use of his/her name, voice, performance, photograph/video, image and/or likeness for programming, advertising, publicity and promotional purposes in any and all media, now or hereafter known, worldwide and on the Internet, and in perpetuity by Sponsor and its designees, without compensation (unless prohibited by law) or additional consents from  entrant or any third party and without prior notice, approval or inspection, and to execute specific consent to such use if asked to do so.  By participating, entrant also agrees not to release any publicity or other materials on their own or through someone else regarding their participation in the Contest without the prior consent of the Sponsor, which it may withhold in its sole discretion.  In the event of a conflict between these Official Rules and the terms of any Weekly Contest, the terms of such Weekly Contest will control.</dd>
               <dt>MISCELLANEOUS</dt>
               <dd>Released Parties are not responsible for lost, late, incomplete, damaged, inaccurate, illegible, stolen, delayed, misdirected, undelivered, or garbled Entries; or for lost, interrupted or unavailable network, server, Internet Service Provider (ISP), website, or other connections, availability or accessibility or miscommunications or failed computer, satellite, telephone or cable transmissions, lines, or technical failure or jumbled, scrambled, delayed, or misdirected transmissions or computer hardware or software malfunctions, failures or difficulties, or other errors or difficulties of any kind whether human, mechanical, electronic, computer, network, typographical, printing or otherwise relating to or in connection with the Contest, including, without limitation, errors or difficulties which may occur in connection with the administration of the Contest, the processing or judging of Entries, the announcement of the prizes, the incorrect uploading of any video or photo (as applicable), the unavailability of any Weekly Deal or in any Contest-related materials.  Released Parties are also not responsible for any incorrect or inaccurate information, whether caused by site users, tampering, hacking, or by any equipment or programming associated with or utilized in the Contest.  Released Parties are not responsible for injury or damage to any person's computer related to or resulting from participating in this Contest or downloading materials from or use of the website.  Persons who tamper with or abuse any aspect of the Contest or website, who act in an unsportsmanlike or disruptive manner or who are in violation of these Official Rules, as solely determined by Sponsor, will be disqualified and all associated Entries will be void. Should any portion of the Contest be, in Sponsor's sole opinion, compromised by virus, worms, bugs, non-authorized human intervention or other causes which, in the sole opinion of the Sponsor, corrupt or impair the administration, security, fairness or proper play, or submission of Entries, Sponsor reserves the right at its sole discretion to suspend, modify or terminate the Contest and, if terminated, at its discretion, select the potential winner(s) for the Daily Contest(s) at issue from all eligible, non-suspect Entries received for the applicable Contest(s) prior to action taken using the judging procedure outlined above. CAUTION: ANY ATTEMPT TO DELIBERATELY DAMAGE THE WEBSITE OR UNDERMINE THE LEGITIMATE OPERATION OF THE CONTEST MAY BE IN VIOLATION OF CRIMINAL AND CIVIL LAWS AND SHOULD SUCH AN ATTEMPT BE MADE, SPONSOR RESERVES THE RIGHT TO SEEK DAMAGES AND OTHER REMEDIES (INCLUDING ATTORNEYS' FEES) FROM ANY SUCH INDIVIDUAL TO THE FULLEST EXTENT OF THE LAW, INCLUDING CRIMINAL PROSECUTION; JURISDICTION AND VENUE FOR ANY LEGAL DISPUTES CONCERNING ANY ASPECT OF THE CONTEST SHALL BE IN MIAMI-DADE COUNTY, FLORIDA.</dd>
               <dt>CONTACT</dt>
               <dd>Feel free to contact us with any questions or concerns via email at <a href="mailto:info@2b4me.com">info@2b4me.com</a>.</dd>
            </dl>
         </div>
         <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">Close</a>
            <a href="terms-and-conditions-print.html" target="_blank" class="btn btn-primary">Print</a>
         </div>
      </div>
      <!-- END contest terms and conditions modal -->
      <!-- START privacy modal -->
      <div class="modal hide fade" id="privacyModal">
         <div class="modal-header">
            <h3>Privacy Policy</h3>
         </div>
         <div class="modal-body">
            <dl>
               <dt>What information do we collect?</dt>
               <dd>We collect information from you when you register on our site, place an order, subscribe to our newsletter, respond to a survey or fill out a form.</dd>
               <dd>When ordering or registering on our site, as appropriate, you may be asked to enter your: name, e-mail address, mailing address, phone number or credit card information. You may, however, visit our site anonymously.</dd>
               <dt>What do we use your information for?</dt>
               <dd>Any of the information we collect from you may be used in one of the following ways:</dd>
               <dd>; To personalize your experience<br />
                  (your information helps us to better respond to your individual needs)
               </dd>
               <dd>; To improve our website<br />
                  (we continually strive to improve our website offerings based on the information and feedback we receive from you)
               </dd>
               <dd>; To improve customer service<br />
                  (your information helps us to more effectively respond to your customer service requests and support needs)
               </dd>
               <dd>; To process transactions<br />
                  Your information, whether public or private, will not be sold, exchanged, transferred, or given to any other company for any reason whatsoever, without your consent, other than for the express purpose of delivering the purchased product or service requested.
               </dd>
               <dd>; To administer a contest, promotion, survey or other site feature</dd>
               <dd>; To send periodic emails<br />
                  The email address you provide for order processing, may be used to send you information and updates pertaining to your order, in addition to receiving occasional company news, updates, related product or service information, etc.
               </dd>
               <dd>Note: If at any time you would like to unsubscribe from receiving future emails, If at any time you would like to unsubscribe from receiving future emails, please send an e-mail to info@2b4me.com with the subject line "UNSUBSCRIBE" to be immediately removed from all future communications from 2b4me.com.</dd>
               <dt>How do we protect your information?</dt>
               <dd>We implement a variety of security measures to maintain the safety of your personal information when you place an order or enter, submit, or access your personal information.</dd>
               <dd>We offer the use of a secure server. All supplied sensitive/credit information is transmitted via Secure Socket Layer (SSL) technology and then encrypted into our Payment gateway providers database only to be accessible by those authorized with special access rights to such systems, and are required to?keep the information confidential.</dd>
               <dd>After a transaction, your private information (credit cards, social security numbers, financials, etc.) will not be stored on our servers.</dd>
               <dt>Do we use cookies?</dt>
               <dd>Yes (Cookies are small files that a site or its service provider transfers to your computers hard drive through your Web browser (if you allow) that enables the sites or service providers systems to recognize your browser and capture and remember certain information.</dd>
               <dd>We use cookies to keep track of advertisements and compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future.</dd>
               <dt>Do we disclose any information to outside parties?</dt>
               <dd>We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. This does not include trusted third parties who assist us in operating our website, conducting our business, or servicing you, so long as those parties agree to keep this information confidential. We may also release your information when we believe release is appropriate to comply with the law, enforce our site policies, or protect ours or others rights, property, or safety. However, non-personally identifiable visitor information may be provided to other parties for marketing, advertising, or other uses.</dd>
               <dt>Third party links</dt>
               <dd>Occasionally, at our discretion, we may include or offer third party products or services on our website. These third party sites have separate and independent privacy policies. We therefore have no responsibility or liability for the content and activities of these linked sites. Nonetheless, we seek to protect the integrity of our site and welcome any feedback about these sites.</dd>
               <dt>California Online Privacy Protection Act Compliance</dt>
               <dd>Because we value your privacy we have taken the necessary precautions to be in compliance with the California Online Privacy Protection Act. We therefore will not distribute your personal information to outside parties without your consent.</dd>
               <dt>Childrens Online Privacy Protection Act Compliance</dt>
               <dd>We are in compliance with the requirements of COPPA (Childrens Online Privacy Protection Act), we do not collect any information from anyone under 13 years of age. Our website, products and services are all directed to people who are at least 13 years old or older.</dd>
               <dt>Terms and Conditions</dt>
               <dd>Please also visit our Terms and Conditions section establishing the use, disclaimers, and limitations of liability governing the use of our website at <a href="http://www.2b4me.com">http://www.2b4me.com</a></dd>
               <dt>Your Consent</dt>
               <dd>By using our site, you consent to our websites privacy policy.</dd>
               <dt>Changes to our Privacy Policy</dt>
               <dd>If we decide to change our privacy policy, we will post those changes on this page, send an email notifying you of any changes, and/or update the Privacy Policy modification date below.</dd>
               <dd>This policy was last modified on 7/24/2012</dd>
               <dt>Contacting Us</dt>
               <dd>If there are any questions regarding this privacy policy you may contact us using the information below.</dd>
               <dd>http://www.2b4me.com<br />
                  55 Merrick Way<br />
                  Coral Gables, FL 33134<br />
                  United States<br />
                  info@2b4me.com
               </dd>
            </dl>
         </div>
         <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">Close</a>
            <a href="privacy-print.html" target="_blank" class="btn btn-primary">Print</a>
         </div>
      </div>
      <!-- END privacy modal -->
      <script type="text/javascript" src="jquery-1.7.2.js"></script>
      <script type="text/javascript" src="bootstrap.js"></script>
      <script type="text/javascript" src="promo.js"></script>
      <script type="text/javascript">
         var _gaq = _gaq || [];
         _gaq.push(['_setAccount', 'UA-30565832-1']);
         _gaq.push(['_setDomainName', '2b4me.com']);
         _gaq.push(['_trackPageview']);
         
         (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
         })();
      </script>
   </body>
</html>

</g:else>