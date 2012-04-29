function updateSub(checkBox) {
	checkBox.disabled = true;
	$("#subUpdating").slideDown();
	var checked = checkBox.checked;
	var name = checkBox.name;
	$.ajax({
		url: "profile/updateSub?name="+name+"&checked="+checked,
		cache: false
	}).done(function( html ) {
		setTimeout(function() {
			$("#subUpdating").hide();
			$("#subDone").show();
		},1250);
		setTimeout(function() {
			$("#subDone").slideUp();
			checkBox.disabled = false;
		},2500);
	});
}

$(document).ready(function(){
	$('.sub').click(function(){
		updateSub(this);
	});
});