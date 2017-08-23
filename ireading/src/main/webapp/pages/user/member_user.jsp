<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心</title>

   <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">  
    <!--jQuery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <script src="http://malsup.github.com/jquery.form.js"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
  <script src="<c:url value="/js/jquery.tablesorter.js"/>"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    
     <style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Oswald:400,300);
@import url(https://fonts.googleapis.com/css?family=Open+Sans);

*{
    margin: 0;
	padding: 0;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
#content_block{
background-color: rgba(128, 190, 176, 0.81);;
border-radius: 15px;
}


.iamgurdeep-pic {
    position: relative;
}
.username {
    bottom: 0;
    color: #ffffff;
    padding: 30px 15px 4px;
    position: absolute;
    width: 100%;
    text-shadow: 1px 1px 2px #000000;
    
background: -moz-linear-gradient(top, rgba(0,0,0,0) 0%, #2d2c41 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, rgba(0,0,0,0) 0%, #2d2c41 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, rgba(0,0,0,0) 0%, #2d2c41 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#a64d4d4d',GradientType=0 ); /* IE6-9 */
}
.iamgurdeeposahan {
    border-radius: 4px 4px 0 0;
}
.username > h2 {
    font-family: 微軟正黑體;
    font-size: 27px;
    font-weight: lighter;
    margin: 31px 0 4px;
    position: relative;
    text-shadow: 1px 1px 2px #000000;
    text-transform: uppercase;
}
.username > h2 small {
    color: #ffffff;
    font-family: 微軟正黑體;
    font-size: 13px;
    font-weight: 400;
    position: relative;
}
.username .fa{
    color: #ffffff;
    font-size: 14px;
    margin: 0 0 0 4px;
    position: static;
}
.edit-pic a {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    border: 1px solid #ffffff;
    border-radius: 50%;
    color: #ffffff;
    font-size: 21px;
    height: 39px;
    line-height: 38px;
    margin: 8px;
    text-align: center;
    width: 39px;
    -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
	transition: all 0.4s ease;
    text-decoration: none !important;
     display: list-item;
     background-color: rgba(255, 255, 255, 0.1)
}
.edit-pic a:hover {
   font-size: 17px;
   opacity: 0.9;
  }
.edit-pic a:focus {
   background:#b63b4d;
    color: #fff;
    border: 1px solid #b63b4d;
}
a:focus {
    outline: none;
    outline-offset: 0px;
}
.edit-pic {
    position: absolute;
    right: 0;
    top: 0;
    opacity: 0;
    -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    transition: all 0.4s ease;
}
.tags {
    background: rgba(255, 255, 255, 0.1) none repeat scroll 0 0;
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 2px;
    display: inline-block;
    font-size: 13px;
    margin: 4px 0 0;
    padding: 2px 5px;
     -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    transition: all 0.4s ease;
}
.tags:hover {
    background: rgba(255, 255, 255, 0.3) none repeat scroll 0 0;
    border: 1px solid rgba(255, 255, 255, 0.5);
    border-radius: 2px;
    display: inline-block;
    font-size: 13px;
    margin: 4px 0 0;
    padding: 2px 5px;
}
#accordion:hover .edit-pic {
    opacity: unset;
    -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    transition: all 0.4s ease;
}


.btn-o {
    
    background-color: rgba(255, 255, 255, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.5);
    border-radius: 2px;
    color: #ffffff !important;
    display: inline-block;
    font-family: 微軟正黑體;
    font-size: 15px !important;
    font-weight: normal !important;
    margin: 0 0 10px;
    padding: 5px 11px;
    text-decoration: none !important;
    text-transform: uppercase;
    
   background-color: rgba(255, 255, 255, 0.1);
    -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    transition: all 0.4s ease;
}
.btn-o:hover {
  background-color: rgba(255, 255, 255, 0.4);
    color: #fff !important;
  }
.btn-o:focus {
   background:#b63b4d;
    color: #fff;
    border: 1px solid #b63b4d;
}
.submenu .iamgurdeeposahan {
    background: rgba(255, 255, 255, 0.1) none repeat scroll 0 0 !important;
    border-radius: 50%;
    height: 60px;
    padding: 2px;
    width: 60px;
}
.photosgurdeep > a {
    background: #ffffff none repeat scroll 0 0;
    border-radius: 50%;
    display: inline-block !important;
    padding: 0 !important;
}
.view-all {
    background: rgba(255, 255, 255, 0.1) none repeat scroll 0 0 !important;
    border: 1px solid;
    float: right;
    font-family: 微軟正黑體;
    font-size: 26px;
    height: 60px;
    line-height: 61px;
    text-align: center;
    width: 60px;
}
.photosgurdeep {
    padding: 10px 9px 4px 35px;
}
ul {
	list-style-type: none;
}

a {
	color: pink;
	text-decoration: none;
}

/** =======================
 * Contenedor Principal
 ===========================*/
h1 {
 	color: #FFF;
 	font-size: 24px;
 	font-weight: 400;
 	text-align: center;
 	margin-top: 40px;
 }

h1 a {
 	color: #c12c42;
 	font-size: 16px;
 }

 .accordion {
 	width: 100%;
 	max-width: 360px;
 	margin: 30px auto 20px;
 	background: #FFF;
 	-webkit-border-radius: 4px;
 	-moz-border-radius: 4px;
 	border-radius: 4px;
 }

.accordion .link {
	cursor: pointer;
	display: block;
	padding: 15px 15px 15px 42px;
	color: #4D4D4D;
	font-size: 14px;
	font-weight: 700;
	border-bottom: 1px solid #CCC;
	position: relative;
	-webkit-transition: all 0.4s ease;
	-o-transition: all 0.4s ease;
	transition: all 0.4s ease;
}

.accordion li:last-child .link {
	border-bottom: 0;
}

.accordion li i {
	position: absolute;
	top: 16px;
	left: 12px;
	font-size: 18px;
	color: #595959;
	-webkit-transition: all 0.4s ease;
	-o-transition: all 0.4s ease;
	transition: all 0.4s ease;
}

.accordion li i.fa-chevron-down {
	right: 12px;
	left: auto;
	font-size: 16px;
}

.accordion li.open .link {
	color: #b63b4d;
}

.accordion li.open i {
	color: #b63b4d;
}
.accordion li.open i.fa-chevron-down {
	-webkit-transform: rotate(180deg);
	-ms-transform: rotate(180deg);
	-o-transform: rotate(180deg);
	transform: rotate(180deg);
}

.accordion li.default .submenu {display: block;}
/**
 * Submenu
 -----------------------------*/
 .submenu {
 	display: none;
 	background: lightgray;
 	font-size: 16px;
 }

 .submenu li {
 	border-bottom: 1px solid white;
 }

 .submenu a {
 	font-size:14px;
 	display: block;
 	text-decoration: none;
 	color: #29bc95;
 	padding: 12px;
 	padding-left: 42px;
 	-webkit-transition: all 0.25s ease;
 	-o-transition: all 0.25s ease;
 	transition: all 0.25s ease;
 }

 .submenu a:hover {
 	background: pink;
 	color: #FFF;
 }
 
.nav.navbar-nav .dropdown-toggle {
    padding: 0 !important;
}

.dropdown-toggle span {
    background: rgba(255, 255, 255, 0.1) none repeat scroll 0 0;
    border: 1px solid rgba(255, 255, 255, 0.5);
    border-radius: 50px;
    font-size: 23px !important;
    height: 38px;
    line-height: 40px;
/*     margin: 0 !important; */
    padding: 0 !important;
    text-align: center;
    width: 38px;
    text-shadow:none !important;
}

#content .nav.navbar-nav {
    bottom: 10px;
    position: absolute;
    right: 12px;
    transition: all 0.4s ease 0s;
}

