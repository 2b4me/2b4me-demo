<html>
   <head>
      <title>Error on the server</title>
      <g:external dir="css" file="errors-2.css" />
      <ga:trackPageview />
   </head>
   <body>
      <div id="error-header">
         <g:img class="error-element" dir="images" file="2b4me-logo.png" />
      </div>
      <h1 id="error-first-element" class="error-element">An unexpected error occurred while processing your request.</h1>
      <h3 class="error-element">The admin team has been notified. Please try again, or <a href="mailto:info@2b4me.com?subject=2b4me [${GrailsUtil.environment}] Application Error occured : '${exception?.message?.encodeAsHTML()}'">contact</a> the IT team.</h3>
   </body>
</html>