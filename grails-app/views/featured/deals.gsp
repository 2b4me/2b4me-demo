<div id="slider">
   <div id="slider-inner">
      <div id="slider-main">
         <r:img uri="/static/images/deals/${featuredDeal.shortName}-slider-main-photo.jpg" />
         <div id="slider-desc">
            <h4>${featuredDeal.hoverTitle}</h4>
            <p class="small">${featuredDeal.hoverTeaser}</p>
         </div>
      </div>
      <div id="slider-info">
         <h4>${featuredDeal.title}</h4>
         <p class="small">${featuredDeal.teaser} <g:link controller="deal" action="index" id="${featuredDeal.shortName}">Read More</g:link></p>
         <span class="nowonly">Now Only</span>
         <div id="deal-price">
            <span class="prev-price"><g:formatNumber number="${featuredDeal.originalPrice}" format="\$###,##0" /></span>
            <span class="actual-price"><g:formatNumber number="${featuredDeal.price}" format="\$###,##0" /></span>
         </div>
         <g:link controller="deal" action="index" id="${featuredDeal.shortName}" class="green-btn lvl2" elementId="view-deal-btn">view deal</g:link>
      </div>
      <div id="slider-reel">
         <g:each var="otherDeal" in="${otherDeals}">
            <div id="slider-image${sliderIndex++}" class="reel-img">
               <g:link controller="deal" action="index" id="${otherDeal.shortName}"><r:img uri="/static/images/deals/${otherDeal.shortName}-slider-photo.jpg" border="0" /></g:link>
            </div>
         </g:each>
      </div>
   </div>
   <div id="slider-bottom-corners">
      <!--Required-->
   </div>
</div>