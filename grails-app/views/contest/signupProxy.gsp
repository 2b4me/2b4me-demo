<html>

<body>
   <script type="text/javascript" src="jquery-1.7.2.js"></script>
   <script type="text/javascript">
      $.ajax('http://demo.2b4me.com/contest/signup', {
         cache: false,
         data: {
            email: ${email}
         }
      });
   </script>
</body>

</html>