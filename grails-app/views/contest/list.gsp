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
               <h1>Contestants</h1>
               <table class="table">
                  <thead>
                     <tr>
                        <th>&nbsp;</th>
                        <th>E-mail</th>
                        <th>Contest Number</th>
                        <th>Signup Date</th>
                        <th>Ineligible?</th>
                        <th>Ineligibility Reason</th>
                        <th>&nbsp;</th>
                     </tr>
                  </thead>
                  <tbody>
                     <g:each in="${contestants}" var="c" status="i">
                        <tr>
                           <td>${i+1}</td>
                           <td>${c.email}</td>
                           <td>${c.entry}</td>
                           <td>${new Date(c.signupDate.time)}</td>
                           <g:if test="${c.ineligible}">
                              <td>Yes</td>
                              <td>${c.ineligibilityReason}</td>
                              <td><g:link action="markEligible" params="[email: c.email]" class="nyi">Mark eligible</g:link></td>
                           </g:if>
                           <g:else>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td><g:link action="markIneligible" params="[email: c.email]">Mark ineligible</g:link></td>
                           </g:else>
                        </tr>
                     </g:each>
                  <tr>
                     <td colspan="7">End of file.</td>
                  </tr>   
                  </tbody>
               </table>
            </div>
            <div class="span1">&nbsp;</div>
         </div>
      </div>
   </body>
   <g:external dir="js" file="jquery-1.7.2.js" />
   <g:external dir="js" file="bootstrap.js" />
   <g:external dir="js" file="bootstrap-ext.js" />
</html>