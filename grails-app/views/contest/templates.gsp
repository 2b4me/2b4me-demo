<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin</title>
      <g:external dir="css" file="bootstrap.css" />
      <g:external dir="css" file="boostrap-ext.css" />
   </head>
   <body style="margin: 15px;">
      <h3>Templates</h3>
      <p>
         <g:each in="${templates}" var="e" status="i">
         ${i+1}. <a href="#" class="templateLink" id="template${e.id}" templateId="${e.id}">${e.name}</a><br/>
         </g:each>
      </p>
      <p>&nbsp;</p>
      <hr/>
      <p id="selectedTemplateControls" style="width: 500px; display: none;">
         <a id="viewSelectedTemplate" style="color: grey; text-decoration: none;">View</a> |
         <a href="#" id="editSelectedTemplate">Edit</a> |
         <a id="saveSelectedTemplate" style="color: grey; text-decoration: none;">Save</a> <!-- |
         <a id="deleteSelectedTemplate" style="color: grey; text-decoration: none;">Delete</a> -->
         <br/>&nbsp;
      </p>
      <p id="selectedTemplate" style="width: 500px;"></p>
   </body>
   <g:external dir="js" file="jquery-1.7.2.js" />
   <g:external dir="js" file="bootstrap.js" />
   <g:external dir="js" file="bootstrap-ext.js" />
   <g:external dir="js" file="templates.js" />
</html>