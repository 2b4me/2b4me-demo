<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Please confirm your account</title>
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
                  <h2>Please confirm your account</h2>
                  <g:if test="${errors.size() > 0}">
                     <p class="important">
                     <g:each in="${errors}" var="e">
                        <div class="error"><span>${e.value}</span></div>
                     </g:each>
                  </g:if>
                  <p id="accountConfirmationDescription">To confirm your account, please enter the registration key below:</p>
                  <g:form name="accountConfirmationForm" action="confirm">
                     <input type="hidden" name="formSubmitted" value="true">
                     <input id="accountConfirmationRegistrationKey" class="text-input" type="text" name="key" value="${data.key}" /><br/>
                     <a id="accountConfirmationFormSubmit" class="round-btn" href="confirm">Enter Key</a>
                  </g:form>
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