<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Registration confirmed</title>
      <g:external dir="css" file="stylesheet.css" />
      <g:external dir="css" file="stylesheet-ext.css" />
      <ga:trackPageview />
   </head>
   <body>
      <!--START HEADER-->
      <div id="header">
         <g:include controller="featured" action="top" />
      </div>
      <!-- END HEADER -->
      <!-- START CONTAINER-->
      <div class="container" id="landing">
         <!--START CONTAINER-INNER-->
         <div id="container-inner">
            <!--do not remove this div-->
            <!-- START MAIN CONTENT (the deal info.) -->
            <div id="content-main" class="nobg">
               <div id="registration-content-main" class="complete">
                  <g:img dir="images" file="registration-complete.png"/>
                  <h2>Registration confirmed</h2>
                  <p>To get started you can:<p>
                  <ul>
                     <li><g:link controller="featured" action="index">See the Featured Deals</g:link></li>
                     <li><g:link controller="browse" action="index">Browse the Deals on our site</g:link></li>
                     <li><g:link controller="profile" action="index">Update your profile</g:link></li>
                  </ul>
                  <p class="important">&nbsp;</p>
                  <p>We're happy you're with us. We hope we can serve you well. Welcome to 2b4me!</p>
               </div>
            </div>
            <!-- END MAIN CONTENT (the deal info.) -->
            <!-- START RELATED DEALS -->
            <div id="related">
               
            </div>
            <!-- END RELATED DEALS -->
         </div>
         <!--END CONTAINER-INNER-->
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
      <g:external dir="js" file="user.js" />
   </body>
</html>