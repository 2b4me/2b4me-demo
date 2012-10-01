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
               <%-- <g:img dir="images/users" file="${profilePhoto}.jpg" /> --%>
               <g:img dir="images/users" file="no-avatar.png" />
               <g:if test="${user.firstName || user.lastName}">
                  <h1>${user.firstName} ${user.lastName}</h1>
               </g:if>
               <g:else>
                  <h1><span id="profile-name-big">Welcome, 2b4me user!</span></h1>
               </g:else>
               <p><span id="profile-email-address-1">${user.emailAddress}</span> <a href="#" id="profile-email-address-1-update-link">Update</a><a href="#" id="profile-email-address-1-cancel-link" style="display:none;">Cancel</a></p>
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
                           <dd id="user-name"><span id="profile-name">N/A</span> <span id="profile-name-options">(<a href="#" id="profile-name-update-link">update</a><a href="#" style="display:none;" id="profile-name-cancel-link">cancel</a>)</span></dd>
                        </g:else>
                     </li>
                     <g:if test="${user.address}">
                        <li>
                           <dt>Address:</dt>
                           <dd id="user-address">${user.address?.address1}</dd>
                        </li>
                        <g:if test="${user.address?.address2 && user.address?.address2 != ''}">
                           <li>
                              <dt style="width: 56px;">&nbsp;</dt>
                              <dd id="user-address">${user.address?.address2}</dd>
                           </li>
                        </g:if>
                        <li>
                           <dt style="width: 56px;">&nbsp;</dt>
                           <dd id="user-address">
                              ${user.address?.city},&nbsp;${user.address?.state}&nbsp;&nbsp;${user.address?.postalCode}
                           </dd>
                        </li>
                     </g:if>
                     <g:else>
                        <div id="profile-address-section">
                           <li>
                              <dt>Address:</dt>
                              <dd id="user-address">N/A (<a href="#" id="profile-address-update-link">update</a>)</dd>
                           </li>
                        </div>
                        <div id="profile-address-section-form" style="display: none;">
                           <li>
                              <dt>Address:</dt>
                              <dd id="user-address"><input type="text" id="profile-address-1-input" value="Address" style="border: 1px solid gray; color: #D3D3D3; width: 150px;" /></dd>
                           </li>
                           <li>
                              <dt style="width: 56px;">City</dt>
                              <dd id="user-address"><input type="text" id="profile-city-input" value="City" style="border: 1px solid gray; color: #D3D3D3; width: 150px;" /></dd>
                           </li>
                           <li>
                              <dt style="width: 56px;">State</dt>
                              <dd id="user-address">
                                 <select id="profile-state-input">
                                    <option value="">--</option>
                                    <g:each in="${states}">
                                       <option value="${it.key}">${it.value}</option>
                                    </g:each>
                                 </select>
                              </dd>
                           </li>
                           <li>
                              <dt style="width: 56px;">Zip</dt>
                              <dd id="user-address"><input type="text" id="profile-zipcode-input" value="Zipcode" style="border: 1px solid gray; color: #D3D3D3;" /></dd>
                           </li>
                           <li>
                              <dt style="width: 1px;">&nbsp;</dt>
                              <dd id="user-address"><a href="#" id="profile-address-save-link">save</a> | <a href="#" id="profile-address-cancel-link">cancel</a></dd>
                           </li>
                        </div>
                        <div id="profile-address-section-data" style="display: none;">
                           <li>
                              <dt>Address:</dt>
                              <dd id="user-address-1">...</dd>
                           </li>
                           <li>
                              <dt style="width: 56px;">&nbsp;</dt>
                              <dd id="user-address-2">...</dd>
                           </li>
                        </div>
                     </g:else>
                     <div id="profile-email-section">
                        <li>
                           <dt>Email:</dt>
                           <dd id="user-email"><span id="profile-email-address-2">${user.emailAddress}</span> <!-- (<a href="#" id="profile-email-address-2-update-link">update</a><a href="#" style="display:none;" id="profile-email-address-2-cancel-link">cancel</a>) --></dd>
                        </li>
                     </div>
                  </dl>
                  <g:link elementId="master-profile-update-link" class="b-link" action="updateProfileInfo">Update</g:link>
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
               <!--
               <div class="blocks" id="cards">
                  <p id="no-cc" style="display:none;">You haven't saved a credit card yet!</p>
                  <ul class="list">
                     <li class="first-row">Card name <span class="right">Actions</span></li>
                     <li>
                        <g:img dir="images" file="master-card.jpg" />
                        Master Card - ending in 1234 <span class="right"><a href="#" class="nyi">Remove</a></span>
                     </li>
                     <li>
                        <g:img dir="images" file="visa-card.jpg" />
                        Visa - ending in 7898 <span class="right"><a href="#" class="nyi">Remove</a></span>
                     </li>
                  </ul>
                  <a href="#" class="b-link nyi">Add Card</a>
               </div>
                -->
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