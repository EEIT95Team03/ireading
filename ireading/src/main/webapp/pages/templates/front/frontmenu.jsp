<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>frontMenu</title>
</head>
<body>
 <header>
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header col-sm-12 col-md-4">        
                <a class="navbar-brand " href="#"><img src="<c:url value="/images/LOGO.png"/>" /></a>
                <button id="menubtn" type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"><span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                 </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" id="list">
                    <li class="active"><a href="#">享。找書<span class="sr-only">(current)</span></a></li>
                    <li><a href="#">享。賣書</a></li>
                    <li><a href="#">享。活動</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li id="login"><a id="loginlink"  class="show" href="" data-toggle="modal" data-target="#LoginBlock">享。登入</a>
                    			   <div id="memberlink" class="dropdown hidden">
  								   	  <a  class="btn btn-danger dropdown-toggle" 
  								   	  href="https://example.com" id="dropdownMenuLink" data-toggle="dropdown"
  								   	   aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-triangle-bottom"></a>

  								      <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    								     <div class="dropdown-item"><a href="#">會員中心</a></div>
    								     <div class="dropdown-divider"></div>
    					 			     <div class="dropdown-item"><a href="javascript:void(0)" onclick="loggout();">登出</a></div>
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
								<div id="loginmessgae" style="font-size: 16px; color: red" class="form-group"></div>

<!-- 								<div class="form-group text-center"> -->
<!-- 								<input type="checkbox" tabindex="3" class="" name="remember" id="remember"> <label for="remember"> Remember	Me</label> -->
<!-- 							</div> -->
							
							
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
										<button type="submit" id="loginbutton" class="form-control btn btn-login" name="loginaction" value="Login">享。登入</button>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-lg-12">
										<div class="text-center">
											<a href="#" tabindex="5" class="forgot-password">享。找密碼?</a>
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
							
							<div class="form-group">
								<div class="input-group">
									<input type="password" name="Rpwd" class="form-control" value="" placeholder="請輸入密碼">
									<label class="input-group-addon glyphicon glyphicon-lock"></label>
								</div>
							</div>
								
							<div class="form-group">
								<div class="input-group">
									<input type="password" name="Rconfirmpwd" class="form-control" value="" placeholder="請再次確認密碼">
									<label class="input-group-addon glyphicon glyphicon-lock"></label>
								</div>
							</div>
								
							
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
										<button type="submit" id="regbutton" class="form-control btn btn-login" name="loginaction" value="Register">享。註冊</button>
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
</body>
</html>