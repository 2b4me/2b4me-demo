<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Browse Deals</title>
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
      <div class="container" id="browse">
         <!--START CONTAINER-INNER-->
         <div id="container-inner">
            <!--do not remove this div-->
            <!-- START BROWSE HEAD -->
            <div id="browse-head">
               <h1>Browse Deals</h1>
               <g:if test="${selectedCategoryTitle != 'All Deals'}">
                  <small class="green-text" id="label-category">Category</small>
               </g:if>
               <g:else>
                  <small class="green-text" id="label-category">&nbsp;</small>
               </g:else>
               <h2 id="category">${selectedCategoryTitle}</h2>
               <small class="green-text" id="label-sort"><label for="sort">Sort by</label></small>
               <select name="sort" class="select-box" id="sort">
                  <option value="">Popularity</option>
                  <option value="">voted</option>
               </select>
            </div>
            <!-- END BROWSE HEAD -->
            <!-- START SEARCH BOX -->
            <div id="search-box">
               <form action="#" id="search-box-form">
                  <input type="text" name="search" value="Search Deals..." class="text-input" id="search-box-input" />
                  <button type="submit" class="green-btn" id="search-box-btn">search </button>
               </form>
            </div>
            <!-- END SEARCH BOX -->
            <!-- START CATEGORY LIST -->
            <ul id="category-list">
               <g:if test="${selectedCategory == 0}">
                  <li class="first selected"><g:link controller="browse">All Deals</g:link></li>
               </g:if>
               <g:else>
                  <li class="first"><g:link controller="browse">All Deals</g:link></li>
               </g:else>
               <g:each var="cat" in="${categories}" status="i">
                  <g:if test="${i == (categories.size - 1)}">
                     <g:if test="${selectedCategory.toLong() == cat.id}">
                        <li class="last selected"><g:link controller="browse" params="[cat: cat.id]">${cat.name}</g:link></li>
                     </g:if>
                     <g:else>
                        <li class="last"><g:link controller="browse" params="[cat: cat.id]">${cat.name}</g:link></li>
                     </g:else>
                  </g:if>
                  <g:else>
                     <g:if test="${selectedCategory.toLong() == cat.id}">
                        <li class="selected"><g:link controller="browse" params="[cat: cat.id]">${cat.name}</g:link></li>
                     </g:if>
                     <g:else>
                        <li><g:link controller="browse" params="[cat: cat.id]">${cat.name}</g:link></li>
                     </g:else>
                  </g:else>
               </g:each>
            </ul>
            <!-- END CATEGORY LIST -->
            <!-- START RESTULT BLOCKS -->
            <div id="results-block">
               <g:if test="${deals.empty}">
                  <h3>There are no ${selectedCategoryTitle} deals at this time, but check back soon!</h3>
               </g:if>
               <g:each var="deal" in="${deals}" status="i">
                  <g:if test="${i == 0}">
                     <div class="deal-blocks left-block" id="first-deal">
                        <!--the first deal of the result must have this ID-->
                        <img src="https://s3.amazonaws.com/2b4me-deals/${deal.shortName}-browse-photo.jpg" class="deal-img" />
                        <h4 class="deal-name"><g:link controller="deal" id="${deal.shortName}">${deal.title}</g:link></h4>
                        <p class="small">${deal.hoverTeaser} <g:link controller="deal" id="${deal.shortName}">Read More</g:link></p>
                        <div class="deal-price">
                           <span class="nowonly">Now Only</span>
                           <span class="actual-price"><g:formatNumber number="${deal.price}" format="\$###,##0" /></span>
                        </div>
                        <span class="prev-price"><g:formatNumber number="${deal.originalPrice}" format="\$###,##0" /></span>
                        <g:link controller="deal" id="${deal.shortName}" class="green-btn buynow">Buy Now</g:link>
                     </div>
                  </g:if>
                  <g:elseif test="${i == 1}">
                     <div class="deal-blocks" id="second-deal">
                        <!--the second deal of the result must have this ID-->
                        <img src="https://s3.amazonaws.com/2b4me-deals/${deal.shortName}-browse-photo.jpg" class="deal-img" />
                        <h4 class="deal-name"><g:link controller="deal" id="${deal.shortName}">${deal.title}</g:link></h4>
                        <p class="small">${deal.hoverTeaser} <g:link controller="deal" id="${deal.shortName}">Read More</g:link></p>
                        <div class="deal-price">
                           <span class="nowonly">Now Only</span>
                           <span class="actual-price"><g:formatNumber number="${deal.price}" format="\$###,##0" /></span>
                        </div>
                        <span class="prev-price"><g:formatNumber number="${deal.originalPrice}" format="\$###,##0" /></span>
                        <g:link controller="deal" id="${deal.shortName}" class="green-btn buynow">Buy Now</g:link>
                     </div>
                  </g:elseif>
                  <g:elseif test="${i % 2 != 0}">
                     <div class="deal-blocks left-block">
                        <!--each first block must have the left-block class-->
                        <img src="https://s3.amazonaws.com/2b4me-deals/${deal.shortName}-browse-photo.jpg" class="deal-img" />
                        <h4 class="deal-name"><g:link controller="deal" id="${deal.shortName}">${deal.title}</g:link></h4>
                        <p class="small">${deal.hoverTeaser} <g:link controller="deal" id="${deal.shortName}">Read More</g:link></p>
                        <div class="deal-price">
                           <span class="nowonly">Now Only</span>
                           <span class="actual-price"><g:formatNumber number="${deal.price}" format="\$###,##0" /></span>
                        </div>
                        <span class="prev-price"><g:formatNumber number="${deal.originalPrice}" format="\$###,##0" /></span>
                        <g:link controller="deal" id="${deal.shortName}" class="green-btn buynow">Buy Now</g:link>
                     </div>
                  </g:elseif>
                  <g:else>
                     <div class="deal-blocks">
                        <img src="https://s3.amazonaws.com/2b4me-deals/${deal.shortName}-browse-photo.jpg" class="deal-img" />
                        <h4 class="deal-name"><g:link controller="deal" id="${deal.shortName}">${deal.title}</g:link></h4>
                        <p class="small">${deal.hoverTeaser} <g:link controller="deal" id="${deal.shortName}">Read More</g:link></p>
                        <div class="deal-price">
                           <span class="nowonly">Now Only</span>
                           <span class="actual-price"><g:formatNumber number="${deal.price}" format="\$###,##0" /></span>
                        </div>
                        <span class="prev-price"><g:formatNumber number="${deal.originalPrice}" format="\$###,##0" /></span>
                        <g:link controller="deal" id="${deal.shortName}" class="green-btn buynow">Buy Now</g:link>
                     </div>
                  </g:else>
               </g:each>
               <g:if test="${deals.size() == 4}">
                  <div id="load-btn-box">
                     <button href="#" class="round-btn v2 nyi" id="load-btn">Load More<span></span></button>
                  </div>
               </g:if>
            </div>
            <!-- END RESULT BLOCKS -->                
         </div>
         <!--START CONTAINER-INNER-->
         <!-- InstanceEndEditable -->
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
      <!-- START LOGIN FORM -->
      <g:include controller="user" action="loginForm" />
      <!-- END LOGIN FORM -->
      <!--PAGE SCRIPT -->
      <g:external dir="js" file="jquery-1.7.2.js" />
      <g:external dir="js" file="custom-ui.js" />
      <g:external dir="js" file="custom-ui-ext.js" />
   </body>
</html>