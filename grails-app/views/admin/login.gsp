<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin</title>
      <g:external dir="css" file="bootstrap.css" />
      <g:external dir="css" file="bootstrap-ext.css" />
   </head>
   <body>
      <div class="container-2">
         <div class="row second-row">
            <div class="span2 sidebar">
               <p>&nbsp;</p>
            </div>
            <div class="span9">
               <g:if test="${err}">
                  <div class="alert alert-error">${err}</div>
               </g:if>
               <g:form class="well" controller="admin" action="login" method="post">
                  <fieldset>
                     <input type="hidden" name="login" value="true" />
                     <input type="hidden" name="cn" value="${cn}" />
                     <input type="hidden" name="an" value="${an}" />
                     <label>Username</label>
                     <input type="text" name="username" />
                     <label>Password</label>
                     <input type="password" name="password" />
                     <p><input type="submit" /></p>
                  </fieldset>
               </g:form>
            </div>
            <div class="span1">&nbsp;</div>
         </div>
      </div>
   </body>
   <g:external dir="js" file="jquery-1.7.2.js" />
   <g:external dir="js" file="bootstrap.js" />
   <g:external dir="js" file="bootstrap-ext.js" />
</html>