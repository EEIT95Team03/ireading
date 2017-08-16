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
<link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>
<body>

<c:import url="/pages/templates/front/frontmenu.jsp"></c:import>
<!-- 內容寫在這個區塊內 -->
<div class="container-fluid">
<h1>內容寫這</h1></div>
<c:import url="/pages/templates/front/frontfooter.jsp"></c:import>
</body>
<script>
	$(function() {
		//關掉彈跳視窗X的作用
		$('button[class="close"]').click(
				function(event) {
					event.preventDefault();
					$('#loginmessgae').addClass('hidden');
					$('#reg_account').addClass('hidden');
					$('#reg_pwd').addClass('hidden');
					$('#reg_confirmpwd').addClass('hidden');
					$('#accountcheck').addClass('hidden');
					clearForm();
				}
		)

		//忘記密碼連結
		$('#forgetlink').click(
				function (event) {
					event.preventDefault();
					$('#resetBlock').modal('toggle');
					$('#LoginBlock').modal('toggle');
				}
		)
		
		$('#resetPwdButton').click(
			function (event) {
				event.preventDefault();
				
				var data = $('#resetform').serialize();
				
				$.post('/ireading/browse/resetPwd.controller', data,
						function(data) {
							if(data[0].noaccount == 'noaccount'){
								$('#accountcheck').text("您還沒成為享閱人唷！請先加入享閱。");
								$('#accountcheck').removeClass('hidden');
								return;
							}
							
							$('#forgetlink').modal('toggle');
							console.log(data[0].mailResult);
							if(data[0].mailResult=='success'){
								$('#MailSentBlock').modal('toggle');
								$('#resetBlock').modal('toggle');
							}
							else{
								
							}
							return;
						})
			}
		)
		
		//關掉收到重設密碼的訊息
		$('#welcomeReg').click(
			function(event) {
				event.preventDefault();
				$('#MailSentBlock').modal('toggle');
			}
		)
		
		//登入按鈕作用
		$('#loginbutton').click(
				function(event) {
					event.preventDefault();
					if ($('#insertform').find("input[name='account']")
							.val() == ""
							|| $('#insertform').find("input[name='pwd']")
									.val() == "") {
						$('#loginmessgae').removeClass("hidden");
						$('#loginmessgae').addClass("show");
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
									clearForm();
									location.reload();
									return;
								}
								if (data[0].InvalidLogin == "帳號密碼不正確") {
									$('#loginmessgae').text(
											data[0].InvalidLogin);
									$('#loginmessgae').removeClass('hidden');
									return;
								}
							});

				});
		
		//帳號檢查
		$("input[name='Raccount']").blur(
			function (event) {
				event.preventDefault();
				if($("input[name='Raccount']").val()==""){
					$('#reg_account').removeClass("hidden");
					$('#reg_account').addClass("show");
					$('#reg_account').text("帳號不能空白唷");
				}
				else{
					$('#reg_account').removeClass("show");
					$('#reg_account').addClass("hidden");
					$('#reg_account').text("");
					
					var data = $('#register-form').serialize();
					
					$.post('/ireading/browse/login.controller/accountCheck', data,
							function (data) {
						console.log(data[0].AccountCheck);
						if(data[0].AccountCheck == "帳號已註冊"){
							$('#reg_account').removeClass("hidden");
							$('#reg_account').addClass("show");
							$('#reg_account').text("帳號已經被註冊了唷~");
						}
						else{
							$('#reg_account').removeClass("show");
							$('#reg_account').addClass("hidden");
							$('#reg_account').text("");
						}
					});	
				}
				return;
			})
			
		//密碼檢查	
		$("input[name='Rpwd']").blur(
			function (event) {
				event.preventDefault();
				if($("input[name='Rpwd']").val()==""){
					$('#reg_pwd').removeClass("hidden");
					$('#reg_pwd').addClass("show");
					$('#reg_pwd').text("密碼不能空白唷");
				}
				else{
					$('#reg_pwd').removeClass("show");
					$('#reg_pwd').addClass("hidden");
					$('#reg_pwd').text("");
				}
				return;
			})

		//密碼再次確認檢查
		$("input[name='Rconfirmpwd']").blur(
			function (event) {
				event.preventDefault();
//					console.log($("input[name='Rpwd']").val());
//					console.log($("input[name='Rconfirmpwd']").val());
//					console.log($("input[name='Rconfirmpwd']").val()!==$("input[name='Rpwd']").val());
				
				if(($("input[name='Rconfirmpwd']").val())!=($("input[name='Rpwd']").val())){
					$('#reg_confirmpwd').removeClass("hidden");
					$('#reg_confirmpwd').addClass("show");
					$('#reg_confirmpwd').text("請再次確認密碼唷");
				}
				else{
					$('#reg_confirmpwd').removeClass("show");
					$('#reg_confimrpwd').addClass("hidden");
					$('#reg_confirmpwd').text("");
				}
				return;
			})			
		
		
		//註冊按鈕送出作用
		$('#regbutton').click(
				function(event) {
					event.preventDefault();

					var data = $('#register-form').serialize();
					
					$.post('/ireading/browse/login.controller/reg', data,
							function(data) {
								if(data[0].RegMsg == "註冊失敗"){
									console.log("註冊失敗");
								}
								else if(data[0].RegMsg == "註冊成功"){
									console.log("註冊成功");
									$('#LoginBlock').modal('toggle');
									$('#ConfirmBlock').modal('show');
									$('#dropdownMenuLink').text(data[0].useraccount + "，日安！");
									location.reload();
								}
							});

				});
		
		//成功註冊確認畫面
		$('#welcomeReg').click(
				function (event) {
					$('#ConfirmBlock').modal('toggle');
					clearForm();
				}
		)
		
		//Cookie相關
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
		
		
	})
	

	function getCookie(cname) {
		var name = cname + "=";
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') {
				c = c.substring(1);
			}
			if (c.indexOf(name) == 0) {
				var cookieout = c.substring(name.length, c.length);
				return cookieout;
			}
		}
		return "";
	}

	function createCookie(name, value, days) {
		if (days) {
			var date = new Date();
			date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
			var expires = "; expires=" + date.toGMTString();
		} else
			var expires = "";
		document.cookie = name + "=" + value + expires + "; path=/";
	}

	function eraseCookie(name) {
		createCookie(name, "", -1);
	}

	function deleteCookie() {
		var cookies = document.cookie.split(";");
		for (var i = 0; i < cookies.length; i++)
			eraseCookie(cookies[i].split("=")[0]);
	}

	//登出
	function loggout() {
		var login_name = getCookie("login_name");
		$('#dropdownMenuLink').text("訪客，日安！");
		$('#memberlink').removeClass("hidden").addClass("hidden");
		$('#loginlink').removeClass().addClass("show");
		deleteCookie();
	}

	//清除表格
	function clearForm() {
		$('form :input').val('');
	}
</script>
</html>