.navbar-nav > li > .dropdown-menu {
	background-color:#ffdddd;
    border-radius: 5px !important;
    margin-top: 10px;
    min-width: 101px;
    padding: 0;
}
.navbar-nav > li > .dropdown-menu li a {
    color: #333333 !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    text-align: right !important;
    text-shadow:none !important;
}
.dropdown-toggle {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0 !important;
    font-size: 15px !important;
}

.dropdown {
  -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    transition: all 0.4s ease;
}
.dropdown-menu>li>a {
    color:#428bca;
    -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    transition: all 0.4s ease;
}
.dropdown ul.dropdown-menu {
    border-radius:4px;
    box-shadow:none;
}
.dropdown ul.dropdown-menu:before {
    content: "";
    border-bottom: 10px solid #fff;
    border-right: 10px solid transparent;
    border-left: 10px solid transparent;
    position: absolute;
    top: -8px;
    right: 8px;
    z-index: 10;
}
</style>
     <script type="text/javascript">
$(function() {
    var Accordion = function(el, multiple) {
		this.el = el || {};
		this.multiple = multiple || false;

		// Variables privadas
		var links = this.el.find('.link');
		// Evento
		links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
	}

	Accordion.prototype.dropdown = function(e) {
		var $el = e.data.el;
			$this = $(this),
			$next = $this.next();

		$next.slideToggle();
		$this.parent().toggleClass('open');

		if (!e.data.multiple) {
			$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
		};
	}	

	var accordion = new Accordion($('#accordion'), false);
});
</script>
<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">
     <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>
