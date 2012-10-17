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
         <!-- START SLIDER -->
         <g:include controller="featured" action="deals" params="[selectedDealIndex: 0]" />
         <!-- END SLIDER -->
         <!--START CONTEST AREA-->
         <div id="contest-area">
            <div id="stamps"><img src="images/stamps.png" /></div>
            <p>
               <span class="headline">WEBSITE LAUNCH PROMOTION!</span><br />
               <span class="sub">You could win CASH and DEALS up to $50 value!</span>
            </p>
            <div>
               <p id="contest-form-confirmation" style="display:none;height:29px;margin-bottom:-6px;margin-top:29px;">Thank you for signing up! Your contest number has been sent to you by e-mail.</p>
               <form id="contest-form">
                  <input id="contest-signup-email-input" class="textfieldstyle" name="textfield" type="text" size="30" value="Email Address" />
                  <input id="contest-signup-zipCode-input" class="textfieldstyle" name="textfield" type="text" size="15" value="Zip Code" />
                  <div id="contest-signup-submit-btn-wrapper">
                     <button id="contest-signup-submit-btn" type="submit" class="button">Sign up</button>
                  </div>
               </form>
               <p class="small" id="terms">For full contest rules  <a data-toggle="modal" href="#contestModal">click here</a>. If you lose your contest number, just submit your e-mail address again and it will be e-mailed to you. Your privacy is very important to us, <a data-toggle="modal" href="#privacyModal">click here to read our privacy policy</a>.</p>
            </div>
            <div>
               <p id="next-drawing">NEXT DRAWING'S PRIZES ON <strong id="nextDrawingDate"><g:formatDate format="MM/dd/yyyy" date="${nextDrawingDate}" /></strong></p>
               <p id="next-drawing-countdown"><img style="margin-bottom:3px; margin-right:3px;" src="images/clock.png" /><span id="d2">2</span> <span id="d2desc">DAYS</span> : <span id="h2">23</span> HOURS : <span id="m2">59</span> MINS : <span id="s2">59</span> SEC</p>
            </div>
            <div class="row">
               <div class="ad">
                  <img src="images/cafe-dem.jpg">
                  <div class="ad-content">
                     <img style="float:right;"src="images/cafe-dem-2.jpg"/>
                     <span class="prize">$10 Gift Certificate to<br/>CAFE DEMETRIO</span><br>
                     <span class="description">
                        300 Alhambra Circle<br/>Coral Gables, FL.<br>
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
               <g:each in="${prizes}" var="p" status="i">
                  <g:if test="${i == 0}">
                     <div class="item first-item">
                  </g:if>
                  <g:else>
                     <div class="item">
                  </g:else>
                     <img src="https://s3.amazonaws.com/2b4me-contest/${p.name}.jpg" />
                     <div style="padding:10px 15px 5px 15px;">
                        <span class="prize">${p.name}</span><br />
                        <span class="description">${p.description}</span>
                     </div>
                  </div>
               </g:each>
            </div>
         </div>
         <!--END CONTEST AREA-->
         <!--START WINNERS AREA-->
         <div id="currentWinnersCount" style="display:none;">${contest.currentWinners.size()}</div>
         <div id="winners-area">
            <p class="toggle"><a id="show-winners" href="#">Click here to see winners</a></p>
            <p class="toggle"><a id="hide-winners" href="#" style="display: none;">Click here to hide winners</a></p>
            <div id="previous-winners" style="display: none;">
               &nbsp;<br />
               <span class="headline"><g:formatDate format="MM/dd/yyyy" date="${contest.currentWinnersDrawingDate}"/> RAFFLE WINNERS</span><br /><br />
               <!--row-->
               <div class="row">
                  <g:each in="${contest.currentWinners}" var="w" status="i">
                     <g:if test="${i == 0}">
                        <div class="item first-item">
                     </g:if>
                     <g:else>
                        <div class="item">
                     </g:else>
                        <img src="https://s3.amazonaws.com/2b4me-contest/${w.prize}.jpg" />
                        <div style="padding:10px 15px 5px 15px;">
                           <span class="idnumber">${w.winningNumber}</span><br />
                           <span class="prize">${w.prize}</span><br />
                           <span class="description">${w.prizeDesc}</span>
                        </div>
                        <div class="button"><a href="mailto:info@2b4me.com?subject=Claim prize, contestant ${w.winningNumber}">Claim Prize</a></div>
                     </div>
                  </g:each>
               </div>
               <div id="contest-alert">
                  <p class="contest-alert">Prizes expire in three (3) days from being awarded. Don't delay!</p>
               </div>
               <div class="sub">RECENT WINNERS</div>
               <br />
               
               <g:each in="${contest.pastWinners}" var="w" status="i">
                  <p class="prevwin">Drawing of <g:formatDate format="MM/dd/yyyy" date="${w.drawingDate}"/> <span class="prevwinid">${w.winningNumber}</span> wins the ${w.prize}! <span class="expired">Expired</span></p>
                  <br />
               </g:each>
               
               <!--
               <br />
               <p class="green"><a href="#" style="color: #437B18;">See Full List</a></p>
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