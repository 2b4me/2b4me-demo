<a href="home.html" id="logo"><r:img uri="/images/2b4me-logo.png"/></a>
<ul id="nav"> 
	<li id="home-link"><g:link controller="featured"></g:link></li>
	<li id="featured-link"><g:link controller="featured">Featured</g:link></li>
	<li id="browse-link"><g:link controller="browse">Browse</g:link></li>
	<li id="sign-link"><a href="#">Sign up</a></li>
	<li id="login-link"><a href="login.html">Login</a></li>
</ul>
<form id="search-form" action="#">
	<label for="city">Choose your city</label>
	<select name="city" class="select-box">
		<option value="">Miami</option>
	</select>
	
	<div id="search-field">
		<input type="text" id="search-input" name="search" value="Search Deals..."  />
		<input type="submit" value="" id="search-btn" />
	</div>
</form>