<body>
 <c:import url="/pages/templates/user/usermenu.jsp"></c:import>

  <div  class="col-lg-11" style="padding-bottom: 50px;">
                 <!--    內容寫這 -->                  
  <div id="content" class="container">
	<div class="row">
		<h1 srtyle="font-weight:800;">享。閱人&nbsp;專屬會員資料管理</h1>
    	<h4 style="text-align: center; color:#f1f1f1; margin-top:10px;">您好，享閱人。歡迎您加入享。閱&nbsp;以下為您的個人資料</h4>
		<!-- Contenedor -->
		<ul id="accordion" class="accordion">
    		<li>
				<div class="col col_4 iamgurdeep-pic">
					<img id='Photo' class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src=''/>
						<div class="edit-pic">
							<a href="https://www.facebook.com/SexyZone-Fanclub-115270245253205/?fref=ts" target="_blank" class="fa fa-facebook"></a>
<!-- 							<a href="https://www.instagram.com/gurdeeposahan/" target="_blank" class="fa fa-instagram"></a> -->
							<a href="https://twitter.com/win_sz_info" target="_blank" class="fa fa-twitter"></a>
<!-- 							<a href="https://plus.google.com/u/0/105032594920038016998" target="_blank" class="fa fa-google"></a> -->
						</div>
						<div class="username">
    						<h2 id='MName'></h2>
<!-- 						    <p><i class="fa fa-briefcase"></i> Web Design and Development.</p> -->
<!--     						<a href="https://web.facebook.com/iamgurdeeposahan" target="_blank" class="btn-o"> <i class="fa fa-user-plus"></i> Add Friend </a> -->
<!--     						<a href="https://www.instagram.com/gurdeeposahan/" target="_blank"  class="btn-o"> <i class="fa fa-plus"></i> Follow </a> -->

     							<ul class="nav navbar-nav">
        							<li class="dropdown">
          								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span style="margin-top: 100px" class="fa fa-ellipsis-v pull-right"></span></a>
          								<ul class="dropdown-menu pull-right">
            								<li><a href="javascript:void(0)" onclick="updateTransfer()" style="line-height: 60px;display: inline;">修改檔案<i class="fa fa-edit"></i></a></li>
            								<li><a href="<c:url value="/user/account"/>" style="line-height: 60px;display: inline;">匯出金額<i class="fa fa-dollar"></i></a></li>
							          	</ul>
        							</li>
      							</ul>
						</div>
				</div>
    		</li>
			<li>
				<div class="link"><i class="fa fa-globe"></i>關於。我<i class="fa fa-chevron-down"></i></div>
					<ul class="submenu">
						<li><a href="#">帳號：<span id='Account'></span></a></li>
						<li><a href="#">暱稱：<span id='NickName'></span></a></li>
						<li><a href="#">地址：<span id='Addr'></span></a></li>
						<li><a href="#">手機：<span id='Cell'></span></a></li>
						<li><a href="#">生日：<span id='Birthday'></span></a></li>
						<li><a href="#">我是：<span id='Gender'></span></a></li>
					</ul>
			</li>
			<li class="default open">
				<div class="link"><i class="fa fa-bars"></i>享。閱相關<i class="fa fa-chevron-down"></i></div>
					<ul class="submenu">
						<li><a href="#">享閱收入：<span id='Income'></span></a></li>
						<li><a href="#">權限：<span id='Auth'></span></a></li>
					</ul>
			</li>
		</ul>
	</div>
