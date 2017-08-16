<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>
<style type="text/css">
body {
	font-family: 微軟正黑體;
	background-color: #444;
	background-image: url("/ireading/images/RESET.jpg");
	background-repeat:none;
	background-size:138%;
	z-index:-1;
	background-color: #444;
}

.form-signin input[type="text"] {
	margin-bottom: 5px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.form-signin .form-control {
	position: relative;
	font-size: 16px;
	font-family: 'Open Sans', Arial, Helvetica, sans-serif;
	height: auto;
	padding: 10px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.vertical-offset-100 {
	padding-top: 100px;
}

.img-responsive {
	display: block;
	max-width: 100%;
	height: auto;
	margin: auto;
}

.panel {
	margin-bottom: 20px;
	background-color: rgba(255, 255, 255, 0.75);
	border: 1px solid transparent;
	border-radius: 4px;
	-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}
.alert {
  padding: 15px;
  margin-bottom: 20px;
  border: 1px solid transparent;
  border-radius: 4px;
}
.alert h4 {
  margin-top: 0;
  color: inherit;
}
.alert .alert-link {
  font-weight: bold;
}
.alert > p,
.alert > ul {
  margin-bottom: 0;
}
.alert > p + p {
  margin-top: 5px;
}
.alert-dismissable {
  padding-right: 35px;
}
.alert-dismissable .close {
  position: relative;
  top: -2px;
  right: -21px;
  color: inherit;
}
.alert-success {
  background-color: #dff0d8;
  border-color: #d6e9c6;
  color: #468847;
}
.alert-success hr {
  border-top-color: #c9e2b3;
}
.alert-success .alert-link {
  color: #356635;
}
.alert-info {
  background-color: #d9edf7;
  border-color: #bce8f1;
  color: #3a87ad;
}
.alert-info hr {
  border-top-color: #a6e1ec;
}
.alert-info .alert-link {
  color: #2d6987;
}
.alert-warning {
  background-color: #fcf8e3;
  border-color: #fbeed5;
  color: #c09853;
}
.alert-warning hr {
  border-top-color: #f8e5be;
}
.alert-warning .alert-link {
  color: #a47e3c;
}
.alert-danger {
  background-color: #f2dede;
  border-color: #eed3d7;
  color: #b94a48;
}
.alert-danger hr {
  border-top-color: #e6c1c7;
}
.alert-danger .alert-link {
  color: #953b39;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<!--jQuery-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--jQuery UI-->
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/pages/templates/front/frontmenu.jsp"></c:import>
         <div class="container" style="margin-bottom: 142px">
             <div class="row vertical-offset-100">
                 <div class="col-md-4 col-md-offset-4">
                     <div class="panel panel-default">
                         <div class="panel-heading">                                
                             <div class="row-fluid user-row">
                                 <img src="https://apps.openerp.com/apps/module_image?image_id=1270776" style="width:35%" class="img-responsive" alt="Conxole Admin"/>
                             </div>
                         </div>
                         <div class="panel-body">
                             <form  id="resetForm" action="<c:url value='/browse/resetPwd.controller/pwdReset'/>" accept-charset="UTF-8" role="form" class="form-signin" method="post">
                                 <fieldset>
                                     <label class="panel-login"></label>
                                     	<div id="errmsg" class="alert alert-danger hidden" role="alert" style="font-family: 微軟正黑體"></div>
                                     		<input class="form-control hidden" placeholder="請輸入您的新密碼" id="account" name="account"  value="${account}" type="text" style="font-family: 微軟正黑體">
                                     		<input class="form-control" placeholder="請輸入您的新密碼" id="pwd" name="pwd" type="password" style="font-family: 微軟正黑體">
                                     		<input class="form-control" placeholder="請再次確認您的密碼" id="confirmpwd" name="confirmpwd" type="password" style="font-family: 微軟正黑體">
                                     	<br></br>
                                     		<button class="btn btn-lg btn-success btn-block" type="submit" id="reset" name="reset" value="reset">確認重設 »</button>
                                 </fieldset>
                             </form>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
         <script type="text/javascript">
         $(function() {
//         	 $('#reset').submit(
//         		function(event) {
//         			event.preventDefault();
        			 
//             		var data = $('#resetForm').serialize();
            		
//             		$.post('/ireading/browse/resetPwd.controller/pwdReset', data,
//             			function(data) {
    						
//     					})		
        			
// 				}   
//         	 )
        	 
        	 
        	 
        	 $('#confirmpwd').blur(
        			function(event) {
        				event.preventDefault();
        				if(($("#pwd").val())!=($("#confirmpwd").val())){
    						$('#errmsg').removeClass("hidden");
    						$('#errmsg').addClass("show");
    						$('#errmsg').text("請再次確認密碼唷！！");
    					}
    					else{
    						$('#errmsg').removeClass("show");
    						$('#errmsg').addClass("hidden");
    						$('#errmsg').text("");
    					}
    					return;
						
					}
        	
        	);
        	 
         })
         
         </script>
         <c:import url="/pages/templates/front/frontfooter.jsp"></c:import>
</body>
</html>