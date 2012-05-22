<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Home</title>
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
      <div class="container" id="home">
         <!-- START SLIDER -->
         <g:include controller="featured" action="deals" params="[selectedDealIndex: 0]" />
         <!-- END SLIDER -->
         <!--START BOTTOM-->
         <div id="bottom">
            <div id="bottom-inner">
               <div id="bottom-main-block">
                  <div id="bottom-block1" class="bottom-blocks">
                     <h3>Update your profile</h3>
                     <p>By keeping your profile up to date, you can receive the latest offers and make buying deals as easy as 1-2-3.<br />&nbsp;<br />
                        <g:link controller="profile">Click here to update your profile now</g:link>
                     </p>
                  </div>
                  <div id="bottom-block2" class="bottom-blocks">
                     <h3>How does it work?</h3>
                     <p>2b4me works hard to search the city you love for the things that make it special and unique. Then we connect you with these things to give you an opportunity to fall in love with your city all over again - at a discount. <a href="#" class="nyi">Read More</a>
                     </p>
                  </div>
                  <div id="bottom-block3" class="bottom-blocks">
                     <h3>Manage your deals</h3>
                     <p>Need to print out that voucher before you go out? Or want to see a quick list of the deals you've purchased? <g:link controller="profile">Click here</g:link>.</p>
                  </div>
               </div>
            </div>
         </div>
         <!-- END BOTTOM-->
         <!--START FOOTER-->
         <div id="footer">
            <g:include controller="featured" action="bottom" />
         </div>
         <!--END FOOTER-->
         <div id="shadow-bottom">
            <!--required-->
         </div>
      </div>
      <!-- END CONTAINER -->
      <!--PAGE SCRIPT -->
      <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
      <g:external dir="js" file="custom-ui.js" />
      <g:external dir="js" file="custom-ui-ext.js" />
      <g:external dir="js" file="featured.js" />
   </body>
</html>