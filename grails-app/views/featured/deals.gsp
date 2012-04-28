<div id="slider">
   <div id="slider-inner">
      <div id="slider-main">
         <r:img uri="/images/deals/${featuredDeal.shortName}-slider-main-photo.jpg" />
         <div id="slider-desc">
            <h4>${featuredDeal.hoverTitle}</h4>
            <p class="small">${featuredDeal.hoverTeaser}</p>
         </div>
      </div>
      <div id="slider-info">
         <h4>${featuredDeal.title}</h4>
         <p class="small">${featuredDeal.teaser} <a href="#">Read More</a></p>
         <span class="nowonly">Now Only</span>
         <div id="deal-price">
            <span class="prev-price"><g:formatNumber number="${featuredDeal.originalPrice}" format="\$###,##0" /></span>
            <span class="actual-price"><g:formatNumber number="${featuredDeal.price}" format="\$###,##0" /></span>
         </div>
         <a href="#" class="green-btn lvl2" id="view-deal-btn">view deal</a>
      </div>
      <div id="slider-reel">
         <g:each var="otherDeal" in="${otherDeals}">
            <div id="slider-image${sliderIndex++}" class="reel-img">
               <a href="#"><r:img uri="/images/deals/${otherDeal.shortName}-slider-photo.jpg" border="0" /></a>
            </div>
         </g:each>
      </div>
   </div>
   <div id="slider-bottom-corners">
      <!--Required-->
   </div>
</div>