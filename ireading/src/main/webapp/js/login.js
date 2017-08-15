function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
        	var cookieout = c.substring(name.length, c.length); 
//         	console.log(cookieout);
            return cookieout;
        }
    }
    return "";
}

function createCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
}

function eraseCookie(name) {
    createCookie(name,"",-1);
}

function deleteCookie() {
	var cookies = document.cookie.split(";");
	for (var i = 0; i < cookies.length; i++)
	  eraseCookie(cookies[i].split("=")[0]);
}

function loggout() {
	var login_name = getCookie("login_name");
	$('#dropdownMenuLink').text("訪客，日安！");				
	$('#memberlink').removeClass("hidden").addClass("hidden");
	$('#loginlink').removeClass().addClass("show");
	deleteCookie();
// 	console.log(document.cookie);
}


$(function() {
	
	var cookievalue = getCookie("login_id");
	
	if(cookievalue){
		console.log("has logged in");
		$('#loginlink').removeClass().addClass("hidden");
		$('#memberlink').removeClass("hidden").addClass("show");
		var login_name = getCookie("login_name");
		if(login_name){
			$('#dropdownMenuLink').text(login_name + "，日安！");				
		}
		else{
			var temp = getCookie("login_account");
			var n = temp.indexOf("@");	
			$('#dropdownMenuLink').text(temp.substr(0,n) + "，日安！");
		}
		
	}
	

    $('#insertform-link').click(function(e) {
		$("#insertform").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#insertform").fadeOut(100);
		$('#insertform-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});

	
	$('#loginbutton').click(
			function(event) {
				event.preventDefault();
				if ($('#insertform').find("input[name='account']")
						.val() == ""
						|| $('#insertform').find("input[name='pwd']")
								.val() == "") {

					$('#loginmessgae').text("帳號密碼不能為空白");
					return;
				}

				var data = $('#insertform').serialize();
				$.post('/ireading/browse/login.controller', data,
						function(data) {
							if(data[0].LoginSuccess == "帳號密碼正確"){
								$('#LoginBlock').modal('toggle');
								$('#loginlink').removeClass().addClass("hidden");
								$('#memberlink').removeClass("hidden").addClass("show");
								if(data[0].username){
									$('#dropdownMenuLink').text(data[0].username + "，日安！");
								}
								else if(data[0].useraccount){
									$('#dropdownMenuLink').text(data[0].useraccount + "，日安！");
								}
								else{
									$('#dropdownMenuLink').text("享閱人，日安！");
								}
								return;
							}
							if (data[0].InvalidLogin == "帳號密碼不正確") {
								$('#loginmessgae').text(
										data[0].InvalidLogin);
								return;
							}
						});

			});
	
});