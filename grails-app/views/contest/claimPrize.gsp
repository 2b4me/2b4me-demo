<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin - Templates</title>
      <g:external dir="css" file="bootstrap.css" />
      <g:external dir="css" file="boostrap-ext.css" />
   </head>
   <body style="margin: 15px;">
      <h3>Claim a prize</h3>
      <p>&nbsp;</p>
      <form name="claimPrize" method="POST" action="claimPrize">
         <input name="formSubmitted" type="hidden" value="true" />
         <label>Name</label> <input name="name" type="text" />
         <label>Entry</label> <input name="entry" type="text" />
         <label>Prize</label> <input name="prize" type="text" />
         <label>Date</label> <input name="date" type="text" />
         <p>&nbsp;</p>
         <p><input type="submit" /></p>
      </form>
   </body>
   <g:external dir="js" file="jquery-1.7.2.js" />
   <g:external dir="js" file="bootstrap.js" />
   <g:external dir="js" file="bootstrap-ext.js" />
</html>