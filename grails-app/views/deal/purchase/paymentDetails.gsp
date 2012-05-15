<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Enter Payment Details</title>
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
            <div id="content-main" class="nobg">
               <h2>Payment details</h2>
               <g:form name="purchaseDeal" controller="deal" action="purchase" id="${deal.shortName}">
                  <g:submitButton name="continue" value="Continue" class="hidden" />
                  <g:submitButton name="cancel" value="Cancel" class="hidden" />
                  <div id="purchase-deal-content">
                     <h3>You are buying</h3>
                     <div id="content-main">
                        <r:img uri="/images/deals/${deal.shortName}-related-deal-photo.jpg" id="main-photo" />
                        <div id="deal-info">
                           <h1>${deal.title}</h1>
                           <p id="deal-desc">${deal.teaser}</p>
                        </div>
                     </div>
                  </div>
                  <div id="purchase-deal-content-space">&nbsp;</div>
                  <div id="purchase-deal-content">
                     <div id="content-main">
                        <h3>Please enter your payment information</h3>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">Name</label></div>
                           <div id="form-input"><input name="name" type="text" value="${pdc?.name}" class="text-input" /></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">Address</label></div>
                           <div id="form-input"><input name="address1" type="text" value="${pdc?.address1}" class="text-input" /></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">&nbsp;</label></div>
                           <div id="form-input"><input name="address2" type="text" value="${pdc?.address2}" class="text-input" /></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">City</label></div>
                           <div id="form-input"><input name="city" type="text" value="${pdc?.city}" class="text-input" /></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">State</label></div>
                           <div id="form-input">
                              <g:select name="state" from="${states}" value="${pdc?.state}" noSelection="['':'Select one']" class="select-box" />
                              <%--
                              <select name="state" class="select-box">
                                 <option value="">Select one</option>
                                 <option value="FL">FL</option>
                                 <option value="CA">CA</option>
                                 <option value="DC">DC</option>
                                 <option value="NY">NY</option>
                              </select>
                               --%>
                           </div>
                           <div id="form-label"><label class="blue-label">Zip Code</label></div>
                           <div id="form-input"><input name="zipCode" type="text" value="${pdc?.zipCode}" class="text-input zipCode" /></div>
                        </div>
                        <div id="form-space">&nbsp;</div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">&nbsp;</label></div>
                           <div id="form-input"><r:img uri="/images/cc-logos.jpg" id="main-photo" /></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">CC #</label></div>
                           <div id="form-input"><input name="ccNum" type="text" value="${pdc?.ccNum}" class="text-input cc" /></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">Exp (mm/yy)</label></div>
                           <div id="form-input" class="cc-input"><input name="ccExp" type="text" value="${pdc?.ccExp}" class="text-input ccExp" /></div>
                           <div id="form-label"><label class="blue-label">CVV2</label></div>
                           <div id="form-input" class="cc-input"><input name="ccCvv" type="text" value="${pdc?.ccCvv}" class="text-input ccCvv" /></div>
                        </div>
                        <div id="form-space">&nbsp;</div>
                     </div>
                  </div>
                  <div id="purchase-deal-content">
                     <p><span class="green-text">You will have a chance to review your order details before you are charged.</span></p>
                     <a id="pd-cancel-link" href="${deal.shortName}/cancel" class="round-btn">Cancel</a>
                     <a id="pd-continue-link" href="${deal.shortName}/continue" class="round-btn">Continue</a>
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
      <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
      <g:external dir="js" file="custom-ui.js" />
      <g:external dir="js" file="payment-details.js" />
   </body>
</html>