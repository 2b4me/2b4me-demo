<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin - Edit a prize</title>
      <g:external dir="css" file="bootstrap.css" />
      <g:external dir="css" file="bootstrap-ext.css" />
   </head>
   <body style="margin: 15px;">
      <h3>Edit a prize</h3>
      <g:if test="${errors.size() > 0}">
         <g:each in="${errors}" var="error">
            <div class="alert alert-error">${error.value}</div>
         </g:each>
      </g:if>
      <g:form name="editPrize" action="editPrize" id="${prize.id}" method="POST">
         <div>
            <label>Prio</label> <input name="prio" type="text" value="${prize.prio}" />
            <p>&nbsp;</p>
         </div>
         <div>
            <label>Name</label> <input name="name" type="text" value="${prize.name}" />
            <p>&nbsp;</p>
         </div>
         <div>
            <label>Description</label> <input name="description" type="text" value="${prize.description}" />
            <p>&nbsp;</p>
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