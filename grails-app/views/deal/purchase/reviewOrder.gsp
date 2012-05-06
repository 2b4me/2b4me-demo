<html>

<head>
</head>

<body>

<h2>Review order</h2>

<g:form name="purcahseDeal" controller="deal" action="purchase" id="${shortName}">

   <p>Review your order. If something's not right, please click Back. Otherwise, click Continue.</p>

   <p>
      <g:submitButton name="continue" value="Continue" /> &nbsp;
      <g:submitButton name="back" value="Back" /> &nbsp;
      <g:submitButton name="cancel" value="Cancel" />
   </p>
   
</g:form>

</body>

</html>