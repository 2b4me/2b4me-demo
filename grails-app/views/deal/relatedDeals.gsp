<div id="related">
   <div id="related-head">
      <a href="#" class="biglink" id="seerel">See more related deals</a>
      <a href="#" class="biglink" id="browserel">Browse all deals</a>
   </div>
   <g:each var="relatedDeal" in="${relatedDeals}" status="i">
      <div class="relblocks" id="relblock${i+1}">
         <r:img uri="/images/deals/${relatedDeal.shortName}-related-deal-photo.jpg" class="deal-photos" />
         <h4 class="dealnames"><g:link controller="deal" action="index" id="${relatedDeal.shortName}">${relatedDeal.title}</g:link></h4>
         <p class="small">${relatedDeal.hoverTeaser} <a href="#" class="nyi">Read More</a></p>
         <div class="deals-price">
            <span class="nowonly">Now Only</span>
            <span class="actual-price"><g:formatNumber number="${relatedDeal.price}" format="\$###,##0" /></span>
            <span class="prev-price"><g:formatNumber number="${relatedDeal.originalPrice}" format="\$###,##0" /></span>
            <g:link controller="deal" action="index" id="${relatedDeal.shortName}" class="green-btn buynow">Buy now</g:link>
         </div>
      </div>
   </g:each>
</div>