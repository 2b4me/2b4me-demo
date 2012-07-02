<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin - Add a Deal (Vendor)</title>
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
                     <legend>Add a Deal - Review</legend>
                     
                     <div class="form-actions">
                        <a id="detailsBtn" href="edit-details" class="btn">Edit Details</a>
                        <g:submitButton name="details" value="details" class="hidden" />
                        <a id="imagesBtn" href="edit-images" class="btn">Edit Images</a>
                        <g:submitButton name="images" value="images" class="hidden" />
                        <a id="backBtn" href="edit-vendor" class="btn">Edit Vendor</a>
                        <g:submitButton name="back" value="back" class="hidden" />
                        <a id="continueBtn" href="add-deal" class="btn btn-primary">Add Deal</a>
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