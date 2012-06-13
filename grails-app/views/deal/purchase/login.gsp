<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Log in</title>
      <g:external dir="css" file="stylesheet.css" />
      <g:external dir="css" file="stylesheet-ext.css" />
   </head>
   <body>
      <r:img uri="/images/only-a-demo-1.png" id="only-a-demo-1" />
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
                  <h2>Please log in to 2b4me</h2>
                  <p>An account is required to purchase deals. Don't have an account yet? Click <g:link controller="user" action="signup">here</g:link></p>
                  <g:if test="${flash.message}">
                     <div class="alert alert-error">${flash.error}</div>
                  </g:if>
                  <g:form name="registration" controller="deal" action="purchase" id="${deal.shortName}">
                     <g:submitButton name="login" value="Login" class="hidden" />
                     <g:submitButton name="cancel" value="Cancel" class="hidden" />
                     <div id="registration-content">
                        <div id="content-main">
                           <div id="form-entry">
                              <div id="form-label"><label class="blue-label">E-mail address</label></div>
                              <div id="form-input" class="longer email"><input name="emailAddress" type="text" value="${pld?.emailAddress}" class="text-input ${hasErrors(bean:pld,field:'emailAddress','input-error')}" /></div>
                              <div id="form-input-error" class="email"><g:renderErrors bean="${pld}" field="emailAddress"/></div>
                           </div>
                           <div id="form-entry">
                              <div id="form-label"><label class="blue-label">Password</label></div>
                              <div id="form-input" class="longer password"><input id="registration-password" name="password" type="password" value="${pld?.password}" class="text-input ${hasErrors(bean:pld,field:'password','input-error')}" /></div>
                              <div id="form-input-error" class="password"><g:renderErrors bean="${pld}" field="password"/></div>
                           </div>
                        </div>
                     </div>
                     <div id="registration-content">
                        <p>&nbsp;</p>
                        <a id="li-cancel-link" href="${deal.shortName}/cancel" class="round-btn">Cancel</a>
                        <a id="li-login-link" href="${deal.shortName}/login" class="round-btn">Login</a>
                     </div>
                  </g:form>
                  <r:img uri="/images/extras/loading.gif" id="registration-loading" class="hidden" />
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
      <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
      <g:external dir="js" file="custom-ui.js" />
      <g:external dir="js" file="custom-ui-ext.js" />
      <g:external dir="js" file="purchase-deal.js" />
   </body>
</html>