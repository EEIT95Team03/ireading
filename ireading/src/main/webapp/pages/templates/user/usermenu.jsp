<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://malsup.github.com/jquery.form.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>usermenu</title>
</head>
<body>
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header col-sm-12 col-md-3" style="z-index: 100">
                <a class="navbar-brand " href="/ireading/"><img src="<c:url value="/images/LOGO.png"/>" /></a>
                 </div>
             <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" id="list">
                    <li class="active"><a href="<c:url value="/browse/searchBooks.controller/searchBooksList?search="/>">享。找書<span class="sr-only">(current)</span></a></li>
                    <li><a  href="javascript:void(0)" onclick="sellbook()" >享。賣書</a></li>
                    <li><a href="<c:url value="/browse/joinevent.controller/joinEventList"/>">享。活動</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li id="login"><a id="loginlink"  class="show" href="" data-toggle="modal" data-target="#LoginBlock">享。登入</a>
                    			   <div id="memberlink" class="dropdown hidden">
  								   	  <a  class="btn btn-danger dropdown-toggle" 
  								   	  href="#" id="dropdownMenuLink" data-toggle="dropdown"
  								   	   aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-triangle-bottom"></a>

  								      <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    								     <div class="dropdown-item"><a href="<c:url value="/pages/user/userhome.jsp"/>" style="display: block;margin: 0px">會員中心</a></div>
    								     <div class="dropdown-divider"></div>
    					 			     <div class="dropdown-item"><a href="javascript:void(0)" style="display: block;margin:0px" onclick="loggout();">登出</a></div>
  								      </div>
								   </div>           
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</header>
<!--以下為登入彈跳視窗 -->
	<div id="logindiv">
	
	<div class="modal fade" id="LoginBlock" tabindex="-1" role="dialog"	aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="panel-login">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
						<h3 class="modal-title" id="LoginTitle">享受。閱讀</h3>
					</div>
				<!-- 切換Tag -->
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-6">
							<a href="#" class="active" id="insertform-link">享。登入</a>
						</div>
						<div class="col-xs-6">
							<a href="#" id="register-form-link">享。加入</a>
						</div>
					</div>
					<hr>
				</div>
				<!-- 切換Tag結束 -->
				<div class="panel-body">
					<div class="col-lg-12">
						<!--登入表格 -->
						<form id="insertform">
								<div class="form-group">
									<div class="input-group">
										<input type="text" name="account" class="form-control" value="" placeholder="請輸入電子郵件">
										<label class="input-group-addon glyphicon glyphicon-envelope"></label>
									</div>
								</div>

								<div class="form-group">
									<div class="input-group">
										<input type="password" name="pwd" class="form-control" value="" placeholder="請輸入密碼">
										<label class="input-group-addon glyphicon glyphicon-lock"></label>
									</div>
								</div>
								<div id="loginmessgae" class="alert alert-danger hidden" role="alert"></div>

