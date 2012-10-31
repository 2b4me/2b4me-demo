<g:link controller="featured" elementId="logo"><g:img dir="images" file="2b4me-logo.png" /></g:link>
<g:if test="${request.userId}">
   <ul id="nav" class="logged-on">
      <li id="home-link"><g:link controller="featured"></g:link></li>
      <li id="featured-link"><g:link controller="featured">Home</g:link></li>
      <%--
      <li id="featured-link"><g:link controller="featured">Featured</g:link></li>
      <li id="browse-link"><g:link controller="browse">Browse</g:link></li>
      --%>
      <li id="sign-link"><g:link controller="profile">Profile</g:link></li>
      <li id="login-link"><a id="logout-link" href="logout">Logout</a></li>
   </ul>
   <ul id="nav" class="logged-off hidden">
      <li id="home-link"><g:link controller="featured"></g:link></li>
      <li id="featured-link"><g:link controller="featured">Home</g:link></li>
      <%--
      <li id="featured-link"><g:link controller="featured">Featured</g:link></li>
      <li id="browse-link"><g:link controller="browse">Browse</g:link></li>
      --%>
      <li id="sign-link"><g:link controller="user" action="signup">Sign up</g:link></li>
      <li id="login-link"><a id="signin" href="sign-in.html">Login</a></li>
   </ul>
</g:if>
<g:else>
   <ul id="nav" class="logged-on hidden">
     <li id="home-link"><g:link controller="featured"></g:link></li>
     <li id="featured-link"><g:link controller="featured">Home</g:link></li>
     <%--
     <li id="featured-link"><g:link controller="featured">Featured</g:link></li>
     <li id="browse-link"><g:link controller="browse">Browse</g:link></li>
     --%>
     <li id="sign-link"><g:link controller="profile">Profile</g:link></li>
     <li id="login-link"><a id="logout-link" href="logout">Logout</a></li>
  </ul>
   <ul id="nav" class="logged-off">
      <li id="home-link"><g:link controller="featured"></g:link></li>
      <li id="featured-link"><g:link controller="featured">Home</g:link></li>
      <%--
      <li id="featured-link"><g:link controller="featured">Featured</g:link></li>
      <li id="browse-link"><g:link controller="browse">Browse</g:link></li>
      --%>
      <li id="sign-link"><g:link controller="user" action="signup">Sign up</g:link></li>
      <li id="login-link"><a id="signin" href="sign-in.html">Login</a></li>
   </ul>
</g:else>
<div id="search-form">
   <%--
   <label for="city">Choose your city</label>
   <select name="city" class="select-box">
      <option value="">Miami</option>
      <option value="">Barcelona</option>
   </select>
   --%>
   <%--
   <g:form name="myForm" url="[action:'index',controller:'browse']" method="get">
      <div id="search-field">
         <input type="text" id="search-input" name="search" value="Search Deals..."  />
         <input type="submit" value="" id="search-btn" />
      </div>
   </g:form>
    --%>
</div>