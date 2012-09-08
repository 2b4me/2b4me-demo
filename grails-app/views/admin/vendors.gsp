<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin - Vendors</title>
      <g:external dir="css" file="bootstrap.css" />
      <g:external dir="css" file="boostrap-ext.css" />
   </head>
   <body>
      <div class="container-2">
         <g:include action="topMenu" />
         <div class="row second-row">
            <div class="span2 sidebar">
               <g:include action="sidebarMenu" />
            </div>
            <div class="span9">
               <table class="table table-bordered table-hover">
                  <caption>The list of vendors registered with 2b4me.com</caption>
                  <thead>
                     <tr>
                        <th>#</th>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Actions</th>
                     </tr>
                  </thead>
                  <tbody>
                     <g:each in="${vendors}" var="v" status="i">
                        <tr class="">
                           <td>${i+1}</td>
                           <td>${v.code}</td>
                           <td>${v.name}</td>
                           <td>No actions</td>
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