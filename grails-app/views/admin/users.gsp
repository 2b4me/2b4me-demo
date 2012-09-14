<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Users</title>
      <g:external dir="css" file="bootstrap.css" />
      <g:external dir="css" file="bootstrap-ext.css" />
   </head>
   <body>
      <div class="container-2">
         <g:include action="topMenu" />
         <div class="row second-row">
            <div class="span2 sidebar">
               <g:include action="sidebarMenu" />
            </div>
            <div class="span9">
               <table>
                  <thead>
                     <tr>                        
                        <th>&nbsp;</th>
                        <th>User ID</th>
                        <th>Username</th>
                        <th>Hashed password</th>
                        <th>Admin?</th>
                        <th>Actions</th>
                     </tr>
                  </thead>
                  <tbody>
                     <g:each in="${users}" var="u" status="i">
                        <tr>
                           <td>${i++}</td>
                           <td>${u.id}</td>
                           <td>${u.emailAddress}</td>
                           <td>${u.password}</td>
                           <td>${u.admin}</td>
                           <td>None</td>
                        </tr>
                     </g:each>
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