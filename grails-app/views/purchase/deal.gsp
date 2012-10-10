<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Payment Details</title>
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
               <g:if test="${flash.message}">
                  <p>${flash.message}</p>
               </g:if>
               <g:form name="purchaseDeal" controller="purchase" action="deal" id="${deal.shortName}">
                  <g:submitButton name="continue" value="Continue" class="hidden" />
                  <div id="purchase-deal-content">
                     <h3>You are buying</h3>
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
                        <h3>Please enter your payment information</h3>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">Name</label></div>
                           <div id="form-input"><input name="name" type="text" value="${data.name}" class="text-input" /></div>
                           <div id="form-input-error" class="name">${errors.name}</div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">Address</label></div>
                           <div id="form-input"><input name="address1" type="text" value="${data.address1}" class="text-input" /></div>
                           <div id="form-input-error" class="address1">${errors.address1}</div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">&nbsp;</label></div>
                           <div id="form-input"><input name="address2" type="text" value="${data.address2}" class="text-input" /></div>
                           <div id="form-input-error" class="address1">${errors.address2}</div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">City</label></div>
                           <div id="form-input"><input name="city" type="text" value="${data.city}" class="text-input" /></div>
                           <div id="form-input-error" class="city">${errors.city}</div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">State</label></div>
                           <div id="form-input">
                              <select name="state" class="">
                                 <option value="">--</option>
                                 <g:each in="${states}">
                                    <g:if test="${it.key == data.state}">
                                       <option value="${it.key}" selected="true">${it.key}</option>
                                    </g:if>
                                    <g:else>
                                       <option value="${it.key}">${it.key}</option>
                                    </g:else>
                                 </g:each>
                              </select>
                           </div>
                           <div id="form-label"><label class="blue-label">Zip Code</label></div>
                           <div id="form-input"><input name="zipCode" type="text" value="${data.zipCode}" class="text-input zipCode" /></div>
                           <div id="form-input-error" class="state">${errors.state} ${errors.zipCode}</div>
                        </div>
                        <div id="form-space">&nbsp;</div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">&nbsp;</label></div>
                           <div id="form-input"><g:img dir="images" file="cc-logos.jpg" id="main-photo" /></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">CC #</label></div>
                           <div id="form-input"><input name="ccNum" type="text" value="${data.ccNum}" class="text-input cc" /></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">Exp (mm/yy)</label></div>
                           <div id="form-input" class="cc-input"><input name="ccExp" type="text" value="${data.ccExp}" class="text-input ccExp" /></div>
                           <div id="form-label"><label class="blue-label">CVV2</label></div>
                           <div id="form-input" class="cc-input"><input name="ccCvv" type="text" value="${data.ccCvv}" class="text-input ccCvv" /></div>
                        </div>
                        <div id="form-space">&nbsp;</div>
                     </div>
                  </div>
                  <div id="purchase-deal-content">
                     <p><span class="green-text">You will have a chance to review your order details before you are charged.</span></p>
                     <g:link controller="deal" action="index" id="${deal.shortName}" class="round-btn">Cancel</g:link>
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
      <g:external dir="js" file="jquery-1.7.2.js" />
      <g:external dir="js" file="custom-ui.js" />
      <g:external dir="js" file="custom-ui-ext.js" />
      <g:external dir="js" file="payment-details.js" />
   </body>
</html>