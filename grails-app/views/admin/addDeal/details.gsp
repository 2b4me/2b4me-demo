<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin - Add a Deal (Details)</title>
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
                     <legend>Add a Deal - Details</legend>
                     <div class="control-group">
                        <label class="control-label" for="input01">Short Name</label>
                        <div class="controls">
                           <input name="shortName" type="text" class="input-xlarge" id="shortNameInput" value="${comm?.shortName}" />
                           <p class="help-block">Short name is used in the URL of the deal (e.g., http://2b4me.com/deal/short-name).</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Category</label>
                        <div class="controls">
                           <select id="select01">
                              <g:each in="${categories}">
                                 <option>${it.name}</option>
                              </g:each>
                           </select>
                           <p class="help-block">Deal category.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Hover Title</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="input01">
                           <p class="help-block">Title used in the front page for the deal.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Hover Teaser</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="input01">
                           <p class="help-block">Title used in the front page for the deal.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Title</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="input01">
                           <p class="help-block">Title used in the deal detail page.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Teaser</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="input01">
                           <p class="help-block">Title used in the deal detail page.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Effective Date</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="input01">
                           <p class="help-block">The date the deal begins.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Expiration Date</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="input01">
                           <p class="help-block">The date the deal ends.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Original Price</label>
                        <div class="controls">
                           <div class="input-prepend">
                              <span class="add-on">$</span>
                              <input type="text" class="input-xlarge" id="input01">
                              <p class="help-block">Deal's original price. Should be </p>
                           </div>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01"><strong>Deal Price</strong></label>
                        <div class="controls">
                           <div class="input-prepend">
                              <span class="add-on">$</span>
                              <input type="text" class="input-xlarge" id="input01">
                              <p class="help-block">Deal sale price.</p>
                           </div>
                        </div>
                     </div>
                     <div class="form-actions">
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
   <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
   <g:external dir="js" file="bootstrap.js" />
   <g:external dir="js" file="bootstrap-ext.js" />
</html>