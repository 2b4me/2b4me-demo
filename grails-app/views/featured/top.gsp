<g:link controller="featured" elementId="logo"><r:img uri="/images/2b4me-logo.png"/></g:link>
<ul id="nav"> 
	<li id="home-link"><g:link controller="featured"></g:link></li>
	<li id="featured-link"><g:link controller="featured">Featured</g:link></li>
	<li id="browse-link"><g:link controller="browse">Browse</g:link></li>
	<%-- <g:if test="${session.user}"> --%>
	<g:if test="${true}">
   	<li id="sign-link"><g:link controller="profile">Profile</g:link></li>
   	<li id="login-link"><a href="#" class="nyi">Logout</a></li>
	</g:if>
	<g:else>
	   <li id="sign-link"><a href="#">Sign up</a></li>
   	<li id="login-link"><a href="login.html">Login</a></li>
	</g:else>
</ul>
<div id="search-form">
<label for="city">Choose your city</label>
<select name="city" class="select-box">
   <option value="">Miami</option>
   <option value="">Barcelona</option>
</select>
<g:form name="myForm" url="[action:'index',controller:'browse']" method="get">
<div id="search-field">
	<input type="text" id="search-input" name="search" value="Search Deals..."  />
	<input type="submit" value="" id="search-btn" />
</div>
</g:form>
</div>