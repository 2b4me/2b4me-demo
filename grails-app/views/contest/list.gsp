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
                           <td><a href="#" id="entry" contestantId="${c.id}">${c.entry}</a></td>
                           <td>${new Date(c.signupDate.time)}</td>
                           <g:if test="${c.ineligible}">
                              <td id="eligibility">Yes</td>
                              <td id="eligibilityReason">${c.ineligibilityReason}</td>
                              <td id="eligibilityLink"><a href="#" id="eligible" contestantId="${c.id}">Mark eligible</a></td>
                           </g:if>
                           <g:else>
                              <td id="eligibility">&nbsp;</td>
                              <td id="eligibilityReason">&nbsp;</td>
                              <td id="eligibilityLink"><a href="#" id="ineligible" contestantId="${c.id}">Mark ineligible</a></td>
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
   <g:external dir="js" file="contest-list.js" />
</html>