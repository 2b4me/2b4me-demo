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
            <!--START INFO BLOCKS-->
            <div id="info">
               <!--START USER INFO-->
               <div class="blocks" id="user" style="width: 856px; height: 360px;">
                  <dl>
                     <li>
                        <dt>Name:</dt>
                        <dd id="user-name">
                           <g:if test="${user.firstName}">
                              <input type="text" id="update-profile-first-name-input" value="${user.firstName}"
                               style="border: 1px solid gray;" />
                              <input type="text" id="update-profile-last-name-input" value="${user.lastName}"
                               style="border: 1px solid gray;" />
                           </g:if>
                           <g:else>
                              <input type="text" id="update-profile-first-name-input" value="First name"
                               style="border: 1px solid gray; color: #D3D3D3" />
                              <input type="text" id="update-profile-last-name-input" value="Last name"
                               style="border: 1px solid gray; color: #D3D3D3" />
                           </g:else>
                        </dd>
                     </li>
                     <li>
                        <dt>Address:</dt>
                        <dd id="user-address">
                           <g:if test="${user.address?.address1}">
                              <input type="text" id="update-profile-address-1-input" value="${user.address?.address1}"
                               style="border: 1px solid gray; width: 150px;" />
                           </g:if>
                           <g:else>
                              <input type="text" id="update-profile-address-1-input" value="Address"
                               style="border: 1px solid gray; color: #D3D3D3; width: 150px;" />
                           </g:else>
                        </dd>
                     </li>
                     <li>
                        <dt style="width: 56px;">&nbsp;</dt>
                        <dd id="user-address">
                           <g:if test="${user.address?.city}">
                              <input type="text" id="update-profile-city-input" value="${user.address?.city}"
                               style="border: 1px solid gray; width: 150px;" />
                           </g:if>
                           <g:else>
                              <input type="text" id="update-profile-city-input" value="City"
                               style="border: 1px solid gray; color: #D3D3D3; width: 150px;" />
                           </g:else>
                        </dd>
                     </li>
                     <li>
                        <dt style="width: 52px;">&nbsp;</dt>
                        <dd id="user-address">
                           <g:if test="${user.address?.state}">
                              <select id="update-profile-state-input" style="color: black;">
                                 <option value="">--</option>
                                 <g:each in="${states}">
                                    <g:if test="${it.key == user.address?.state}">
                                       <option value="${it.key}" selected="true">${it.value}</option>
                                    </g:if>
                                    <g:else>
                                       <option value="${it.key}">${it.value}</option>
                                    </g:else>
                                 </g:each>
                              </select>
                           </g:if>
                           <g:else>
                              <select id="update-profile-state-input" style="color: #D3D3D3;">
                                 <option value="">--</option>
                                 <g:each in="${states}">
                                    <option value="${it.key}">${it.value}</option>
                                 </g:each>
                              </select>
                           </g:else>
                        </dd>
                     </li>
                     <li>
                        <dt style="width: 56px;">&nbsp;</dt>
                        <dd id="user-address">
                           <g:if test="${user.address?.postalCode}">
                              <input type="text" id="update-profile-zipcode-input" value="${user.address?.postalCode}"
                               style="border: 1px solid gray; width: 150px;" />
                           </g:if>
                           <g:else>
                              <input type="text" id="update-profile-zipcode-input" value="Zip code"
                               style="border: 1px solid gray; color: #D3D3D3; width: 60px;" />
                           </g:else>
                        </dd>
                     </li>
                     <li>
                        <dt>Email:</dt>
                        <dd id="user-email">
                           <input type="text" id="update-profile-email-input" value="${user.emailAddress}"
                            style="border: 1px solid gray;" />
                        </dd>
                     </li>
                  </dl>
                  <div id="update-profile-error-message" style="position: absolute; bottom: 75px; left: 15px; font-size: 15px; width: 200px; display: none;">
                     <p style="color:red;">Error message</p>
                  </div>
                  <div style="position: absolute; bottom: 25px; left: 30px; font-size: 15px; width: 200px;">
                     <a href="#" id="update-profile-cancel-changes" class="round-btn">Cancel</a>
                  </div>
                  <div style="position: absolute; bottom: 25px; left: 125px; font-size: 15px; width: 200px;">
                     <a href="#" id="update-profile-save-changes" class="round-btn">Save Changes</a>
                  </div>
                  
                  <!-- bottom 25 right 35 -->
                  <!-- <a href="#" id="master-profile-update-link" class="b-link nyi">Save Changes</a> -->
               </div>
               <!--END USER INFO-->
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