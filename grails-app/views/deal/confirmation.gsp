<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Deal Purchase Confirmation</title>
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
      <div class="container" id="purchase">
         <!-- InstanceBeginEditable name="container-inner" -->
         <!--START CONTAINER-INNER-->
         <div id="container-inner">
            <!--do not remove this div-->
            <!--START MSG-->
            <div id="msg">
               <div id="congrats"></div>
               <div id="msg-info">
                  <p id="advice">You have purchased this deal on:</p>
                  <span id="msg-date"><g:formatDate format="MMM dd, yyyy" date="${date}"/></span>
                  <span id="msg-for">for</span>
                  <span id="msg-price"><g:formatNumber number="${deal.price}" format="\$###,##0" /></span>
               </div>
            </div>
            <!--END MSG-->
            <!-- START MAIN CONTENT (the deal info.) -->
            <div id="content-main">
               <img src="https://s3.amazonaws.com/2b4me-deals/${deal.shortName}-detail-photo.jpg" id="main-photo" />
               <div id="deal-info">
                  <h1>${deal.title}</h1>
                  <p id="add-line">${deal.teaser}</p>
                  <p id="reference">Reference: ${purchase.voucher}</p>
                  <div id="redeem" class="deal-date">
                     <p>Redeem by:</p>
                     <span>12/31/11</span>
                  </div>
                  <div id="expires" class="deal-date">
                     <p>Expires on:</p>
                     <span>12/31/12</span>
                  </div>
                  <div id="actions">
                     <a href="#" class="biglink nyi" id="view">View receipt</a>
                     <a href="#" class="biglink nyi" id="print">Print voucher</a>
                     <a href="#" class="biglink nyi" id="help">Need help?</a>
                  </div>
                  <div id="sharing">
                     <span>Share this Deal</span>
                     <div id="share-fb"><a href="#" class="nyi"><g:img dir="images" file="share-fb.png" /></a></div>
                     <div id="share-tweet"><a href="#" class="nyi"><g:img dir="images" file="share-tweet.png" /></a></div>
                     <a href="#" id="share-email" class="nyi">Email</a>
                  </div>
               </div>
               <div id="details">
                  <div id="location-box">
                     <p class="small" id="address">
                        <strong>2b4me</strong> 333 Aragon Ave. Coral Gables, FL 33134 <a href="#" class="nyi">Map It</a><br /><br />P: (305) 555-1212 <br /> F: (305) 555-1213
                     </p>
                  </div>
                  <div id="more-details">
                     <h3>More details</h3>
                     <p class="details-p">Morbi condimentum tincidunt metus, in euismod quam congue vitae. Duis euismod lectus vitae lectus lacinia fringilla. Nam sed massa ut dui pellentesque tristique a ut risus. Proin vulputate quam sed quam imperdiet a laoreet tortor pretium. Curabitur dui ante, condimentum ac consectetur nec, <a href="#" class="nyi">Some Link</a> consectetur non leo. </p>
                     <p class="details-p">Ut laoreet est vitae lacus imperdiet mollis fermentum nunc tempus.Nam fermentum sem vel eros ullamcorper iaculis. Maecenas facilisis gravida gravida. Quisque augue odio, suscipit in euismod a, faucibus eu orci.</p>
                     <h5 id="terms">Terms &amp; Conditions</h5>
                     <p class="terms-p small">Nulla lacus velit, scelerisque eu pharetra id, interdum vel massa. Duis suscipit, quam at auctor iaculis, mi justo dictum magna, at venenatis lacus nisi id dui. Nullam eu velit ac sapien porttitor placerat. </p>
                     <p class="terms-p small">In hac habitasse platea dictumst. Praesent porta, lorem ut tincidunt cursus, risus risus rutrum metus, vitae viverra tellus mi nec urna. Nulla facilisi. Nullam vel nisl a lorem pretium commodo non semper nulla. <a href="#" class="nyi">Other Conditions Apply</a> Paid value does not expire - promotional value expires December 14, 2012</p>
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
      <!--PAGE SCRIPT -->
      <g:external dir="js" file="jquery-1.7.2.js" />
      <g:external dir="js" file="custom-ui.js" />
      <g:external dir="js" file="custom-ui-ext.js" />
   </body>
</html>