<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin</title>
      <g:external dir="css" file="bootstrap.css" />
      <g:external dir="css" file="boostrap-ext.css" />
   </head>
   <body>
      <div class="container-2">
         <%-- <g:include controller="admin" action="topMenu" /> --%>
         <div class="row second-row">
            <div class="span12">
               <h3>Mark ${params.email} Ineligible</h3>
               <g:form class="well" action="markIneligible" method="POST">
                  <input name="email" type="hidden" value="${params.email}">
                  <label>Reason</label>
                  <input name="reason" type="text" class="span3" placeholder="Type something…" value="${params.reason}" />
                  <span class="help-block">Type here the reason for why this user should be marked ineligible.</span>
                  <button type="submit" class="btn">Submit</button>
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