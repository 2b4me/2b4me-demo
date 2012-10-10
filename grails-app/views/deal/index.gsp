<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Deal Landing</title>
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
      <div class="container" id="landing">
         <!--START CONTAINER-INNER-->
         <div id="container-inner">
            <!--do not remove this div-->
            <!-- START MAIN CONTENT (the deal info.) -->
            <div id="content-main">
               <img src="https://s3.amazonaws.com/2b4me-deals/${deal.shortName}-detail-photo.jpg" id="main-photo" />
               <div id="deal-info">
                  <h1>${deal.title}</h1>
                  <p id="deal-desc">${deal.teaser}</p>
                  <div id="deal-price">
                     <span class="actual-price"><g:formatNumber number="${deal.price}" format="\$###,##0" /></span>
                     <g:link controller="purchase" action="deal" id="${deal.shortName}" class="green-btn lvl2" elementId="buynow-deal">buy now</g:link>
                  </div>
                  <div id="deal-off">
                     <span id="off">${deal.discountInPct()}%</span><small>off</small>
                     <span id="remain">${daysRemaining} days remaining</span>
                     <!-- <a href="#" id="get-yours" class="nyi">Get yours free</a> -->
                  </div>
                  <div id="sharing" style="margin-top: 25px; width: 500px;">
                     <div id="share-tweet">
                        <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en">Tweet</a>
                     </div>
                     <div id="share-fb" style="margin-top: -2px; margin-left: -30px;">
                        <div class="fb-like" data-send="false" data-show-faces="false" data-width="250"></div>
                     </div>
                     <!--
                     <a href="#" class="nyi" id="share-email">Email</a>
                      -->
                  </div>
               </div>
               <div id="details">
                  <div id="location-box">
                     <p class="small" id="address">
                        <strong>${deal.vendor.name}</strong>
                        ${deal.vendor.address.address1}<br />
                        ${deal.vendor.address.city}, ${deal.vendor.address.state} ${deal.vendor.address.postalCode}<br />
                        <!--
                        P: (305) 555-1212<br />
                        F: (305) 555-1213<br />
                         -->
                        &nbsp;<br />
                        <g:include action="mapImage" id="${deal.id}" params="[w: '155', h: '125']" /></br />
                        <g:include action="mapLink" id="${deal.id}" /><br />
                        &nbsp;
                     </p>
                  </div>
                  <div id="more-details">
                     <!-- <h3>More details</h3> -->
                     <h3>&nbsp;</h3>
                     <p class="details-p">${deal.fullDescription}</p>
                     <!--
                     <p class="details-p">Morbi condimentum tincidunt metus, in euismod quam congue vitae. Duis euismod lectus vitae lectus lacinia fringilla. Nam sed massa ut dui pellentesque tristique a ut risus. Proin vulputate quam sed quam imperdiet a laoreet tortor pretium. Curabitur dui ante, condimentum ac consectetur nec, <a href="#">Some Link</a> consectetur non leo. </p>
                     <p class="details-p">Ut laoreet est vitae lacus imperdiet mollis fermentum nunc tempus.Nam fermentum sem vel eros ullamcorper iaculis. Maecenas facilisis gravida gravida. Quisque augue odio, suscipit in euismod a, faucibus eu orci.</p>
                     -->
                     <h5 id="terms">Terms &amp; Conditions</h5>
                     <p class="small terms-p">
                        <g:each in="${deal.terms}" var="t">
                        ${t}
                        </g:each>
                     </p>
                     <p class="small terms-p">Except where noted in the above terms, this deal cannot be combined with any other offer or promotion. Tax and gratuity are not included. <!-- See the full 2b4me conditions by clicking <a href="#">here</a>. -->Paid value does not expire but promotional value expires <g:formatDate format="MMMM d, yyyy" date="${deal.expiration}"/>.</p>
                  </div>
               </div>
            </div>
            <!-- END MAIN CONTENT (the deal info.) -->
            <!-- START RELATED DEALS -->
            <g:include action="relatedDeals" id="${deal.id}" />
            <!-- END RELATED DEALS -->
         </div>
         <!--START CONTAINER-INNER-->
         <!--START FOOTER-->
         <div id="footer">
            <g:include controller="featured" action="bottom" />
         </div>
         <!--END FOOTER-->
      </div>
      <!-- END CONTAINER -->
      <div id="shadow-bottom">
         <!--required--> 
      </div>
      <!-- START LOGIN FORM -->
      <g:include controller="user" action="loginForm" />
      <!-- END LOGIN FORM -->
      <!--PAGE SCRIPT -->
      <g:external dir="js" file="jquery-1.7.2.js" />
      <g:external dir="js" file="custom-ui.js" />
      <g:external dir="js" file="custom-ui-ext.js" />
      <div id="fb-root"></div>
      <script>(function(d, s, id) {
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) return;
         js = d.createElement(s); js.id = id;
         js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=151231185021518";
         fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>
      <script>!function(d,s,id){
         var js,fjs=d.getElementsByTagName(s)[0];
         if(!d.getElementById(id)){
            js=d.createElement(s);
            js.id=id;
            js.src="https://platform.twitter.com/widgets.js";
            fjs.parentNode.insertBefore(js,fjs);
         }
      }(document,"script","twitter-wjs");</script>
   </body>
</html>