</div>
                    </div>
                    
   <!-- 以下區塊為修改彈跳區塊 -->
	<div class="modal fade" id="myUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
					<h4 class="modal-title" id="UpdateModalTitle">享。閱人&nbsp;資料修改</h4>
				</div>
				<!-- /.modal-header -->

				<div class="modal-body">
					<form role="form" id="updateform"
						action="<c:url value='/user/member.controller/Update'/>"
					   method="POST" enctype="multipart/form-data" role="form">
						<div class="form-group">
							<div class="input-group">
								<input id='updMemberID' type="text" name="memberID" class="form-control" placeholder="請輸入會員編號" readonly="readonly"> 
								<label class="input-group-addon glyphicon glyphicon-search"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input id='updAccount' type="text" name="account" class="form-control" placeholder="請輸入電子郵件" readonly="readonly"> 
								<label class="input-group-addon glyphicon glyphicon-envelope"></label>
							</div>
						</div>

						<div id='pwdMsg' class='hidden' style="color: red"></div>
						<div class="form-group">
							<div class="input-group">
								<input id='updPwd' type="password" name="pwd" class="form-control" placeholder="請輸入密碼"> 
								<label class="input-group-addon glyphicon glyphicon-lock"></label>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<input id='updMName' type="text" name="MName" class="form-control" placeholder="請輸入姓名"> 
								<label class="input-group-addon glyphicon glyphicon-user"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input id='updNickName' type="text" name="nickName" class="form-control" placeholder="請輸入暱稱"> 
								<label class="input-group-addon glyphicon glyphicon-user"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<label class="input-group-addon glyphicon" style="font-family: 微軟正黑體">男</label>
								<input id='updmale' type="radio" class="form-control" name="gender" value="0">
								<label class="input-group-addon glyphicon" style="font-family: 微軟正黑體">女</label>
								<input id='updfemale' type="radio" class="form-control" name="gender" value="1">
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input id='updAddr' type="text" name="addr" class="form-control" placeholder="請輸入通訊地址"> 
								<label class="input-group-addon glyphicon glyphicon-align-justify"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input id='updCell' type="text" name="cell" class="form-control" placeholder="請輸入手機"> 
								<label class="input-group-addon glyphicon glyphicon-phone"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input id='updBirthday' type="text" name="birthday" class="form-control" placeholder="請輸入生日"> 
								<label class="input-group-addon glyphicon glyphicon-calendar"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="file" name="file" class="form-control">
								<label class="input-group-addon glyphicon glyphicon-picture"></label>
							</div>
						</div>					
						
						<div class="modal-footer">
							<button style="background-color: #80beb0; border: none" id="updatebutton" class="form-control btn btn-primary"	name="memaction" value="Update">確定。修</button>
						</div>
						<!-- /.modal-footer -->
					</form>
				</div>
				<!-- /.modal-body -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	<!--已修改確認畫面 -->
	<div class="modal fade" id="updateSuccess" tabindex="-1" role="dialog"	aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="padding-top:200px">
			<div class="modal-content">
				<div class="panel-login">
					<div class="panel-body">
						<div>
							<h3 class="modal-title">您已修改成功！</h3>
							<div>
								<button id="updateSuccessBtn" class="btn" style="background-color:#80beb0 ; color: white">確定。</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>            


