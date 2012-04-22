<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <!-- InstanceBegin template="/Templates/2b4me-template.dwt" codeOutsideHTMLIsLocked="false" -->
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Browse Deals</title>
      <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
      <g:external dir="js" file="custom-ui.js" />
      <g:external dir="css" file="stylesheet.css" />
   </head>
   <body>
      <!--START HEADER-->
      <div id="header">
         <g:include controller="featured" action="header" />
      </div>
      <!-- END HEADER -->
      <!-- START CONTAINER-->
      <div class="container" id="browse">
         <!-- InstanceBeginEditable name="container-inner" -->
         <!--START CONTAINER-INNER-->
         <div id="container-inner">
            <!--do not remove this div-->
            <!-- START BROWSE HEAD -->
            <div id="browse-head">
               <h1>Browse Deals</h1>
               <small class="green-text" id="label-category">Category</small>
               <h2 id="category">Entertainment</h2>
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
               <li class="first"><a href="#">Dining</a></li>
               <li><a href="#">Retail</a></li>
               <li><a href="#">Clothing</a></li>
               <li><a href="#">Salon</a></li>
               <li><a href="#">Fitness</a></li>
               <li><a href="#">Nightlife</a></li>
               <li class="selected"><a href="#">Entertainment</a></li>
               <li class="last"><a href="#">All Deals</a></li>
            </ul>
            <!-- END CATEGORY LIST -->
            <!-- START RESTULT BLOCKS -->
            <div id="results-block">
               <div class="deal-blocks left-block" id="first-deal">
                  <!--the first deal of the result must have this ID-->
                  <r:img uri="/images/browse-photo1.jpg" alt="" class="deal-img" />
                  <h4 class="deal-name"><a href="#">Full Body Massage</a></h4>
                  <p class="small">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a risus elit, ut sodales elit. dolor sit amet, consectetur adipiscing elit dull phils non duet men. <a href="#">Read More</a></p>
                  <div class="deal-price">
                     <span class="nowonly">Now Only</span>
                     <span class="actual-price">$30</span>
                  </div>
                  <span class="prev-price">$69</span>
                  <a href="#" class="green-btn buynow">Buy Now</a>
               </div>
               <div class="deal-blocks" id="second-deal">
                  <!--the second deal of the result must have this ID-->
                  <r:img uri="/images/browse-photo2.jpg" alt="" class="deal-img" />
                  <h4 class="deal-name"><a href="#">2 for 1 Dining on Tuesdays</a></h4>
                  <p class="small">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a risus elit, ut sodales elit. dolor sit amet, consectetur adipiscing elit dull phils non duet men. <a href="#">Read More</a></p>
                  <div class="deal-price">
                     <span class="nowonly">Now Only</span>
                     <span class="actual-price">$10</span>
                  </div>
                  <span class="prev-price">$16</span>
                  <a href="#" class="green-btn buynow">Buy Now</a>
               </div>
               <div class="deal-blocks left-block">
                  <!--each first block must have the left-block class-->
                  <r:img uri="/images/browse-photo3.jpg" alt="" class="deal-img" />
                  <h4 class="deal-name"><a href="#">Exotic Vacation Destinations</a></h4>
                  <p class="small">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a risus elit, ut sodales elit. dolor sit amet, consectetur adipiscing elit dull phils non duet men. <a href="#">Read More</a></p>
                  <div class="deal-price">
                     <span class="nowonly">Now Only</span>
                     <span class="actual-price">$399</span>
                  </div>
                  <span class="prev-price">$699</span>
                  <a href="#" class="green-btn buynow">Buy Now</a>
               </div>
               <div class="deal-blocks">
                  <r:img uri="/images/browse-photo4.jpg" alt="" class="deal-img" />
                  <h4 class="deal-name"><a href="#">Cocktails Specials</a></h4>
                  <p class="small">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a risus elit, ut sodales elit. dolor sit amet, consectetur adipiscing elit dull phils non duet men. <a href="#">Read More</a></p>
                  <div class="deal-price">
                     <span class="nowonly">Now Only</span>
                     <span class="actual-price">$4</span>
                  </div>
                  <span class="prev-price">$8</span>
                  <a href="#" class="green-btn buynow">Buy Now</a>
               </div>
               <!----------------------------- HERE GOES THE LOAD BUTTON ---------------------------------->
               <div id="load-btn-box">
                  <button href="#" class="round-btn v2" id="load-btn">Load More<span></span></button>
               </div>
            </div>
            <!-- END RESULT BLOCKS -->                
         </div>
         <!--START CONTAINER-INNER-->
         <!-- InstanceEndEditable -->
         <!--START FOOTER-->
         <div id="footer">
            <g:include controller="featured" action="footer" />
         </div>
         <!--END FOOTER-->
      </div>
      <!-- END CONTAINER -->
      <div id="shadow-bottom">
         <!--required--> 
      </div>
   </body>
   <!-- InstanceEnd -->
</html>