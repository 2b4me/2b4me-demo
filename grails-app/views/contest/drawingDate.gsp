<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Contest - Drawing Date</title>
      <g:external dir="css" file="bootstrap.css" />
      <g:external dir="css" file="bootstrap-ext.css" />
   </head>
   <body style="margin: 15px;">
      <h3>Drawing Date</h3>
      <g:if test="${errors.size() > 0}">
         <g:each in="${errors}" var="error">
            <div class="alert alert-error">${error.value}</div>
         </g:each>
      </g:if>
      <div>
      <div>
         <p>Upcoming drawing date: <strong><g:formatDate format="MM/dd/yyyy" date="${nextDrawingDate}" /></strong></p>
      <div>
      <g:form name="updateDrawingDate" action="drawingDate" method="POST">
         <h3>Change Date</h3>
         <div>
            <label>New date</label> <input name="newDate" type="text" value="${data.newDate}" />
            <p>Format: MM/DD/YYYY</p>
         </div>
         <div>
            <p><input type="submit" name="submit" value="Save" /></p>
            <p><input type="submit" name="submit" value="Cancel" /></p>
         </div>
      </g:form>
   </body>
   <g:external dir="js" file="jquery-1.7.2.js" />
   <g:external dir="js" file="bootstrap.js" />
   <g:external dir="js" file="bootstrap-ext.js" />
</html>