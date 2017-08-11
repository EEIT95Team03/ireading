<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱-ireading</title>

<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
 <link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<style type="text/css">
.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
}
.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align:center;
}
.panel-login>.panel-heading a{
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login>.panel-heading a.active{
	color: #029f5b;
	font-size: 18px;
}
.panel-login>.panel-heading hr{
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
}
.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login input:hover,
.panel-login input:focus {
	outline:none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}
.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}
.btn-login:hover,
.btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}
.forgot-password {
	text-decoration: underline;
	color: #888;
}
.forgot-password:hover,
.forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.btn-register {
	background-color: #1CB94E;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}
.btn-register:hover,
.btn-register:focus {
	color: #fff;
	background-color: #1CA347;
	border-color: #1CA347;
}


#login a {
	width: 220px;
	height: 70px;
	line-height: 60px;
	font-size: 24px;
	text-align: center;	

	margin-top: 30px;
	margin-bottom: 20px;
	margin-left: 10px;
}

#login a:hover {

}

.fade{
	padding-top:250px;
}

.modal-dialog {
	width: 600px;
}

.modal-footer {
	height: 90px;
	margin: 0;
}

.modal-footer .btn {
	font-weight: bold;
}

.modal-footer .progress {
	display: none;
	height: 32px;
	margin: 0;
}

.input-group-addon {
	color: #fff;
	background: #3276B1;
}

.input-group-addon.glyphicon {
	font-size: 20px;
	background-color: #80beb0;
}

.form-control.btn {
	font-weight: 300;
	color: white;
	height: 50px;
	font-size: 18px;
	background-color: #80beb0;
}

.modal-title{
	font-weight:500;
	color:#808080;
}

.progress-bar{
	background-color:#808080;
}

.input-group input{
font-size: 20px;
margin-bottom:20px;
}

#loginlink{
	border-radius:15px;
	color: rgb(255, 255, 255);
	border: 3px solid rgba(255, 255, 255, 0.9);
	background-color: rgba(255, 255, 255, 0.3);
	border-radius: 15px;
}

#loginlink:HOVER{
	background-color: rgba(217, 217, 217, 0.2);
}

#dropdownMenuLink{
	border-radius:15px;
	border: 3px solid rgba(255, 255, 255, 0.9);
	background-color: rgba(255, 255, 255, 0.3);
}

#dropdownMenuLink:HOVER{
	background-color: rgba(217, 217, 217, 0.2);
}

.dropdown-menu{
text-align:center;
width:220px;
background-color: rgb(217,217,217);
}

.dropdown-item{
background-color: rgb(217,217,217);
}

.dropdown-item:hover{
background-color: white;
}

.dropdown-item a{
color:#80beb0;
text-decoration: none;
border: none;
}

</style>

</head>
<body>
<c:import url="/pages/templates/front/frontmenu.jsp"></c:import>
<!-- 內容寫在這個區塊內 -->
<div class="container-fluid">
<h1>內容寫這</h1></div>
<c:import url="/pages/templates/front/frontfooter.jsp"></c:import>
</body>
<script type="text/javascript">

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
</script>


</html>