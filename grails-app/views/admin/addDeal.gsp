<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin - Add a Deal</title>
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
               <form class="form-horizontal">
                  <fieldset>
                     <legend>Add a Deal</legend>
                     <div class="control-group">
                        <label class="control-label" for="input01">Short Name</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="input01">
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
                        <button type="submit" class="btn btn-primary">Save</button>
                     </div>
                  </fieldset>
               </form>
            </div>
            <div class="span1">&nbsp;</div>
         </div>
      </div>
   </body>
   <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
   <g:external dir="js" file="bootstrap.js" />
   <g:external dir="js" file="bootstrap-ext.js" />
</html>