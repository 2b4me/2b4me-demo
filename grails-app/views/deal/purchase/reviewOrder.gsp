<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Review Order</title>
      <g:external dir="css" file="stylesheet.css" />
      <g:external dir="css" file="stylesheet-ext.css" />
   </head>
   <body>
      <g:img dir="images" file="only-a-demo-1.png" id="only-a-demo-1" />
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
            <div id="content-main" class="nobg">
               <h2>Review Order</h2>
               <g:if test="${flash.message}">
                  <p>${flash.message}</p>
               </g:if>
               <g:form name="purchaseDeal" controller="deal" action="purchase" id="${deal.shortName}">
                  <g:submitButton name="cancel" value="Cancel" class="hidden" />
                  <g:submitButton name="back" value="Edit Payment Details" class="hidden" />
                  <g:submitButton name="continue" value="Confirm Order" class="hidden" />
                  <div id="purchase-deal-content">
                     <h3>You are almost there! Please review your order.</h3>
                     <div id="content-main">
                        <img src="https://s3.amazonaws.com/2b4me-deals/${deal.shortName}-related-deal-photo.jpg" id="main-photo" />
                        <div id="deal-info">
                           <h1>${deal.title}</h1>
                           <p id="deal-desc">${deal.teaser}</p>
                        </div>
                     </div>
                  </div>
                  <div id="purchase-deal-content-space">&nbsp;</div>
                  <div id="purchase-deal-content">
                     <div id="content-main">
                        <h3>Your payment information</h3>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">Name</label></div>
                           <div id="form-input"><span class="data">${pdc.name}</span></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">Address</label></div>
                           <div id="form-input"><span class="data">${pdc.address1}</span></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">&nbsp;</label></div>
                           <div id="form-input"><span class="data">${pdc.address2}</span></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">City</label></div>
                           <div id="form-input"><span class="data">${pdc.city}</span></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">State</label></div>
                           <div id="form-input" class="shorter"><span class="data">${pdc.state}</span></div>
                           <div id="form-label" class="longer"><label class="blue-label">Zip Code</label></div>
                           <div id="form-input"><span class="data">${pdc.zipCode}</span></div>
                        </div>
                        <div id="form-space">&nbsp;</div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">&nbsp;</label></div>
                           <div id="form-input"><g:img dir="images" file="cc-logos.jpg" id="main-photo" /></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">CC #</label></div>
                           <div id="form-input"><span class="data">${pdc.ccNum}</span></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">Exp (mm/yy)</label></div>
                           <div id="form-input" class="cc-input"><span class="data">${pdc.ccExp}</span></div>
                           <div id="form-label"><label class="blue-label">CVV2</label></div>
                           <div id="form-input" class="cc-input"><span class="data">${pdc.ccCvv}</span></div>
                        </div>
                        <div id="form-space">&nbsp;</div>
                     </div>
                  </div>
                  <div id="purchase-deal-content">
                     <p><span class="green-text">Please review the order above. By clicking Confirm Order, you are authorizing 2b4me to charge your credit card for $XX for the ${deal.shortName} deal.</span></p>
                     <a id="ro-cancel-link" href="${deal.shortName}/cancel" class="round-btn">Cancel</a>
                     <a id="ro-back-link" href="${deal.shortName}/edit-details" class="round-btn">Edit Payment Details</a>
                     <a id="ro-continue-link" href="${deal.shortName}/confirm" class="round-btn">Confirm Order</a>
                  </div>
               </g:form>
            </div>
            <!-- END MAIN CONTENT (the deal info.) -->
            <!-- START RELATED DEALS -->
            <div id="related">
               
            </div>
            <!-- END RELATED DEALS -->
         </div>
         <!--END CONTAINER-INNER-->
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
      <g:external dir="js" file="review-order.js" />
   </body>
</html>