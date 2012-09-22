<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin - Add a Deal</title>
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
               <g:if test="${!errors.isEmpty()}">
                  <div class="alert alert-error">
                     <g:each in="${errors}" var="errorMessage">
                     ${errorMessage}<br />
                     </g:each>
                  </div>
               </g:if>
               <g:uploadForm class="form-horizontal" action="addDeal" method="post">
                  <fieldset>
                     <legend>Add a Deal</legend>
                     
                     <input type="hidden" name="formSubmitted" value="true" />
                     
                     <div class="control-group">
                        <label class="control-label" for="vendorId">Vendor</label>
                        <div class="controls">
                           <select name="vendorId" id="vendorId" class="input-medium">
                              <option value="">--</option>
                              <g:each in="${vendors}">
                                 <g:if test="${it.id.toString() == data.vendorId}">
                                    <option value="${it.id}" selected="true">${it.name}</option>
                                 </g:if>
                                 <g:else>
                                    <option value="${it.id}">${it.name}</option>
                                 </g:else>
                              </g:each>
                           </select>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="categoryId">Category</label>
                        <div class="controls">
                           <select name="categoryId" id="categoryId" class="input-medium">
                              <option value="">--</option>
                              <g:each in="${categories}">
                                 <g:if test="${it.id.toString() == data.categoryId}">
                                    <option value="${it.id}" selected="true">${it.name}</option>
                                 </g:if>
                                 <g:else>
                                    <option value="${it.id}">${it.name}</option>
                                 </g:else>
                              </g:each>
                           </select>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="shortName">Short Name</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge short-width" id="shortName" name="shortName" value="${data.shortName}" />
                           <p class="help-block">Deal short name, to uniquely identify it and to build the related URLs.</p>
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label" for="title">Title</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="title" name="title" value="${data.title}" />
                           <p class="help-block">The title of the deal.</p>
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label" for="teaser">Teaser</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="teaser" name="teaser" value="${data.teaser}" />
                           <p class="help-block">The teaser for the deal.</p>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="hoverTitle">Hover Title</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="hoverTitle" name="hoverTitle" value="${data.hoverTitle}" />
                           <p class="help-block">The title of the deal when text is rendered hovered over a related illustration.</p>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="hoverTeaser">Hover Teaser</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="hoverTeaser" name="hoverTeaser" value="${data.hoverTeaser}" />
                           <p class="help-block">The teaser of the deal when text is rendered hovered over a related illustration.</p>
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label" for="fullDescription">Full Description</label>
                        <div class="controls">
                           <textarea style="resize: none; width: 400px;" id="fullDescription" name="fullDescription" rows="5">${data.fullDescription}</textarea>
                           <p class="help-block">The full description of the deal, printed on the deal detail page.</p>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="originalPrice">Original Value</label>
                        <div class="controls">
                           <div class="input-prepend">
                              <span class="add-on">$</span><input type="text" class="input-xlarge medium-width" id="originalPrice" name="originalPrice" value="${data.originalPrice}" />
                           </div>
                           <p class="help-block">The original value of the deal. Use XXX.XX format.</p>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="price">Deal Sale Price</label>
                        <div class="controls">
                           <div class="input-prepend">
                              <span class="add-on">$</span><input type="text" class="input-xlarge medium-width" id="price" name="price" value="${data.price}" />
                           </div>
                           <p class="help-block">The sale price of the deal. Use XXX.XX format.</p>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="effectiveDate">Deal Start Date</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge medium-width" id="effectiveDate" name="effectiveDate" value="${data.effectiveDate}" />
                           <p class="help-block">The deal effective date. Use MM/DD/YYYY format.</p>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="expirationDate">Deal End Date</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge medium-width" id="expirationDate" name="expirationDate" value="${data.expirationDate}" />
                           <p class="help-block">The deal expiration date. Use MM/DD/YYYY format.</p>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="detailPhoto"></label>
                        <div class="controls">
                           <input type="file" class="" id="detailPhoto" name="detailPhoto" /> 
                           <p class="help-block">This is the photo used on the detail page. Must be a jpg (*.jpg) file.</p>
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label" for="sliderMainPhoto"></label>
                        <div class="controls">
                           <input type="file" class="" id="sliderMainPhoto" name="sliderMainPhoto" /> 
                           <p class="help-block">This is the photo used on the home page if it's a featured deal. Must be a jpg (*.jpg) file.</p>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="sliderPhoto"></label>
                        <div class="controls">
                           <input type="file" class="" id="sliderPhoto" name="sliderPhoto" /> 
                           <p class="help-block">This is the preview photo used on the home page if it's a featured deal. Must be a jpg (*.jpg) file.</p>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="browseDealsPhoto"></label>
                        <div class="controls">
                           <input type="file" class="" id="browseDealsPhoto" name="browseDealsPhoto" /> 
                           <p class="help-block">This is the photo used on the browse deals page. Must be a jpg (*.jpg) file.</p>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="relatedDealPhoto"></label>
                        <div class="controls">
                           <input type="file" class="" id="relatedDealPhoto" name="relatedDealPhoto" /> 
                           <p class="help-block">This is the photo used on the related deals section. Must be a jpg (*.jpg) file.</p>
                        </div>
                     </div>
                     
                     <div class="form-actions">
                        <button type="submit" class="btn btn-primary">Continue</button>
                     </div>
                  </fieldset>
               </g:uploadForm>
            </div>
            <div class="span1">&nbsp;</div>
         </div>
      </div>
   </body>
   <g:external dir="js" file="jquery-1.7.2.js" />
   <g:external dir="js" file="bootstrap.js" />
   <g:external dir="js" file="bootstrap-ext.js" />
</html>