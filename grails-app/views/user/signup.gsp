<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Sign up or Log in</title>
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
               <div id="registration-content-main">
                  <h2>User Sign-up</h2>
                  <h3>Sign up for access to some of the hottest deals of South Florida</h3>
                  <h5>Already have an account? <g:link action="login">Click here to log in!</g:link></h5>
                  <g:if test="${error}">
                     <div class="alert alert-error">${error}</div>
                  </g:if>
                  <g:form name="registration" controller="user" action="registration">
                     <div id="registration-content">
                        <div id="content-main">
                           <div id="form-entry">
                              <div id="form-label"><label class="blue-label">E-mail address</label></div>
                              <div id="form-input" class="longer email">
                                 <input name="emailAddress" type="text" value="${email}" class="text-input" />
                              </div>
                           </div>
                           <div id="form-entry">
                              <div id="form-label"><label class="blue-label">Password</label></div>
                              <div id="form-input" class="longer password">
                                 <input id="registration-password" name="password" type="password" value="${pass1}" class="text-input" />
                              </div>
                           </div>
                           <div id="form-entry">
                              <div id="form-label"><label class="blue-label">Re-type Password</label></div>
                              <div id="form-input" class="longer password2">
                                 <input id="registration-password2" name="password2" type="password" value="${pass2}" class="text-input" />
                              </div>
                           </div>
                        </div>
                     </div>
                     <div id="registration-content">
                        <p><span class="green-text">&nbsp;</span></p>
                        <a id="registration-link" href="register" class="round-btn">Register</a>
                     </div>
                  </g:form>
                  <g:img dir="images/extras" file="loading.gif" id="registration-loading" class="hidden" />
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
      
      <!-- persists flash scope  -->
      <!-- <g:include controller="admin" action="writeFlash" /> -->
      
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