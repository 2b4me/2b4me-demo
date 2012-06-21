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
         <g:include action="topMenu" />
         <div class="row second-row">
            <div class="span2 sidebar">
               <g:include action="sidebarMenu" />
            </div>
            <div class="span9">
               <form class="form-horizontal">
                  <fieldset>
                     <legend>2b4me Admin Site</legend>
                     <p>This site is here for 2b4me.com administrators to manage the site's users and deals.</p>
                  </fieldset>
               </form>
            </div>
            <div class="span1">&nbsp;</div>
         </div>
      </div>
   </body>
   <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
   <g:external dir="js" file="bootstrap.js" />
   <g:external dir="js" file="bootstrap-ext.js" />
</html>