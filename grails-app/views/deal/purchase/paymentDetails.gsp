<html>

<head>
</head>

<body>

<h2>Payment details</h2>

<g:form name="purcahseDeal" controller="deal" action="purchase" id="${shortName}">

   <p>You're buying deal ${shortName}

   <p>
      <g:submitButton name="continue" value="Continue" /> &nbsp;
      <g:submitButton name="cancel" value="Cancel" />
   </p>
   
</g:form>

</body>

</html>