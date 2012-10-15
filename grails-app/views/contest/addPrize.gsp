<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin - Add a prize</title>
      <g:external dir="css" file="bootstrap.css" />
      <g:external dir="css" file="bootstrap-ext.css" />
   </head>
   <body style="margin: 15px;">
      <h3>Add a prize</h3>
      <p>&nbsp;</p>
      <form name="addPrize" method="POST" action="addPrize">
         <input name="formSubmitted" type="hidden" value="true" />
         <div>
            <label>Name</label> <input name="name" type="text" />
            <p>&nbsp;</p>
         </div>
         <div>
            <label>Description</label> <input name="description" type="text" />
            <p>&nbsp;</p>
         </div>
         <div>
            <p><input type="submit" /></p>
         </div>
      </form>
   </body>
   <g:external dir="js" file="jquery-1.7.2.js" />
   <g:external dir="js" file="bootstrap.js" />
   <g:external dir="js" file="bootstrap-ext.js" />
</html>