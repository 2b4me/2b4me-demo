<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <!-- InstanceBegin template="/Templates/2b4me-template.dwt" codeOutsideHTMLIsLocked="false" -->
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Profile</title>
      <g:external dir="css" file="stylesheet.css" />
      <g:external dir="css" file="stylesheet-ext.css" />
   </head>
   <body>
      <!--START HEADER-->
      <div id="header">
         <g:include controller="featured" action="top" />
      </div>
      <!-- END HEADER -->
      <!-- START CONTAINER-->
      <div class="container" id="profile">
         <div id="container-inner">
            <!--START TITLE PROFILE-->
            <div id="head">
               <r:img uri="/images/profile-photo.jpg" />
               <h1>${user.firstName} ${user.lastName}</h1>
               <p>${user.emailAddress} <a href="#">Update</a></p>
            </div>
            <!--END TITLE PROFILE-->
            <!--START INFO BLOCKS-->
            <div id="info">
               <!--START PURCHASED DEALS-->
               <div class="blocks" id="purchased">
                  <g:if test="${purchases.size() == 0}">
                     <p id="no-deals-purchased">You haven't made a purchase yet!</p>
                  </g:if>
                  <g:else>
                     <ul class="list">
                        <li class="first-row">Deal Name <span class="right">Expiration</span></li>
                        <g:each status="i" in="${purchases}" var="p">
                           <li>
                              <g:link controller="deal" action="confirmation" id="${p.deal.shortName}"><!-- ${p.id} -->${p.deal.title}</g:link>
                              <span class="right"><g:formatDate format="MM/dd/yy" date="${p.deal.expiration}"/></span>
                           </li>
                        </g:each>
                     </ul>
                  </g:else>
                  <g:link action="index" class="b-link">Go back to Profile</g:link>
               </div>
               <!--END PURCHASED DEALS-->
            </div>
            <!--END INFO BLOCKS-->
         </div>
         <!--START FOOTER-->
         <div id="footer">
            <g:include controller="featured" action="bottom" />
         </div>
         <!--END FOOTER-->
      </div>
      <!-- END CONTAINER -->
      <div id="shadow-bottom">
         <!--required--> 
      </div>
      <!--PAGE SCRIPT -->
      <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
      <g:external dir="js" file="custom-ui.js" />
      <g:external dir="js" file="profile.js" />
   </body>
</html>