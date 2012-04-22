<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Home</title>
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
      <div class="container" id="home">
         <!-- InstanceBeginEditable name="container-inner" -->
         <!-- START SLIDER -->
         <div id="slider">
            <div id="slider-inner">
               <div id="slider-main">
                  <r:img uri="${deal.largeImage}" />
                  <div id="slider-desc">
                     <h4>${deal.hoverTitle}</h4>
                     <p class="small">${deal.hoverTeaser}</p>
                  </div>
               </div>
               <div id="slider-info">
                  <h4>${deal.title}</h4>
                  <p class="small">${deal.teaser} <a href="#">Read More</a>
                  </p>
                  <span class="nowonly">Now Only</span>
                  <div id="deal-price">
                     <span class="prev-price">
                        <g:formatNumber number="${deal.originalPrice}" format="\$###,##0" />
                     </span>
                     <span class="actual-price">
                        <g:formatNumber number="${deal.price}" format="\$###,##0" />
                     </span>
                  </div>
                  <a href="#" class="green-btn lvl2" id="view-deal-btn">view deal</a>
               </div>
               <div id="slider-reel">
                  <g:each var="featuredDeal" in="${featuredDeals}" status="i">
                     <g:if test="${i != dealIndex}">
                        <div id="slider-image${sliderIndex++}" class="reel-img">
                           <a href="#">
                              <r:img uri="${featuredDeal.deal.smallImage}" border="0" />
                           </a>
                        </div>
                     </g:if>
                  </g:each>
               </div>
            </div>
            <div id="slider-bottom-corners">
               <!--Required-->
            </div>
         </div>
         <!-- END SLIDER -->
         <!--START BOTTOM-->
         <div id="bottom">
            <div id="bottom-inner">
               <div id="bottom-main-block">
                  <div id="bottom-block1" class="bottom-blocks">
                     <h3>Update your profile</h3>
                     <p>By keeping your profile up to date, you can receive the latest offers and make buying deals as easy as 1-2-3.<br />&nbsp;<br />
                        <a href="#">Click here to update your profile now</a>
                     </p>
                  </div>
                  <div id="bottom-block2" class="bottom-blocks">
                     <h3>How does it work?</h3>
                     <p>2b4me works hard to search the city you love for the things that make it special and unique. Then we connect you with these things to give you an opportunity to fall in love with your city all over again - at a discount. <a href="#">Read More</a>
                     </p>
                  </div>
                  <div id="bottom-block3" class="bottom-blocks">
                     <h3>Manage your deals</h3>
                     <p>Need to print out that voucher before you go out? Or want to see a quick list of the deals you've purchased? <a href="#">Click here</a>.</p>
                  </div>
               </div>
            </div>
         </div>
         <!-- END BOTTOM-->
         <!--START FOOTER-->
         <div id="footer">
            <g:include controller="featured" action="footer" />
         </div>
         <!--END FOOTER-->
         <div id="shadow-bottom">
            <!--required-->
         </div>
         <!-- InstanceEndEditable -->
      </div>
      <!-- END CONTAINER -->
   </body>
   <!-- InstanceEnd -->
</html>