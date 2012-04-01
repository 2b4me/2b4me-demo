<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/2b4me-template.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Home</title>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<g:external dir="css" file="stylesheet.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<g:external dir="js" file="custom-ui.js" />
<g:external dir="css" file="modal.css" />
<!-- InstanceEndEditable -->
<!-- InstanceParam name="page" type="text" value="home" -->
<!-- InstanceParam name="shadow" type="boolean" value="false" -->
<!-- InstanceParam name="footer" type="boolean" value="false" -->
</head>

<body>
	<!--START HEADER-->
	<div id="header">
		<a href="home.html" id="logo"><r:img uri="/images/2b4me-logo.png"/></a>
		<ul id="nav"> 
			<li id="home-link"><a href="profile.html"></a></li>
			<li id="featured-link"><a href="#">Featured</a></li>
			<li id="browse-link"><a href="browse.html">Browse</a></li>
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
	</div>
	<!--END HEADER-->
	
	<!-- START CONTAINER-->
	<div class="container" id="home">
	
	<!-- InstanceBeginEditable name="container-inner" -->
 
    	<!-- START SLIDER -->
    	<div id="slider"> 
        	<div id="slider-inner">
            	<div id="slider-main">
                	<r:img uri="/images/home-slider-main-photo.jpg" />
                	<div id="slider-desc">
                    	<h4>Amazing Hotels Discounts</h4>
                        <p class="small">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a risus elit, ut sodales elit. Duis sollicitudin molestie velit.</p>
                    </div>
                </div>
                
                <div id="slider-info">
                	<h4>Hotels Discounts</h4>
                    <p class="small">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a risus elit, ut sodales elit. Duis sollicitudin molestie velit. Suspendisse id diam et diam varius sagittis id quis mi. <a href="#">Read More</a></p>
                    
                    <span class="nowonly">Now Only</span>
                    <div  id="deal-price">
                        <span class="prev-price">$699</span>
                        <span class="actual-price">$399</span>
					</div>
					<a href="#" class="green-btn lvl2" id="view-deal-btn">view deal</a>
				</div>
                
                <div id="slider-reel">
                    <div id="slider-image1" class="reel-img"><a href="#"><r:img uri="/images/home-slider-image1.jpg" border="0" /></a></div>
                  <div id="slider-image2" class="reel-img"><a href="#"><r:img uri="/images/home-slider-image2.jpg" border="0" /></a></div>
                  <div id="slider-image3" class="reel-img"><a href="#"><r:img uri="/images/home-slider-image3.jpg" border="0" /></a></div>
              </div>
            </div>
           
        	<div id="slider-bottom-corners"><!--Required--></div>
        </div>
        <!-- END SLIDER -->
                
        <!--START BOTTOM-->
        <div id="bottom">
            <div id="bottom-inner">
                <div id="bottom-main-block">
                    <div id="bottom-block1" class="bottom-blocks">
                    	<h3>Update your profile</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a risus elit, ut sodales elit. Duis sollicitudin molestie velit. Suspendisse id diam et diam varius sagittis id quis mi. <a href="#">Read More</a></p>
                    </div>
                    <div id="bottom-block2" class="bottom-blocks">
                    	<h3>How does it work?</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a risus elit, ut sodales elit. Duis sollicitudin molestie velit. Suspendisse id diam et diam varius sagittis id quis mi. <a href="#">Read More</a></p>
                    </div>
                    <div id="bottom-block3" class="bottom-blocks">
                    	<h3>Manage your deals</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a risus elit, ut sodales elit. Duis sollicitudin molestie velit. Suspendisse id diam et diam varius sagittis id quis mi. <a href="#">Read More</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- END BOTTOM-->
        
        <!--START FOOTER-->
        <div id="footer">
        	<div id="footer-inner">
            	<p id="copyright-2b4me">Copyright © 2011 - <span>2012</span>    2b4me, Inc</p>
                <p id="subnav"><a href="#">Sitemap</a>  |  <a href="#">Company</a>  |  <a href="#">Blog</a></p>
                <p id="social">Follow Us 
					<a href="#" class="social-btns" id="fb-btn"></a>
					<a href="#" class="social-btns" id="twitter-btn"></a>
				</p>
            </div>
        </div>
        <!--END FOOTER-->
        
        <div id="shadow-bottom"><!--required--></div>
        <!-- InstanceEndEditable -->
	
		
	</div>
	<!-- END CONTAINER -->
	
</body>
<!-- InstanceEnd --></html>