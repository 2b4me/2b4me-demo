<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin - Add a Vendor</title>
      <g:external dir="css" file="bootstrap.css" />
      <g:external dir="css" file="bootstrap-ext.css" />
   </head>
   <body>
      <div class="container-2">
         <g:include action="topMenu" />
         <div class="row second-row">
            <div class="span2 sidebar">
               <g:include action="sidebarMenu" />
            </div>
            <div class="span9">
               <g:if test="${error}">
                  <div class="alert alert-error">${error}</div>
               </g:if>
               <g:form class="form-horizontal" action="addVendor" method="post">
                  <fieldset>
                     <legend>Add a Vendor</legend>
                     <input type="hidden" name="formSubmitted" value="true" />
                     <div class="control-group">
                        <label class="control-label" for="vendorCode">Code</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="vendorCode" name="vendorCode" value="${data.vendorCode}" />
                           <p class="help-block">Vendor code, to uniquely identify it.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="vendorName">Name</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="vendorName" name="vendorName" value="${data.vendorName}" />
                           <p class="help-block">Name of the merchant.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="vendorAddress1">Address</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="vendorAddress1" name="vendorAddress1" value="${data.vendorAddress1}" />
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="vendorAddress2">&nbsp;</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="vendorAddress2" name="vendorAddress2" value="${data.vendorAddress2}" />
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="vendorCity">City</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="vendorCity" name="vendorCity" value="${data.vendorCity}" />
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="vendorState">State</label>
                        <div class="controls">
                           <select name="vendorState" id="vendorState" class="input-medium">
                              <option value="">--</option>
                              <g:each in="${states}">
                                 <g:if test="${it.key == data.vendorState}">
                                    <option value="${it.key}" selected="true">${it.value}</option>
                                 </g:if>
                                 <g:else>
                                    <option value="${it.key}">${it.value}</option>
                                 </g:else>
                              </g:each>
                           </select>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="vendorZipCode">Zip Code</label>
                        <div class="controls">
                           <input type="text" class="input-small" id="vendorZipCode" name="vendorZipCode" value="${data.vendorZipCode}" />
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="vendorState">Country</label>
                        <div class="controls">
                           <select name="vendorCountry" id="vendorCountry" class="input-medium">
                              <option value="">--</option>
                              <g:each in="${countries}">
                                 <g:if test="${it.key == data.vendorCountry}">
                                    <option value="${it.key}" selected="true">${it.value}</option>
                                 </g:if>
                                 <g:else>
                                    <option value="${it.key}">${it.value}</option>
                                 </g:else>
                              </g:each>
                           </select>
                        </div>
                     </div>
                     <div class="form-actions">
                        <button type="submit" class="btn btn-primary">Save</button>
                     </div>
                  </fieldset>
               </g:form>
            </div>
            <div class="span1">&nbsp;</div>
         </div>
      </div>
   </body>
   <g:external dir="js" file="jquery-1.7.2.js" />
   <g:external dir="js" file="bootstrap.js" />
   <g:external dir="js" file="bootstrap-ext.js" />
</html>