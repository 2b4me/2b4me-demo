<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Home</title>
      <g:external dir="css" file="stylesheet.css" />
      <g:external dir="css" file="stylesheet-ext.css" />
   </head>
   <body>
      <!--START HEADER-->
      <div id="header">
         <g:include controller="featured" action="top" />
      </div>
      <!-- END HEADER -->
      <!-- START CONTAINER-->
      <div class="container" id="home">
         <%--
         <!-- START SLIDER -->
         <g:include controller="featured" action="deals" params="[selectedDealIndex: 0]" />
         <!-- END SLIDER -->
          --%>
         <!--START CONTEST AREA-->
         <div id="contest-area">
            <div id="stamps"><img src="images/stamps.png" /></div>
            <p>
               <span class="headline">WEBSITE LAUNCH PROMOTION!</span><br />
               <span class="sub">You could win CASH and DEALS up to $50 value!</span>
            </p>
            <div>
               <form>
                  <input id="contest-signup-email-input" class="textfieldstyle" name="textfield" type="text" size="30" value="Email Address" />  <input id="contest-signup-zipCode-input" class="textfieldstyle" name="textfield" type="text" size="15" value="Zip Code" />  <button id="contest-signup-submit-btn" type="submit" class="button">Sign up</button>
               </form>
               <p class="small" id="terms">For full contest rules  <a data-toggle="modal" href="#contestModal">click here</a>. If you lose your contest number, just submit your e-mail address again and it will be e-mailed to you. Your privacy is very important to us, <a data-toggle="modal" href="#privacyModal">click here to read our privacy policy</a>.</p>
            </div>
            <div>
               <p id="next-drawing">NEXT DRAWING'S PRIZES ON <strong>10/9/2012</strong></p>
               <p id="next-drawing-countdown"><img style="margin-bottom:3px; margin-right:3px;" src="images/clock.png" /><span id="d2">2</span> <span id="d2desc">DAYS</span> : <span id="h2">23</span> HOURS : <span id="m2">59</span> MINS : <span id="s2">59</span> SEC</p>
            </div>
            <div class="row">
               <div class="ad">
                  <img src="images/cafe-dem.jpg">
                  <div class="ad-content">
                     <img style="float:right;"src="images/cafe-dem-2.jpg"/>
                     <span class="prize">$10 Gift Certificate to<br/>CAFE DEMETRIO</span><br>
                     <span class="description">
                        Located at 300 Alhambra Circel, Coral Gables, FL.<br>
                        Ph. (305) 448-4949<br><br>
                        <strong style="font-size:11px;">Opening Hours:</strong><br>
                        <span style="font-size:11px; color:#666;"><strong>Monday - Thursday:</strong> 7:30am - 7pm,  <strong>Friday:</strong> 7:30am - Midnight<br>
                           <strong>Saturday:</strong> 10:00am - 6:00pm, <strong>Sunday:</strong> Closed
                        </span>
                     </span>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="item"> <!--style="margin-left: 110px;"-->
                  <img src="images/50.jpg" />
                  <div style="padding:10px 15px 5px 15px;">
                     <span class="prize">$50 Cash Prize</span><br />
                     <span class="description">$50 cash to spend<br/>however you like!</span>
                  </div>
               </div>
               <div class="item">
                  <img src="images/40.jpg" />
                  <div style="padding:10px 15px 5px 15px;">
                     <span class="prize">$40 Cash Prize</span><br />
                     <span class="description">$40 cash to spend<br/>however you like!</span>
                  </div>
               </div>
               <div class="item">
                  <img src="images/20.jpg" />
                  <div style="padding:10px 15px 5px 15px;">
                     <span class="prize">$20 Cash Prize</span><br />
                     <span class="description">$20 cash to spend<br/>however you like!</span>
                  </div>
               </div>
            </div>
         </div>
         <!--END CONTEST AREA-->
         <!--START WINNERS AREA-->
         <div id="winners-area">
            <p class="toggle"><a id="show-winners" href="#">Click here to see winners</a></p>
            <p class="toggle"><a id="hide-winners" href="#" style="display: none;">Click here to hide winners</a></p>
            <div id="previous-winners" style="display: none;">
               &nbsp;<br />
               <span class="headline">10/06/2012 RAFFLE WINNERS</span><br /><br />
               <!--row-->
               <div class="row">
                  <div class="item" style="height:275px;"> <!--style="margin-left: 110px;"-->
                     <img src="images/50.jpg" />
                     <div style="padding:10px 15px 5px 15px;">
                        <span class="idnumber">01143</span><br />
                        <span class="prize">$50 Cash Prize</span><br />
                        <span class="description">$50 cash to spend<br/>however you like!</span>
                     </div>
                     <div class="button"><a href="mailto:info@2b4me.com?subject=Claim prize, contestant 01143">Claim Prize</a></div>
                  </div>
                  <div class="item" style="height:275px;">
                     <img src="images/20.jpg" />
                     <div style="padding:10px 15px 5px 15px;">
                        <span class="idnumber">08407</span><br />
                        <span class="prize">$20 Cash Prize</span><br />
                        <span class="description">$20 cash to spend<br/>however you like!</span>
                     </div>
                     <div class="button"><a href="mailto:info@2b4me.com?subject=Claim prize, contestant 08407">Claim Prize</a></div>
                  </div>
                  <div class="item" style="height:275px;">
                  	<img src="images/cafe-dem.jpg">
                      <div style="padding:10px 15px 5px 15px;">
                  	<span class="idnumber">09799</span><br>
                      <span class="prize">$10 Gift Certificate</span><br>
                      <span class="description">Smooth coffee and treats at<br/>Cafe Demetrio</span>
                      </div>
                      <div class="button"><a href="mailto:info@2b4me.com?subject=Claim prize, contestant 09799">Claim Prize</a></div>
                  </div>
               </div>
               <p class="contest-alert">Prizes expire in three (3) days from being awarded. Don't delay!</p>
               <div class="sub">PREVIOUS WINNERS</div>
               <br />
               
               <p class="prevwin">Drawing of 09/29/2012 <span class="prevwinid">07981</span> wins $50 Cash! <span class="expired">Expired</span></p>
               <br />
               <p class="prevwin">Drawing of 09/29/2012 <span class="prevwinid">03400</span> wins $20 Cash! <span class="expired">Expired</span></p>
               <br />
               <p class="prevwin">Drawing of 09/29/2012 <span class="prevwinid">02291</span> $10 Cafe Demetrio Gift Certificate! <span class="expired">Expired</span></p>
               <br />
               
               <p class="prevwin">Drawing of 09/29/2012 <span class="prevwinid">08751</span> wins $50 Cash! <span class="expired">Expired</span></p>
               <br />
               <p class="prevwin">Drawing of 09/29/2012 <span class="prevwinid">03165</span> wins $20 Cash! <span class="expired">Expired</span></p>
               <br />
               <p class="prevwin">Drawing of 09/29/2012 <span class="prevwinid">09021</span> $10 Cafe Demetrio Gift Certificate! <span class="expired">Expired</span></p>
               <br />
               
               <p class="prevwin">Drawing of 09/25/2012 <span class="prevwinid">03077</span> wins $50 Cash! <span class="expired">Expired</span></p>
               <br />
               <p class="prevwin">Drawing of 09/25/2012 <span class="prevwinid">01848</span> wins $20 Cash! <span class="expired">Expired</span></p>
               <br />
               <p class="prevwin">Drawing of 09/25/2012 <span class="prevwinid">08945</span> wins $10 Cafe Demetrio Gift Certificate! <span class="expired">Expired</span></p>
               <br />
               
               <p class="prevwin">Drawing of 09/22/2012 <span class="prevwinid">Maria, from Hialeah, FL</span> wins $50 Cash!</p>
               <br />
               <p class="prevwin">Drawing of 09/22/2012 <span class="prevwinid">Adilen, from Hialeah, FL</span> wins $20 Cash!</p>
               <br />
               <p class="prevwin">Drawing of 09/22/2012 <span class="prevwinid">Francisco, from Miami, FL</span> wins $10 Cafe Demetrio Gift Certificate!</p>
               <br />
               
               <p class="prevwin">Drawing of 09/18/2012 <span class="prevwinid">Sabrina, from Hialeah, FL</span> wins $50 Cash!</p>
               <br />
               <p class="prevwin">Drawing of 09/18/2012 <span class="prevwinid">03236</span> wins $20 Cash! <span class="expired">Expired</span></p>
               <br />
               <p class="prevwin">Drawing of 09/18/2012 <span class="prevwinid">06937</span> wins $10 Cafe Demetrio Gift Certificate! <span class="expired">Expired</span></p>
               <br />
               
               <p class="prevwin">Drawing of 09/15/2012 <span class="prevwinid">07981</span> wins $50 Cash! <span class="expired">Expired</span></p>
               <br />
               <p class="prevwin">Drawing of 09/15/2012 <span class="prevwinid">00564</span> wins $20 Cash! <span class="expired">Expired</span></p>
               <br />
               <p class="prevwin">Drawing of 09/15/2012 <span class="prevwinid">00111</span> wins $10 Cafe Demetrio Gift Certificate! <span class="expired">Expired</span></p>
               <br />
               
               <!--
               <br />
               <p class="green"><a href="#" id="hide-winners2" style="color: #437B18;">Close</a></p>
                -->
            </div>
         </div>
         <!--END WINNERS AREA-->
         <!--START BOTTOM-->
         <div id="bottom">
            <div id="bottom-inner">
               <div id="bottom-main-block">
                  <div id="bottom-block1" class="bottom-blocks">
                     <h3>Update your profile</h3>
                     <p>By keeping your profile up to date, you can receive the latest offers and make buying deals as easy as 1-2-3.<br />&nbsp;<br />
                        <g:link controller="profile">Click here to update your profile now</g:link>
                     </p>
                  </div>
                  <div id="bottom-block2" class="bottom-blocks">
                     <h3>How does it work?</h3>
                     <p>2b4me works hard to search the city you love for the things that make it special and unique. Then we connect you with these things to give you an opportunity to fall in love with your city all over again - at a discount.
                        <g:link controller="company" action="index">Read More</g:link>
                     </p>
                  </div>
                  <div id="bottom-block3" class="bottom-blocks">
                     <h3>Manage your deals</h3>
                     <p>Need to print out that voucher before you go out? Or want to see a quick list of the deals you've purchased? <g:link controller="profile">Click here</g:link>.</p>
                  </div>
               </div>
            </div>
         </div>
         <!-- END BOTTOM-->
         <!--START FOOTER-->
         <div id="footer">
            <g:include controller="featured" action="bottom" />
         </div>
         <!--END FOOTER-->
         <div id="shadow-bottom">
            <!--required-->
         </div>
      </div>
      <!-- END CONTAINER -->
      <!-- START LOGIN FORM -->
      <g:include controller="user" action="loginForm" />
      <!-- END LOGIN FORM -->
      <!--PAGE SCRIPT -->
      <g:external dir="js" file="jquery-1.7.2.js" />
      <g:external dir="js" file="custom-ui.js" />
      <g:external dir="js" file="custom-ui-ext.js" />
      <g:external dir="js" file="featured.js" />
      <g:external dir="js" file="contest.js" />
   </body>
</html>