<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin - Add a Deal (Images)</title>
      <g:external dir="css" file="bootstrap.css" />
      <g:external dir="css" file="boostrap-ext.css" />
   </head>
   <body>
      <div class="container-2">
         <g:include action="topMenu" />
         <div class="row second-row">
            <div class="span2 sidebar">
               <g:include action="sidebarMenu" />
            </div>
            <div class="span9">
               <g:form class="form-horizontal">
                  <fieldset>
                     <legend>Add a Deal - Images</legend>
                     <div class="control-group">
                        <label class="control-label" for="input01">Browse Deals Image</label>
                        <div class="controls">
                           <input type="file" class="input-xlarge" id="input01">
                           <p class="help-block">This image is used in Browse Deals page. Should be 288 w × 136 h.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Deal Details Image</label>
                        <div class="controls">
                           <input type="file" class="input-xlarge" id="input01">
                           <p class="help-block">This image is used in the mail Deal detail page. Should be 452 w × 289 h.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Related Deals Image</label>
                        <div class="controls">
                           <input type="file" class="input-xlarge" id="input01">
                           <p class="help-block">This image is used in related deal areas of the site. Should be 259 w × 136 h.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Featured Deals Main Image</label>
                        <div class="controls">
                           <input type="file" class="input-xlarge" id="input01">
                           <p class="help-block">This image is used in the Featured Deals page. Should be 602 w × 289 h.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Featured Deals Preview Image</label>
                        <div class="controls">
                           <input type="file" class="input-xlarge" id="input01">
                           <p class="help-block">This image is used in the Featured Deals page. Should be 296 w × 144 h.</p>
                        </div>
                     </div>
                     <div class="form-actions">
                        <a id="backBtn" href="back" class="btn">Back</a>
                        <g:submitButton name="back" value="back" class="hidden" />
                        <a id="continueBtn" href="continue" class="btn btn-primary">Continue</a>
                        <g:submitButton name="continue" value="continue" class="hidden" />
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