<c:import url="/pages/templates/user/userfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/login.js"/>"></script>
<script type="text/javascript">
$(function() {
	
	$('#updPwd').blur(
			function (event) {
				event.preventDefault();
				if(!passwordValid($("#updPwd").val())){
					$('#pwdMsg').removeClass("hidden");
					$('#pwdMsg').addClass("show");
					$('#pwdMsg').text("密碼必須至少8碼，而且必須含數字大小寫的英文字元唷！");
				}
				else{
					$('#pwdMsg').removeClass("show");
					$('#pwdMsg').addClass("hidden");
					$('#pwdMsg').text("");
				}
			}
	)
	
	var memberID = getCookie('login_id');
// 	var memberID = 'M170000029';
	
	$.ajax({
	    type: 'POST',
	    url: '/ireading/user/member.controller/ShowRepost',
	    data: {
	        'memberID':memberID
	    },
	    success: function(json){
	    	
	    	var addr = json[0].Addr;
	    	var blockAddr = $('<i></i>').addClass('fa fa-map-marker').append($('<small></small').text("\t" + addr.substr(0,3) + '\t' + addr.substr(3,3)));
	    	
	    	$('#MName').text(json[0].MName + "\t").append(blockAddr);
	    	
	    	console.log(addr.substr(0,3) + ' ' + addr.substr(3,3));
	    	$('#Account').text(json[0].Account);
	    	$('#NickName').text(json[0].NickName);
	    	$('#Addr').text(addr);
	    	$('#Cell').text(json[0].Cell);
	    	$('#Birthday').text(json[0].Birthday);
	    	
	    	var sex;
	    	if(json[0].Gender==1){
	    		sex='我是女生';
	    	}
	    	else if(json[0].Gender==0){
	    		sex='我是男生';
	    	}
	    	$('#Gender').text(sex);
	    	$('#Income').text(json[0].Income);
	    	var auth;
	    	if(json[0].Auth=="0"){
	    		auth = '停權會員';
	    		$('#Auth').text(auth).css('color','red');	
	    	}
	    	else if(json[0].Auth=="1"){
	    		auth = '權限正常';
	    		$('#Auth').text(auth);	
	    	}
	    	
	    	if(json[0].Photo!=""){
	    		$('#Photo').attr('src', "data:image/png;base64 ," + json[0].Photo).attr('width','100%');	
	    	}
	    	else{
	    		$('#Photo').attr('src', "/ireading/images/MEMPHOTO.png").attr('width','100%');
	    	}
	    }
	});
	
	
})

//按下修改按鈕後會彈跳出視窗並且帶入資料
function updateTransfer(){
		var memberID = getCookie('login_id');
// 		var memberID = 'M170000029';
	
		$.ajax({
		    type: 'POST',
		    url: '/ireading/user/member.controller/ShowRepost',
		    data: {
		        'memberID':memberID
		    },
		    success: function(json){
		        $('#updMemberID').val(json[0].MemberID).css('background-color','LightGray');
		        $('#updAccount').val(json[0].Account);
		        $('#updPwd').val(json[0].Pwd);
		        $('#updMName').val(json[0].MName);
		        $('#updNickName').val(json[0].NickName);
		        $('#updAddr').val(json[0].Addr);
		        $('#updCell').val(json[0].Cell);
		        $('#updBirthday').val(json[0].Birthday);
		        
		        if(json[0].Gender==0){
		        	$('#updmale').prop('checked',true);
		        }else if(json[0].Gender==1){
		        	$('#updfemale').prop('checked',true);
		        }
		        
		        $('#myUpdate').modal('toggle');
		    }
		});
	}

//送出修改資料
var options = {
			contentType : false,
			type : 'post',
			dataType : 'json',
			success : function(json) {
				$('#updateform').resetForm();
				$('#myUpdate').modal('toggle');
				$('#updateSuccess').modal('toggle');
				console.log(json);
				return false;
			},
			error : function() {
				console.log('error happened');
				return false;
			}
		}

		$('#updateform').ajaxForm(options);

//確認完畢
$('#updateSuccessBtn').click(
		function(event) {
			event.preventDefault();
			$('#updateSuccess').modal('toggle');
			location.reload();
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
		
		//密碼驗證
		//8碼，其中數字最少1碼，a-z最少一碼，A-Z最少一碼
		function passwordValid(pwd) {
			var regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
			return regex.test(pwd);
		}

</script>
</html>