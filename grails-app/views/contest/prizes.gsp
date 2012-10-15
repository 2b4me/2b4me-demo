<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin - Prizes</title>
      <g:external dir="css" file="bootstrap.css" />
      <g:external dir="css" file="bootstrap-ext.css" />
   </head>
   <body style="margin: 15px;">
      <h1>Prizes</h1>
      <table class="table">
         <thead>
            <tr>
               <th>&nbsp;</th>
               <th>Priority</th>
               <th>Name</th>
               <th>Description</th>
               <th>Actions</th>
            </tr>
         </thead>
         <tbody>
            <g:each in="${prizes}" var="p" status="i">
               <tr>
                  <td>${i+1}</td>
                  <td>${p.prio}</td>
                  <td>${p.name}</td>
                  <td>${p.description}</td>
                  <td><g:link action="editPrize" id="${p.id}">Edit</g:link></td>
               </tr>
            </g:each>
         <tr>
            <td colspan="8">End of file.</td>
         </tr>   
         </tbody>
      </table>
   </body>
   <g:external dir="js" file="jquery-1.7.2.js" />
   <g:external dir="js" file="bootstrap.js" />
   <g:external dir="js" file="bootstrap-ext.js" />
</html>