<!-- 								<div class="form-group text-center"> -->
<!-- 								<input type="checkbox" tabindex="3" class="" name="remember" id="remember"> <label for="remember"> Remember	Me</label> -->
<!-- 							</div> -->
							
							
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
										<button type="submit" id="loginbutton" class="form-control btn btn-login" name="loginaction" value="Login">登入</button>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-lg-12">
										<div class="text-center">
											<a id="forgetlink" href="#" tabindex="5" class="forgot-password">享。找密碼?</a>
										</div>
									</div>
								</div>
							</div>
						</form>
						
						<!--註冊表格 -->
						<form id="register-form" style="display: none;">
							<div class="form-group">
								<div class="input-group">
									<input type="text" name="Raccount" class="form-control" value="" placeholder="請輸入電子郵件">
									<label class="input-group-addon glyphicon glyphicon-envelope"></label>
								</div>
							</div>
							<div id="reg_account" class="alert alert-danger hidden" role="alert"></div>
							
							<div class="form-group">
								<div class="input-group">
									<input type="password" name="Rpwd" class="form-control" value="" placeholder="請輸入密碼">
									<label class="input-group-addon glyphicon glyphicon-lock"></label>
								</div>
							</div>
							<div id="reg_pwd" class="alert alert-danger hidden" role="alert"></div>
								
							<div class="form-group">
								<div class="input-group">
									<input type="password" name="Rconfirmpwd" class="form-control" value="" placeholder="請再次確認密碼">
									<label class="input-group-addon glyphicon glyphicon-lock"></label>
								</div>
							</div>
							<div id="reg_confirmpwd" class="alert alert-danger hidden" role="alert"></div>
							
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
										<button id="regbutton" class="form-control btn btn-login" name="memaction" value="Insert">快速註冊</button>
									</div>
								</div>
							</div>
							
						</form>
					</div>
				</div>
				
				</div>
			</div>
		</div>
	</div>
	
	<!--新會員確認畫面 -->
	<div class="modal fade" id="ConfirmBlock" tabindex="-1" role="dialog"	aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="panel-login">
					<div class="panel-body">
						<div>
							<h3 class="modal-title">歡迎加入享。閱</h3>
							<div>
								<button id="welcomeReg" class="btn" style="background-color:#80beb0 ; color: white">確定。</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 重設密碼發送至郵件 -->
	<div class="modal fade" id="resetBlock" tabindex="-1" role="dialog"	aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="panel-login">
					<div class="panel-body">
						<form id='resetform'>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
							<h3 class="modal-title" style="margin-bottom: 10px">享。找密碼</h3>
							<h5 class="modal-title" style="color: red;margin-bottom: 20px">請輸入您註冊時所使用的電子郵件，我們將發送給您一組系統重設的密碼：</h5>
							<div>
								<div class="form-group" style="margin-bottom: 30px">
									<div class="input-group">
										<input type="text" name="recipient" class="form-control" value="" placeholder="請輸入電子郵件">
										<label class="input-group-addon glyphicon glyphicon-envelope"></label>
									</div>
								</div>
								
								<div id="accountcheck" class="alert alert-danger hidden" role="alert"></div>
								
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<button type="submit" id="resetPwdButton" class="form-control btn btn-login">發送</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--密碼發送確認畫面 -->
	<div class="modal fade" id="MailSentBlock" tabindex="-1" role="dialog"	aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="panel-login">
					<div class="panel-body">
						<div>
							<h3 class="modal-title" style="margin-bottom: 20px">密碼已重設！</h3>
							<h5 class="modal-title" style="margin-bottom: 20px">請至您的電子郵件信箱領取新密碼，並用新密碼登入</h5>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
										<button id="welcomeReg" data-dismiss="modal" aria-hidden="true" class="btn" style="background-color:#80beb0 ; color: white">好的，收到。</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>


	<div id="wrapper">
		<div class="overlay"></div>

		<!-- Sidebar -->
		<nav class="navbar navbar-inverse navbar-fixed-top"
			id="sidebar-wrapper" role="navigation">
		<div></div>
		<ul class="nav sidebar-nav">
			<!--<li class="sidebar-brand">-->
			<div class="container-fluid" style="text-align: center; background-color: lightgray; padding: 5%; border-bottom-left-radius: 50px; border-bottom-right-radius: 50px; margin-bottom: 20px;">
				<h1 id="sideUserName" style="color: white; font-family: 微軟正黑體; font-weight: 700;">享。閱人</h1>
				<div style="margin: 25px">
					<img id="sideUserPic" src="" alt="username" class="img-circle img-responsive"
						style="background-color: white; margin: auto; border: 8px solid #efefef; box-shadow: 2px 2px 5px gray; width: 220px; height: 220px">
				</div>
				<a class="btn" style='background-color: #80beb0;color:white' href='/ireading/pages/user/member_user.jsp'
					style="font-family: 微軟正黑體; font-weight: 500;">
					<span class="glyphicon glyphicon-pencil"></span>&nbsp;個人資料
				</a>
			</div>
			<li><a href="<c:url value="/user/myorder/getOrders"/>">
				<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;我的訂單</a></li>
			<li><a href="<c:url value="/user/account"/>">
				<span class="glyphicon glyphicon-credit-card"></span>&nbsp;我的帳戶</a></li>
			<li><a href="<c:url value="/pages/user/ApplyToSell.jsp"/>">
				<span class="glyphicon glyphicon-tags"></span>&nbsp;申請賣書</a></li>
			<li><a href="<c:url value="/user/product/sellBook"/>">
				<span class="glyphicon glyphicon-home"></span>&nbsp;我的書店</a></li>
			<li><a href="<c:url value='/user/bookcase'/>">
				<span class="glyphicon glyphicon-book"></span>&nbsp;我的書櫃</a></li>
			<li><a href="<c:url value='/user/review.controller/getReview'/>">
				<span class="glyphicon glyphicon-comment"></span>&nbsp;我的書評</a></li>
			<li><a href="<c:url value="/user/joinevent.controller/myEventList"/>">
				<span class="glyphicon glyphicon-calendar"></span>&nbsp;我的活動</a></li>
		</ul>
		</nav>
		<!-- /#sidebar-wrapper -->
                <!-- Page Content -->
        <div id="page-content-wrapper">
            <button type="button" class="hamburger is-closed" data-toggle="offcanvas">
                <span class="hamb-top"></span>
    			<span class="hamb-middle"></span>
				<span class="hamb-bottom"></span>
            </button>
            <div id="content_block" class="container">
                <div class="row">
                
                
                
       
    </div>
</body>
<script type="text/javascript">
$(function() {
	var memberID = getCookie('login_id');
// 	var memberID = 'M170000029';
	
	$.ajax({
	    type: 'POST',
	    url: '/ireading/user/member.controller/ShowRepost',
	    data: {
	        'memberID':memberID
	    },
	    success: function(json){
	    	if(json[0].NickName!=""){
	    		$('#sideUserName').text(json[0].NickName);	
	    	}
	    	else if(json[0].MName!=""){
	    		$('#sideUserName').text(json[0].MName);	
	    	}
	    	else if(json[0].Account!=""){
	    		var temp = json[0].Account;
	    		var n = temp.indexOf('@');
	    		$('#sideUserName').text(temp.substr(0,n));	
	    	}
	    	else{
	    		$('#sideUserName').text('享。閱人');
	    	}
	    	
	    	if(json[0].Photo!= undefined){
	    		$('#sideUserPic').attr('src', "data:image/png;base64 ," + json[0].Photo).attr('width','100%');	
	    	}
	    	else{
	    		$('#sideUserPic').attr('src', "/ireading/images/MEMPHOTO.png").attr('width','100%');
	    	}
	    }
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
</script>
</html>