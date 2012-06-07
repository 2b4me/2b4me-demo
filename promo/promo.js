$(document).ready(function() {
    countdown(2012, 7, 1); // kick off the countdown
    
    $('.nyi').click(function(event){
       alert('not yet implemented');
       event.preventDefault();
    });
    
    $('#formfeed .text-input').tooltip({
	    placement: 'bottom',
	    title: 'Something went wrong, please try again',
	    trigger: 'manual'
	});
    
    $('#formfeed .text-input').focus(function(event) {
        if ($('#formfeed .text-input').val() == 'Enter email') {
            $('#formfeed .text-input').val('');
        }
        $('#formfeed .text-input').tooltip('hide');
        $('#formfeed .text-input').removeClass("error");
    });
    
    $('#formfeed .text-input').blur(function(event) {
        if ($('#formfeed .text-input').val() == '') {
            $('#formfeed .text-input').val('Enter email');
        }
    });
    
    $('#formfeed .green-btn').click(function(event) {
        event.preventDefault();
        
        var email = $('#formfeed .text-input').val();
    	
    	if (!emailCheck(email)) {
    		$('#formfeed .text-input').addClass("error");
    		$('#formfeed .text-input').tooltip('show');
    		return;
    	}
    	
    	$('#formfeed .green-btn').attr("disabled", "disabled");
    	
    	var dataString = "Name=&formmail_mail_email=" + email;
    	$.ajax({
    		type: "POST",
    		url: "http://2b4me.com/cgi-bin/FormMail.signup.pl",
    		data: dataString,
    		success: function() {
    			$("#emailSuccess").modal({
    		        keyboard: true
    		    });
    		},
    		error: function(request, status, err) {
    			$('#formfeed .text-input').addClass("error");
        		$('#formfeed .text-input').tooltip('show');
        		$('#formfeed .green-btn').removeAttr("disabled");
    		}
    	});
    });
});

function emailCheck(emailStr) {
    var emailPat = /^(.+)@(.+)$/;
    var specialChars = "\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";
    var validChars = "\[^\\s" + specialChars + "\]";
    var quotedUser = "(\"[^\"]*\")";
    var ipDomainPat = /^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/;
    var atom = validChars + '+';
    var word = "(" + atom + "|" + quotedUser + ")";
    var userPat = new RegExp("^" + word + "(\\." + word + ")*$");
    var domainPat = new RegExp("^" + atom + "(\\." + atom + ")*$");
    var matchArray = emailStr.match(emailPat);

    if (matchArray == null) {
        // alert("Email address seems incorrect (check @ and .'s)");
        return false;
    }

    var user = matchArray[1];
    var domain = matchArray[2];

    if (user.match(userPat) == null) {
        // alert("The username doesn't seem to be valid.");
        return false;
    }

    var IPArray = domain.match(ipDomainPat);
    if (IPArray != null) {
        for (var i = 1; i <= 4; i++) {
            if (IPArray[i] > 255) {
                // alert("Destination IP address is invalid!");
                return false;
            }
        }
        return true;
    }

    var domainArray = domain.match(domainPat);
    if (domainArray == null) {
        // alert("The domain name doesn't seem to be valid.");
        return false;
    }

    var atomPat = new RegExp(atom, "g");
    var domArr = domain.match(atomPat);
    var len = domArr.length;
    if (domArr[domArr.length - 1].length < 2 || domArr[domArr.length - 1].length > 3) {
        // alert("The address must end in a three-letter domain, or two letter country.");
        return false;
    }

    if (len < 2) {
        var errStr = "This address is missing a hostname!";
        // alert(errStr);
        return false;
    }

    return true;
}

var montharray = new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

function countdown(yr, m, d) {
    var today = new Date();
    var todayy = today.getYear();
    if (todayy < 1000) {
        todayy += 1900;
    }
    var todaym = today.getMonth();
    var todayd = today.getDate();
    var todayh = today.getHours();
    var todaymin = today.getMinutes();
    var todaysec = today.getSeconds();
    
    var todaystring = montharray[todaym]+" "+todayd+", "+todayy+" "+todayh+":"+todaymin+":"+todaysec;
    var futurestring = montharray[m-1]+" "+d+", "+yr;
    var dd = Date.parse(futurestring)-Date.parse(todaystring);
    
    var dday = Math.floor(dd/(60*60*1000*24)*1);
    var dhour = Math.floor((dd%(60*60*1000*24))/(60*60*1000)*1);
    var dmin = Math.floor(((dd%(60*60*1000*24))%(60*60*1000))/(60*1000)*1);
    var dsec = Math.floor((((dd%(60*60*1000*24))%(60*60*1000))%(60*1000))/1000*1);
    
    if (dmin < 10) {
        dmin = '0' + dmin;
    }
    if (dsec < 10) {
        dsec = '0' + dsec;
    }
    
    $('#d').html(dday);
    $('#h').html(dhour);
    $('#m').html(dmin);
    $('#s').html(dsec);
    
    if (!(dday == 0 && dhour == 0 && dmin == 0 && dsec == 1)) {
        // loop the countdown after 1 sec
        theyear = yr;
        themonth = m;
        theday = d;
        setTimeout('countdown(theyear, themonth, theday)', 1000);
    } else {
        // exit the countdown
        return;
    }
}