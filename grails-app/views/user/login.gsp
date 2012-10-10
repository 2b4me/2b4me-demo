<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Log in</title>
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
      <div class="container" id="landing">
         <!--START CONTAINER-INNER-->
         <div id="container-inner">
            <!--do not remove this div-->
            <!-- START MAIN CONTENT (the deal info.) -->
            <div id="content-main" class="nobg">
               <div id="registration-content-main">
                  <h2>User Log in</h2>
                  <h3>Log in for access to some of the hottest deals of South Florida</h3>
                  <h5>Don't have an account yet? <g:link action="signup">Click here to sign up!</g:link></h5>
                  <g:if test="${err}">
                     <div class="alert alert-error">${err}</div>
                  </g:if>
                  <g:form name="registration" controller="user" action="processLoginForm">
                     <g:if test="targetController">
                        <input type="hidden" name="targetController" value="${targetController}">
                     </g:if>
                     <g:if test="targetAction">
                        <input type="hidden" name="targetAction" value="${targetAction}">
                     </g:if>
                     <g:if test="targetId">
                        <input type="hidden" name="targetId" value="${targetId}">
                     </g:if>
                     <div id="registration-content">
                        <div id="content-main">
                           <div id="form-entry">
                              <div id="form-label"><label class="blue-label">E-mail address</label></div>
                              <div id="form-input" class="longer email">
                                 <input name="username" type="text" value="${username}" class="text-input" />
                              </div>
                           </div>
                           <div id="form-entry">
                              <div id="form-label"><label class="blue-label">Password</label></div>
                              <div id="form-input" class="longer password">
                                 <input id="password" name="password" type="password" value="${password}" class="text-input" />
                              </div>
                           </div>
                        </div>
                     </div>
                     <div id="registration-content">
                        <p><span class="green-text">&nbsp;</span></p>
                        <a id="registration-link" href="login" class="round-btn">Login</a>
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