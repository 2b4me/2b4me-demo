<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Enter Payment Details</title>
      <g:external dir="css" file="stylesheet.css" />
      <g:external dir="css" file="stylesheet-ext.css" />
   </head>
   <body>
      <r:img uri="/static/images/only-a-demo-1.png" id="only-a-demo-1" />
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
               <g:form name="purchaseDeal" controller="deal" action="purchase" id="${deal.shortName}">
                  <g:submitButton name="continue" value="Continue" class="hidden" />
                  <g:submitButton name="cancel" value="Cancel" class="hidden" />
                  <div id="purchase-deal-content">
                     <h3>You are buying</h3>
                     <div id="content-main">
                        <r:img uri="/static/images/deals/${deal.shortName}-related-deal-photo.jpg" id="main-photo" />
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
                           <div id="form-input"><input name="name" type="text" value="${pdc?.name}" class="text-input ${hasErrors(bean:pdc,field:'name','input-error')}" /></div>
                           <div id="form-input-error" class="name"><g:renderErrors bean="${pdc}" field="name"/></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">Address</label></div>
                           <div id="form-input"><input name="address1" type="text" value="${pdc?.address1}" class="text-input ${hasErrors(bean:pdc,field:'address1','input-error')}" /></div>
                           <div id="form-input-error" class="address1"><g:renderErrors bean="${pdc}" field="address1"/></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">&nbsp;</label></div>
                           <div id="form-input"><input name="address2" type="text" value="${pdc?.address2}" class="text-input ${hasErrors(bean:pdc,field:'address1','input-error')}" /></div>
                           <div id="form-input-error" class="address1"><g:renderErrors bean="${pdc}" field="address1"/></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">City</label></div>
                           <div id="form-input"><input name="city" type="text" value="${pdc?.city}" class="text-input ${hasErrors(bean:pdc,field:'city','input-error')}" /></div>
                           <div id="form-input-error" class="city"><g:renderErrors bean="${pdc}" field="city"/></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">State</label></div>
                           <div id="form-input">
                              <g:select name="state" from="${states}" value="${pdc?.state}" noSelection="['':'Select one']" class="select-box ${hasErrors(bean:pdc,field:'state','input-error')}" />
                           </div>
                           <div id="form-label"><label class="blue-label">Zip Code</label></div>
                           <div id="form-input"><input name="zipCode" type="text" value="${pdc?.zipCode}" class="text-input zipCode ${hasErrors(bean:pdc,field:'zipCode','input-error')}" /></div>
                           <div id="form-input-error" class="state"><g:renderErrors bean="${pdc}" field="state"/><g:renderErrors bean="${pdc}" field="zipCode"/></div>
                        </div>
                        <div id="form-space">&nbsp;</div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">&nbsp;</label></div>
                           <div id="form-input"><r:img uri="/static/images/cc-logos.jpg" id="main-photo" /></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">CC #</label></div>
                           <!--
                           <div id="form-input"><input name="ccNum" type="text" value="${pdc?.ccNum}" class="text-input cc ${hasErrors(bean:pdc,field:'ccNum','input-error')}" /></div>
                            -->
                           <div id="form-input"><input name="ccNum" type="text" value="4111111111111111" class="text-input cc ${hasErrors(bean:pdc,field:'ccNum','input-error')}" /></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">Exp (mm/yy)</label></div>
                           <!--
                           <div id="form-input" class="cc-input"><input name="ccExp" type="text" value="${pdc?.ccExp}" class="text-input ccExp ${hasErrors(bean:pdc,field:'ccExp','input-error')}" /></div>
                            -->
                           <div id="form-input" class="cc-input"><input name="ccExp" type="text" value="12/15" class="text-input ccExp ${hasErrors(bean:pdc,field:'ccExp','input-error')}" /></div>
                           <div id="form-label"><label class="blue-label">CVV2</label></div>
                           <!--
                           <div id="form-input" class="cc-input"><input name="ccCvv" type="text" value="${pdc?.ccCvv}" class="text-input ccCvv ${hasErrors(bean:pdc,field:'ccCvv','input-error')}" /></div>
                            -->
                           <div id="form-input" class="cc-input"><input name="ccCvv" type="text" value="333" class="text-input ccCvv ${hasErrors(bean:pdc,field:'ccCvv','input-error')}" /></div>
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
      <g:external dir="js" file="jquery-1.7.2.js" />
      <g:external dir="js" file="custom-ui.js" />
      <g:external dir="js" file="custom-ui-ext.js" />
      <g:external dir="js" file="payment-details.js" />
   </body>
</html>