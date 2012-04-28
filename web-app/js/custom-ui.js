$(document).ready(function(){

//************************************ START SELECT BOX ****************************************//
		$('.select-box').each(function(){
			$(this).after('<div class="sel2"><div class="sel2-bg"></div>  <div class="chosen"></div> <span class="arrow"></span>                  <ul></ul></div>');
		});
			$('.sel2').each(function(){
				$(this).addClass('hide');
				var texts= [];
				var box= $(this).prev();
				var box2= $(this);
				
				$(this).find('.chosen').text(box.children('option:selected').text());
				var boxWidth= box.width()-27+17+2;
				$(this).css('width', boxWidth+'px');
				
				
				var offset= box.offset();
				$(this).offset({top:offset.top, left:offset.left});
				
				
				box.children('option').each(function(){
					texts.push($(this).text());
				});
				
				box.addClass('select-box-comp');
				
				for(var i=0; i<texts.length; i++) {
				$(this).find('ul').append('<li>'+texts[i]+'</li>');
				}
				
				$(this).click(function(){ 
					$(this).toggleClass('hide');
				});

				$(this).find('li').live('click', function(){
					var thisText= $(this).text();
					var selected= texts.indexOf(thisText);
					box[0].selectedIndex=selected;
					box2.find('.chosen').text(thisText);
					var actualWidth= box.width();
					box2.css('width', (actualWidth-27+17+2)+'px');
				});
			});
			$('html').click(function(f){ 
				if(!$(f.target).parent().hasClass('sel2') )
				$('.sel2').addClass('hide');
			});
//************************************ END SELECT BOX ****************************************//

//************************************ START INPUTS ****************************************//
$('body').append('<div id="login" class="modal-box"><h2>Please Log In 2b4me:</h2><form action="#"><div class="login-input"><label for="login-user" class="blue-label">User Name:</label><input type="text" value="User Name Here..." class="text-input lvl2" id="login-user" /></div><div class="login-input"><label for="login-pass" class="blue-label">Password:</label><input type="password" value="Password Here..." class="text-input lvl2" id="login-pass" /></div><div id="login-actions"><a href="#" class="biglink" id="cancel">cancel</a><button type="submit" class="green-btn lvl2" id="submit">log in</button></div></form><a href="#" title="cancel" id="close-btn"></a></div>');

var globalValue;
var globaTyped;
$('input[type="text"], input[type="password"]').each(function(){
	var value= $(this).attr('value');
	var typed=false;
	globalValue= value;
	globalTyped= typed;
	
	
	var color= $(this).css('color');
	$(this).keyup(function(){
		if($(this).attr('value')===value)
			typed=true;
		else
			typed=false;
	globalTyped= typed;
	});
	$(this).focus(function(){
		if($(this).attr('value')===value && typed===false)
			$(this).attr('value', '');
			$(this).css('color', '#000');
	});
	$(this).blur(function(){
		if($(this).attr('value')==="") {
			$(this).attr('value', value);
			$(this).css('color', color);
		} 
		else $(this).css('color', '#000');
	});
});

$('#search-form, #search-box-form').submit(function(event){
	var theInput= $(this).find('input[type="text"]');
	if( theInput.attr('value')===globalValue && globalTyped===false) {
		event.preventDefault();
		theInput[0].focus();
		return false;
	}
});
//************************************ END INPUTS ****************************************//

//********************************** START MODAL LOGIN *************************************//
$('body').append('<div id="fade"></div>');
$('#fade').css({position:'fixed', top:'0',  left:'0', zIndex:'99',
			   background:'#000', width:'100%', height:'100%', 
			   display:'none'});

$('#login').hide();

$('a[href*="login.html"]').each(function(){
	$(this).attr('href', '#login');
	$(this).click(function(event){
		event.preventDefault();
		$('#fade').fadeTo('normal', 0.70);
		$('#login').fadeIn()/*.find('input[type="text"]')[0].focus()*/;
	});
});

$('#fade, a#close-btn, a#cancel').live('click', function(event){
	$('#fade').stop().fadeOut(300);
	$('#login').stop().fadeOut(300);
	event.preventDefault();
});
//********************************** END MODAL LOGIN *************************************//

});

$(".nyi").click(function() {
  alert("Not yet implemented");
});