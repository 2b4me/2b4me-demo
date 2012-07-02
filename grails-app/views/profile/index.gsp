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
               <%-- <r:img uri="/images/users/${profilePhoto}.jpg" /> --%>
               <r:img uri="/images/users/no-avatar.png" />
               <g:if test="${user.firstName || user.lastName}">
                  <h1>${user.firstName} ${user.lastName}</h1>
               </g:if>
               <g:else>
                  <h1>Welcome, 2b4me user!</h1>
               </g:else>
               <p>${user.emailAddress} <a href="#" class="nyi">Update</a></p>
            </div>
            <!--END TITLE PROFILE-->
            <!--START INFO BLOCKS-->
            <div id="info">
               <!--START USER INFO-->
               <div class="blocks" id="user">
                  <dl>
                     <li>
                        <dt>Name:</dt>
                        <g:if test="${user.firstName || user.lastName}">
                           <dd id="user-name">${user.firstName} ${user.lastName}</dd>
                        </g:if>
                        <g:else>
                           <dd id="user-name">N/A (<a href="update" class="nyi">update</a>)</dd>
                        </g:else>
                     </li>
                     <li>
                        <dt>Address:</dt>
                        <g:if test="${user.address}">
                           <dd id="user-address">${user.address?.address1}, ${user.address?.city}, ${user.address?.state}, ${user.address?.postalCode}</dd>
                        </g:if>
                        <g:else>
                           <dd id="user-address">N/A (<a href="update" class="nyi">update</a>)</dd>
                        </g:else>
                     </li>
                     <li>
                        <dt>Email:</dt>
                        <dd id="user-email">${user.emailAddress}</dd>
                     </li>
                     <li>
                        <dt>Password:</dt>
                        <dd id="user-pass">XXXXXXXXXXXXX</dd>
                     </li>
                  </dl>
                  <a href="#" class="b-link nyi">Update</a>
               </div>
               <!--END USER INFO-->
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
                              <g:link controller="deal" action="confirmation" id="${p.deal.shortName}" params="[purchaseId: p.id]">${p.deal.title}</g:link>
                              <span class="right"><g:formatDate format="MM/dd/yy" date="${p.deal.expiration}"/></span>
                           </li>
                        </g:each>
                     </ul>
                     <g:link action="purchasedDeals" class="b-link">See More</g:link>
                  </g:else>
               </div>
               <!--END PURCHASED DEALS-->
               <!--START SUBSCRIPTIONS-->
               <div class="blocks" id="subscriptions">
                  <ul id="subs-list">
                     <li id="subUpdating" style="display:none;">Updating...</li>
                     <li id="subDone" style="display:none;">Done!</li>
                     <li id="subs-label">Select the 2b4me email alerts you want:</li>
                     <g:each var="sub" in="${subscriptions}" status="i">
                        <g:if test="${user.subscriptions.contains(sub)}">
                           <li><input type="checkbox" class="checkbox sub" id="check${i}" name="${sub.name}" checked="true"/><label for="check${i}">${sub.name}</label></li>
                        </g:if>
                        <g:else>
                           <li><input type="checkbox" class="checkbox sub" id="check${i}" name="${sub.name}" /><label for="check${i}">${sub.name}</label></li>
                        </g:else>
                     </g:each>
                  </ul>
               </div>
               <!--END SUBSCRIPTIONS-->
               <!--START CREDIT CARDS-->
               <div class="blocks" id="cards">
                  <p id="no-cc" style="display:none;">You haven't saved a credit card yet!</p>
                  <ul class="list">
                     <li class="first-row">Card name <span class="right">Actions</span></li>
                     <li>
                        <r:img uri="/images/master-card.jpg" />
                        Master Card - ending in 1234 <span class="right"><a href="#" class="nyi">Remove</a></span>
                     </li>
                     <li>
                        <r:img uri="/images/visa-card.jpg" />
                        Visa - ending in 7898 <span class="right"><a href="#" class="nyi">Remove</a></span>
                     </li>
                  </ul>
                  <a href="#" class="b-link nyi">Add Card</a>
               </div>
               <!--START CREDIT CARDS-->
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
      <g:external dir="js" file="jquery-1.7.2.js" />
      <g:external dir="js" file="custom-ui.js" />
      <g:external dir="js" file="custom-ui-ext.js" />
      <g:external dir="js" file="profile.js" />
   </body>
</html>