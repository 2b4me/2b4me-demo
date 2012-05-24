<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Sign up or Log in</title>
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
               <h2>Please register or log in</h2>
               <h3>Don't have an account yet? Registering is easy!</h3>
               <h5>Already have an account? <a id="registration-signin" href="sign-in.html">Click here</a></h5>
               <g:form name="registration" controller="user" action="registration">
                  <div id="registration-content">
                     <div id="content-main">
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">E-mail address</label></div>
                           <div id="form-input" class="longer"><input name="username" type="text" value="${rc?.username}" class="text-input ${hasErrors(bean:rc,field:'username','input-error')}" /></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">Password</label></div>
                           <div id="form-input" class="longer"><input name="password" type="password" value="${rc?.password}" class="text-input ${hasErrors(bean:rc,field:'password','input-error')}" /></div>
                        </div>
                        <div id="form-entry">
                           <div id="form-label"><label class="blue-label">Re-type Password</label></div>
                           <div id="form-input" class="longer"><input name="password2" type="password" value="${rc?.password2}" class="text-input ${hasErrors(bean:rc,field:'password2','input-error')}" /></div>
                        </div>
                     </div>
                  </div>
                  <div id="registration-content">
                     <p><span class="green-text">An e-mail will be sent to you so that you can confirm your account.</span></p>
                     <a id="registration-link" href="register" class="round-btn">Register</a>
                  </div>
               </g:form>
               <r:img uri="/images/extras/loading.gif" id="registration-loading" class="hidden" />
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
      <g:external dir="js" file="user.js" />
   </body>
</html>