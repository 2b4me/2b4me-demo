$(document).ready(function() {
    countdown(2012, 10, 9);
    
    $('.nyi').click(function(event){
       alert('not yet implemented');
       event.preventDefault();
    });
    
    $('#contest-signup-email-input').focus(function(event) {
        if ($('#contest-signup-email-input').val() == 'Enter Your Email Address') {
            $('#contest-signup-email-input').val('');
        }
        $('#contest-signup-email-input').removeClass("error");
    });
    
    $('#contest-signup-email-input').blur(function(event) {
        if ($('#contest-signup-email-input').val() == '') {
            $('#contest-signup-email-input').val('Enter Your Email Address');
        }
    });
    
    $('#contest-signup-zipCode-input').focus(function(event) {
        if ($('#contest-signup-zipCode-input').val() == 'Enter Your Zip Code') {
            $('#contest-signup-zipCode-input').val('');
        }
        $('#contest-signup-zipCode-input').removeClass("error");
    });
    
    $('#contest-signup-zipCode-input').blur(function(event) {
        if ($('#contest-signup-zipCode-input').val() == '') {
            $('#contest-signup-zipCode-input').val('Enter Your Zip Code');
        }
    });
    
    $('#contest-signup-submit-btn').click(function(event) {
        event.preventDefault();
        
        if ($('#contest-signup-submit-btn').attr('disabled')) {
            return;
        }
        
        $('#contest-signup-submit-btn').attr("disabled", "disabled");
        
        var email = $('#contest-signup-email-input').val();
        var zipCode = $('#contest-signup-zipCode-input').val();
        
        if (!emailCheck(email)) {
            alert('Email is not in the correct format. Please review and try again.');
            $('#contest-signup-submit-btn').removeAttr("disabled");
            return;
        }
        
        if (!/(^\d{5}$)|(^\d{5}-\d{4}$)/.test(zipCode)) {
            alert('Zip Code is not in the correct format. Please review and try again.');
            $('#contest-signup-submit-btn').removeAttr("disabled");
            return;
        }
        
        $.ajax('http://demo.2b4me.com/contest/signup', {
            data: {
                email: email,
                zipCode: zipCode
            }
        });
        
        // show success no matter what
        $("#emailSuccess").modal({
            keyboard: true
        });
    });
    
    $('#merchantSignupLink').click(function(event) {
        event.preventDefault();
        handleMerchantSignupLink(event);
    });
    
    $('#merchantSignupLinkHeader').click(function(event) {
       event.preventDefault();
       handleMerchantSignupLink(event);
    });

    $('#merchantSignupForm div input').tooltip({
        placement: 'right',
        title: 'Can\'t be blank',
        trigger: 'manual'
       });

       $('#merchantContactName input').focus(function(event) {
           $('#merchantContactName input').tooltip('hide');
           $('#merchantContactName').removeClass("error");
       });

       $('#merchantCompanyName input').focus(function(event) {
           $('#merchantCompanyName input').tooltip('hide');
           $('#merchantCompanyName').removeClass("error");
       });
       
       $('#merchantContactInfo input').focus(function(event) {
           $('#merchantContactInfo input').tooltip('hide');
           $('#merchantContactInfo').removeClass("error");
       });
       
       $('#merchantBusiness input').focus(function(event) {
           $('#merchantBusiness input').tooltip('hide');
           $('#merchantBusiness').removeClass("error");
       });
       
       $('#merchantBusiness input').keypress(function(event) {
           if (event.which == 13) {
               $('#merchantSubmit').trigger('click');
           }
       });
    
    $('#merchantSubmit').click(function(event) {
        event.preventDefault();
        
        if ($('#merchantSubmit').attr('disabled')) {
            return;
        }
        
        $('#merchantSubmit').attr("disabled", "disabled");
        
        var merchantName = $('#merchantContactName input').val();
        var merchantCompany = $('#merchantCompanyName input').val();
        var merchantContactInfo = $('#merchantContactInfo input').val();
        var merchantBusinessType = $('#merchantBusiness input').val();
        
        var valid = true;
        
        if (merchantName == '') {
            valid = false;
            $('#merchantContactName').addClass("error");
            $('#merchantContactName input').tooltip('show');
        }
        
        if (merchantCompany == '') {
            valid = false;
            $('#merchantCompanyName').addClass("error");
            $('#merchantCompanyName input').tooltip('show');
        }
        
        if (merchantContactInfo == '') {
            valid = false;
            $('#merchantContactInfo').addClass("error");
            $('#merchantContactInfo input').tooltip('show');
        }
        
        if (merchantBusinessType == '') {
            valid = false;
            $('#merchantBusiness').addClass("error");
            $('#merchantBusiness input').tooltip('show');
        }
        
        if (!valid) {
            $('#merchantSubmit').removeAttr("disabled");
            return;
        }
        
        var dataString = 'merchantContactName='+merchantName+'&merchantCompanyName='+merchantCompany+'&merchantContactInfo='+merchantContactInfo+'&merchantTypeOfBusiness='+merchantBusinessType;
        $.ajax({
            type: "POST",
            url: "http://2b4me.com/cgi-bin/FormMail.merchantsignup.pl",
            data: dataString,
            success: function() {
                $('#merchantCancel').fadeOut();
                $('#merchantSubmit').fadeOut();
                $('#merchantSignupCopy').fadeOut();
                $('#merchantSignupForm').fadeOut(400, function() {
                    $('#merchantThankYou').fadeIn();
                    $('#merchantClose').fadeIn();
                    setTimeout(function() {
                        $("#merchantSignup").modal('hide');
                    }, 3000);
                });
            },
            error: function(request, status, err) {
                /*
                $('#merchantSignup div span.help-inline').fadeIn();
                setTimeout(function(){
                    $('#merchantSignup div span.help-inline').fadeOut(400, function() {
                        $('#merchantSubmit').removeAttr("disabled");
                    });
                }, 6000);
                return;
                 */
                // happy path all the time!!!!!!! NO MORE ERRRORRRS
                $('#merchantCancel').fadeOut();
                $('#merchantSubmit').fadeOut();
                $('#merchantSignupCopy').fadeOut();
                $('#merchantSignupForm').fadeOut(400, function() {
                    $('#merchantThankYou').fadeIn();
                    $('#merchantClose').fadeIn();
                    setTimeout(function() {
                        $("#merchantSignup").modal('hide');
                    }, 3000);
                });
            }
        });
        
    });
    
    $('#show-winners').click(function(event) {
        event.preventDefault();
        $('#previous-winners').slideDown();
        $('#show-winners').fadeOut(function(e) {
            $('#hide-winners').fadeIn();
        });
    });
    
    $('#hide-winners').click(function(event) {
        event.preventDefault();
        $('#previous-winners').slideUp();
        $('#hide-winners').fadeOut(function(e) {
            $('#show-winners').fadeIn();
        });
    });
    
    $('#hide-winners2').click(function(event) {
        event.preventDefault();
        $('#previous-winners').slideUp();
        $('#hide-winners').fadeOut(function(e) {
            $('#show-winners').fadeIn();
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

function zipCodeCheck(zipCodeStr) {
    
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
    
    $('#d2').html(dday); if (dday == 1) { $('#d2desc').html('DAY'); }
    $('#h2').html(dhour);
    $('#m2').html(dmin);
    $('#s2').html(dsec);
    
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

function handleMerchantSignupLink(event) {
    $("#merchantSignup").modal({
        keyboard: true
    });
}