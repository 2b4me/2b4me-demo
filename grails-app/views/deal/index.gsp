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
               <r:img uri="/images/deals/${deal.shortName}-detail-photo.jpg" id="main-photo" />
               <div id="deal-info">
                  <h1>${deal.title}</h1>
                  <p id="deal-desc">${deal.teaser}</p>
                  <div id="deal-price">
                     <span class="actual-price"><g:formatNumber number="${deal.price}" format="\$###,##0" /></span>
                     <g:link controller="deal" action="purchase" id="${deal.shortName}" class="green-btn lvl2" elementId="buynow-deal">buy now</g:link>
                  </div>
                  <div id="deal-off">
                     <span id="off">${deal.discountInPct()}%</span><small>off</small>
                     <span id="remain">5 days remaining</span>
                     <a href="#" id="get-yours" class="nyi">Get yours free</a>
                  </div>
                  <div id="sharing">
                     <span>Share this Deal</span>
                     <div id="share-fb">
                        <a href="#" class="nyi">
                           <r:img uri="/images/share-fb.png" />
                        </a>
                     </div>
                     <div id="share-tweet">
                        <a href="#" class="nyi">
                           <r:img uri="/images/share-tweet.png" />
                        </a>
                     </div>
                     <a href="#" class="nyi" id="share-email">Email</a>
                  </div>
               </div>
               <div id="details">
                  <div id="location-box">
                     <p class="small" id="address">
                        <strong>Hilton Head Island Villas</strong> 7600 Sunny Lane Rd. #802 Hilton Head Island, SC 22980 <a href="#">Map It</a><br /><br />P: (342) 654-8977 <br /> F: (342) 654-8900
                     </p>
                  </div>
                  <div id="more-details">
                     <h3>More details</h3>
                     <p class="details-p">Morbi condimentum tincidunt metus, in euismod quam congue vitae. Duis euismod lectus vitae lectus lacinia fringilla. Nam sed massa ut dui pellentesque tristique a ut risus. Proin vulputate quam sed quam imperdiet a laoreet tortor pretium. Curabitur dui ante, condimentum ac consectetur nec, <a href="#">Some Link</a> consectetur non leo. </p>
                     <p class="details-p">Ut laoreet est vitae lacus imperdiet mollis fermentum nunc tempus.Nam fermentum sem vel eros ullamcorper iaculis. Maecenas facilisis gravida gravida. Quisque augue odio, suscipit in euismod a, faucibus eu orci.</p>
                     <h5 id="terms">Terms &amp; Conditions</h5>
                     <p class="small terms-p">Nulla lacus velit, scelerisque eu pharetra id, interdum vel massa. Duis suscipit, quam at auctor iaculis, mi justo dictum magna, at venenatis lacus nisi id dui. Nullam eu velit ac sapien porttitor placerat. </p>
                     <p class="small terms-p">In hac habitasse platea dictumst. Praesent porta, lorem ut tincidunt cursus, risus risus rutrum metus, vitae viverra tellus mi nec urna. Nulla facilisi. Nullam vel nisl a lorem pretium commodo non semper nulla. <a href="#">Other Conditions Apply</a> Paid value does not expire - promotional value expires December 14, 2012</p>
                  </div>
               </div>
            </div>
            <!-- END MAIN CONTENT (the deal info.) -->
            <!-- START RELATED DEALS -->
            <div id="related">
               <div id="related-head">
                  <a href="#" class="biglink" id="seerel">See more related deals</a>
                  <a href="#" class="biglink" id="browserel">Browse all deals</a>
               </div>
               <g:each var="relatedDeal" in="${relatedDeals}" status="i">
                  <div class="relblocks" id="relblock${i+1}">
                     <r:img uri="/images/deals/${relatedDeal.shortName}-related-deal-photo.jpg" class="deal-photos" />
                     <h4 class="dealnames"><g:link controller="deal" action="index" id="${relatedDeal.shortName}">${relatedDeal.title}</g:link></h4>
                     <p class="small">${relatedDeal.hoverTeaser} <a href="#" class="nyi">Read More</a></p>
                     <div class="deals-price">
                        <span class="nowonly">Now Only</span>
                        <span class="actual-price"><g:formatNumber number="${relatedDeal.price}" format="\$###,##0" /></span>
                        <span class="prev-price"><g:formatNumber number="${relatedDeal.originalPrice}" format="\$###,##0" /></span>
                        <g:link controller="deal" action="index" id="${relatedDeal.shortName}" class="green-btn buynow">Buy now</g:link>
                     </div>
                  </div>
               </g:each>
            </div>
            <!-- END RELATED DEALS -->
         </div>
         <!--START CONTAINER-INNER-->
         <!-- InstanceEndEditable -->
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
      <!--PAGE SCRIPT -->
      <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
      <g:external dir="js" file="custom-ui.js" />
   </body>
</html>