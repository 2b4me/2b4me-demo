var nextIndex = 1;
function loadNextDiv() {
 $.ajax({
   url: "featured/deals?selectedDealIndex="+nextIndex,
   cache: false
 }).done(function( html ) {
    $("#slider").replaceWith(html);
    if (nextIndex == 3) {
       nextIndex = 0;
    } else {
       nextIndex++;
    }
 });
}
$(document).ready(function(){
 $("#testBtn").click(function () {
    loadNextDiv();
 });
 setInterval(function() {
    loadNextDiv();
 }, 10 * 1000);
});