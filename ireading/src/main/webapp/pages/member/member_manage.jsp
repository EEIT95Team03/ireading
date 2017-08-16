<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
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
<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">
<style type="text/css">
body {
	background-color: lightblue;
	font-family: 微軟正黑體;
}

.timeline {
	position: relative;
	padding: 4px 0 0 0;
	margin-top: 22px;
	list-style: none;
}

.timeline>li:nth-child(even) {
	position: relative;
	margin-bottom: 50px;
	height: 180px;
	right: -100px;
}

.timeline>li:nth-child(odd) {
	position: relative;
	margin-bottom: 50px;
	height: 180px;
	left: -100px;
}

.timeline>li:before, .timeline>li:after {
	content: " ";
	display: table;
}

.timeline>li:after {
	clear: both;
	min-height: 170px;
}

.timeline>li .timeline-panel {
	position: relative;
	float: left;
	width: 41%;
	padding: 0 20px 20px 30px;
	text-align: right;
}

.timeline>li .timeline-panel:before {
	right: auto;
	left: -15px;
	border-right-width: 15px;
	border-left-width: 0;
}

.timeline>li .timeline-panel:after {
	right: auto;
	left: -14px;
	border-right-width: 14px;
	border-left-width: 0;
}

.timeline>li .timeline-image {
	z-index: 100;
	padding: 40px 65px 35px 35px;
	line-height: 0;
	position: absolute;
	left: 50%;
	border: 7px solid #c3d7f7;
	border-radius: 100%;
	background-color: pink;
	color: white;
	box-shadow: 0 0 5px #c3d7f7;
	width: 150px;
	height: 150px;
	font-size: 46px;
	margin-left: -100px;
	transition: background 1s, transform 1s 1s ease-in;
	/*separate transition effect in one property*/
	cursor: pointer;
	position: absolute;
	left: 50%;
	border: 7px solid #c3d7f7;
	border-radius: 100%;
	background-color: pink;
	color: white;
	box-shadow: 0 0 5px #c3d7f7;
	width: 150px;
	height: 150px;
	font-size: 46px;
	margin-left: -100px;
	transition: background 1s, transform 1s 1s ease-in;
	margin-left: -100px;
}

.timeline>li .timeline-image a {
	color: white;
	text-decoration: none;
}

.timeline>li .timeline-image:HOVER {
	background: salmon;
	transform: rotate(360deg);
}

.timeline>li .timeline-image h4 {
	margin-top: 12px;
	font-size: 10px;
	line-height: 14px;
}

.timeline>li.timeline-inverted>.timeline-panel {
	float: right;
	padding: 0 30px 20px 20px;
	text-align: left;
}

.timeline>li.timeline-inverted>.timeline-panel:before {
	right: auto;
	left: -15px;
	border-right-width: 15px;
	border-left-width: 0;
}

.timeline>li.timeline-inverted>.timeline-panel:after {
	right: auto;
	left: -14px;
	border-right-width: 14px;
	border-left-width: 0;
}

.timeline>li:last-child {
	margin-bottom: 0;
}

.timeline .timeline-heading h4 {
	margin-top: 22px;
	margin-bottom: 4px;
	padding: 0;
	color: #b3b3b3;
}

.timeline .timeline-heading h4.subheading {
	margin: 0;
	padding: 0;
	text-transform: none;
	font-size: 18px;
	color: #333333;
}

.timeline .timeline-body>p, .timeline .timeline-body>ul {
	margin-bottom: 0;
	color: #808080;
}
/*Style for even div.line*/
.timeline>li:nth-child(odd) .line:before {
	content: "";
	position: absolute;
	top: 60px;
	bottom: 0;
	left: 680px;
	width: 4px;
	height: 300px;
	background-color: #c3d7f7;
	-ms-transform: rotate(-44deg); /* IE 9 */
	-webkit-transform: rotate(-44deg); /* Safari */
	transform: rotate(-44deg);
	box-shadow: 0 0 5px #c3d7f7;
}
/*Style for odd div.line*/
.timeline>li:nth-child(even) .line:before {
	content: "";
	position: absolute;
	top: 60px;
	bottom: 0;
	left: 430px;
	width: 4px;
	height: 300px;
	background-color: #c3d7f7;
	-ms-transform: rotate(44deg); /* IE 9 */
	-webkit-transform: rotate(44deg); /* Safari */
	transform: rotate(44deg);
	box-shadow: 0 0 5px #c3d7f7;
}
/* Medium Devices, .visible-md-* */
@media ( min-width : 992px) and (max-width: 1199px) {
	.timeline>li:nth-child(even) {
		margin-bottom: 0px;
		min-height: 0px;
		right: 0px;
	}
	.timeline>li:nth-child(odd) {
		margin-bottom: 0px;
		min-height: 0px;
		left: 0px;
	}
	.timeline>li:nth-child(even) .timeline-image {
		left: 0;
		margin-left: 0px;
	}
	.timeline>li:nth-child(odd) .timeline-image {
		left: 690px;
		margin-left: 0px;
	}
	.timeline>li:nth-child(even) .timeline-panel {
		width: 76%;
		padding: 0 0 20px 0px;
		text-align: left;
	}
	.timeline>li:nth-child(odd) .timeline-panel {
		width: 70%;
		padding: 0 0 20px 0px;
		text-align: right;
	}
	.timeline>li .line {
		display: none;
	}
}
/* Small Devices, Tablets */
@media ( min-width : 768px) and (max-width: 991px) {
	.timeline>li:nth-child(even) {
		margin-bottom: 0px;
		min-height: 0px;
		right: 0px;
	}
	.timeline>li:nth-child(odd) {
		margin-bottom: 0px;
		min-height: 0px;
		left: 0px;
	}
	.timeline>li:nth-child(even) .timeline-image {
		left: 0;
		margin-left: 0px;
	}
	.timeline>li:nth-child(odd) .timeline-image {
		left: 520px;
		margin-left: 0px;
	}
	.timeline>li:nth-child(even) .timeline-panel {
		width: 70%;
		padding: 0 0 20px 0px;
		text-align: left;
	}
	.timeline>li:nth-child(odd) .timeline-panel {
		width: 70%;
		padding: 0 0 20px 0px;
		text-align: right;
	}
	.timeline>li .line {
		display: none;
	}
}
/* Custom, iPhone Retina */
@media only screen and (max-width: 767px) {
	.timeline>li:nth-child(even) {
		margin-bottom: 0px;
		min-height: 0px;
		right: 0px;
	}
	.timeline>li:nth-child(odd) {
		margin-bottom: 0px;
		min-height: 0px;
		left: 0px;
	}
	.timeline>li .timeline-image {
		position: static;
		width: 150px;
		height: 150px;
		margin-bottom: 0px;
	}
	.timeline>li:nth-child(even) .timeline-image {
		left: 0;
		margin-left: 0;
	}
	.timeline>li:nth-child(odd) .timeline-image {
		float: right;
		left: 0px;
		margin-left: 0;
	}
	.timeline>li:nth-child(even) .timeline-panel {
		width: 100%;
		padding: 0 0 20px 14px;
	}
	.timeline>li:nth-child(odd) .timeline-panel {
		width: 100%;
		padding: 0 14px 20px 0px;
	}
	.timeline>li .line {
		display: none;
	}
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
	/* 	font-family: 微軟正黑體; */
}

.form-control.btn {
	font-weight: 300;
	color: white;
	height: 50px;
	font-size: 18px;
	background-color: #80beb0;
}

.modal-title {
	font-weight: 500;
	color: #808080;
}

.progress-bar {
	background-color: #808080;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var trigger = $('.hamburger'), overlay = $('.overlay'), isClosed = false;
						trigger.click(function() {
							hamburger_cross();
						});
						function hamburger_cross() {
							if (isClosed == true) {
								overlay.hide();
								trigger.removeClass('is-open');
								trigger.addClass('is-closed');
								isClosed = false;
							} else {
								overlay.show();
								trigger.removeClass('is-closed');
								trigger.addClass('is-open');
								isClosed = true;
							}
						}
						$('[data-toggle="offcanvas"]').click(function() {
							$('#wrapper').toggleClass('toggled');
						});
					});

	$(document).ready(
			function() {
				$('.modal-footer button').click(
						function() {
							var button = $(this);

							if (button.attr("data-dismiss") != "modal") {
								var inputs = $('form input');
								var title = $('.modal-title');
								var progress = $('.progress');
								var progressBar = $('.progress-bar');

								// 												inputs.attr("disabled",
								// 														"disabled");

								button.hide();

								progress.show();

								progressBar.animate({
									width : "100%"
								}, 100);

								progress.delay(1000).fadeOut(600);

								button.text("關閉").removeClass("btn-primary")
										.addClass("btn-success").blur().delay(
												1600).fadeIn(
												function() {
													// 																	title
													// 																			.text("完成！");
													button.attr("data-dismiss",
															"modal");
												});
							}
						});

				$('#myInsert').on(
						'hidden.bs.modal',
						function(e) {
							// 									var inputs = $('#insertform input');
							var title = $('#NewModalTitle');
							var progressBar = $('#progress1');
							var button = $('#newbutton');

							// 									inputs.removeAttr("disabled");

							title.text("新增享。閱人");

							progressBar.css({
								"width" : "0%"
							});

							button.removeClass("btn-success").addClass(
									"btn-primary").text("確定。新增").removeAttr(
									"data-dismiss");

						});

				$('#myQuery').on(
						'hidden.bs.modal',
						function(e) {
							// 									var inputs = $('#queryform input');
							var title = $('#QueryModalTitle');
							var progressBar = $('#progress2');
							var button = $('#querybutton');

							// 									inputs.removeAttr("disabled");

							title.text("查詢享。閱人");

							progressBar.css({
								"width" : "0%"
							});

							button.removeClass("btn-success").addClass(
									"btn-primary").text("享。詢人").removeAttr(
									"data-dismiss");

						});

				$('#myUpdate').on(
						'hidden.bs.modal',
						function(e) {
							// 									var inputs = $('#updateform input');
							var title = $('#UpdateModalTitle');
							var progressBar = $('#progress3');
							var button = $('#updatebutton');

							// 									inputs.removeAttr("disabled");

							title.text("更新享。閱人");

							progressBar.css({
								"width" : "0%"
							});

							button.removeClass("btn-success").addClass(
									"btn-primary").text("確定。修").removeAttr(
									"data-dismiss");

						});
			});
</script>
</head>
<body>
	<c:import url="/pages/templates/user/usermenu.jsp"></c:import>

	<div class="container"
		style="height: 460px; background: url('http://images.clipartpanda.com/clouds-background-png-CloudImage.png'); background-repeat: no-repeat">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="text-center" style="color: #ff8c9b">享。閱&nbsp;會員資料管理</h3>
				<ul class="timeline">
					<li>
						<button class="timeline-image" data-toggle="modal"
							data-target="#myInsert">新。</button>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4>享。新增</h4>
								<h4 class="subheading">新增享。閱人</h4>
							</div>
						</div>
						<div class="line"></div>
					</li>
					<li class="timeline-inverted">
						<button class="timeline-image" data-toggle="modal"
							data-target="#myQuery">詢。</button>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4>享。查詢</h4>
								<h4 class="subheading">查詢享。閱人</h4>
							</div>
						</div>
						<div class="line"></div>
					</li>
					<li>
						<button class="timeline-image" data-toggle="modal"
							data-target="#myUpdate">修。</button>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4>享。更新</h4>
								<h4 class="subheading">更新享。閱人</h4>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 以下區塊為新增彈跳區塊 -->
	<div class="modal fade" id="myInsert" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">X</button>
					<h3 class="modal-title" id="NewModalTitle">新增享。閱人</h3>
				</div>

				<div class="modal-body">
					<form id="insertform"
						action="<c:url value='/manager/member.controller' />"
						method="POST" enctype="multipart/form-data" role="form">
						<div class="form-group">
							<div class="input-group">
								<input type="text" name="account" class="form-control"
									placeholder="請輸入電子郵件"> <label
									class="input-group-addon glyphicon glyphicon-envelope"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="password" name="pwd" class="form-control"
									placeholder="請輸入密碼"> <label
									class="input-group-addon glyphicon glyphicon-lock"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="text" name="MName" class="form-control"
									placeholder="請輸入姓名"> <label
									class="input-group-addon glyphicon glyphicon-user"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="text" name="nickName" class="form-control"
									placeholder="請輸入暱稱"> <label
									class="input-group-addon glyphicon glyphicon-user"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<label class="input-group-addon glyphicon" for="male">男</label>
								<input type="radio" id="male" class="form-control" name="gender"
									value="0"> <label class="input-group-addon glyphicon"
									for="feamle">女</label> <input type="radio" id="female"
									class="form-control" name="gender" value="1">
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="text" name="addr" class="form-control"
									placeholder="請輸入通訊地址"> <label
									class="input-group-addon glyphicon glyphicon-align-justify"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="text" name="cell" class="form-control"
									placeholder="請輸入手機"> <label
									class="input-group-addon glyphicon glyphicon-phone"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="text" name="birthday" class="form-control"
									placeholder="請輸入生日"> <label
									class="input-group-addon glyphicon glyphicon-calendar"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="file" name="file" class="form-control"> <label
									class="input-group-addon glyphicon glyphicon-picture"></label>
							</div>
						</div>

						<div class="modal-footer">
							<button type="submit" id="newbutton" class="form-control btn"
								name="memaction" value="Insert">確定。新增</button>
							<!-- 							<div class="progress"> -->
							<!-- 								<div class="progress-bar" role="progressbar" id="progress1" -->
							<!-- 									aria-valuenow="1" aria-valuemin="1" aria-valuemax="100" -->
							<!-- 									style="width: 0%;"> -->
							<!-- 									<span class="sr-only">progress</span> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
						</div>
					</form>
				</div>
				<!--/.modal-body -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 以下區塊為查詢彈跳區塊 -->
	<div class="modal fade" id="myQuery" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">X</button>
					<h4 class="modal-title" id="QueryModalTitle">享。詢人</h4>
				</div>
				<!-- /.modal-header -->

				<div class="modal-body">
					<form role="form" id="queryform">
						<div class="form-group">
							<div class="input-group">
								<input type="text" name="memberID" class="form-control"
									placeholder="請輸入會員編號"> <label
									class="input-group-addon glyphicon glyphicon-search"></label>
							</div>
						</div>

						<div class="modal-footer">
							<button type="submit" id="querybutton"
								class="form-control btn btn-primary" name="memaction"
								value="Show">詢人。Yes!</button>
							<!-- 						<div class="progress"> -->
							<!-- 							<div class="progress-bar" role="progressbar" id="progress2" aria-valuenow="1" aria-valuemin="1" aria-valuemax="100" -->
							<!-- 							style="width: 0%;"> -->
							<!-- 							<span class="sr-only">progress</span> -->
							<!-- 						</div> -->
							<!-- 					</div> -->
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

	<!-- 以下區塊為修改彈跳區塊 -->
	<div class="modal fade" id="myUpdate" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">X</button>
					<h4 class="modal-title" id="UpdateModalTitle">享。修</h4>
				</div>
				<!-- /.modal-header -->

				<div class="modal-body">
					<form role="form" id="updateform"
						action="<c:url value="/manager/member.controller"/>" method="POST"
						enctype="multipart/form-data">
						<div class="form-group">
							<div class="input-group">
								<input type="text" name="memberID" class="form-control"
									placeholder="請輸入會員編號"> <label
									class="input-group-addon glyphicon glyphicon-search"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="text" name="account" class="form-control"
									placeholder="請輸入電子郵件"> <label
									class="input-group-addon glyphicon glyphicon-user"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="password" name="pwd" class="form-control"
									placeholder="請輸入密碼"> <label
									class="input-group-addon glyphicon glyphicon-lock"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="text" name="MName" class="form-control"
									placeholder="請輸入姓名"> <label
									class="input-group-addon glyphicon glyphicon-user"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="text" name="nickName" class="form-control"
									placeholder="請輸入暱稱"> <label
									class="input-group-addon glyphicon glyphicon-user"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="radio" class="form-control" name="gender" value="0">
								<label class="input-group-addon glyphicon">男</label> <input
									type="radio" class="form-control" name="gender" value="1">
								<label class="input-group-addon glyphicon">女</label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="text" name="addr" class="form-control"
									placeholder="請輸入通訊地址"> <label
									class="input-group-addon glyphicon glyphicon-user"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="text" name="cell" class="form-control"
									placeholder="請輸入手機"> <label
									class="input-group-addon glyphicon glyphicon-user"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="text" name="birthday" class="form-control"
									placeholder="請輸入生日"> <label
									class="input-group-addon glyphicon glyphicon-user"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="file" name="file" class="form-control"> <label
									class="input-group-addon glyphicon glyphicon-picture"></label>
							</div>
						</div>
						<div class="modal-footer">
							<button id="updatebutton" class="form-control btn btn-primary"
								name="memaction" value="Update">確定。修</button>
							<!-- 						<div class="progress"> -->
							<!-- 							<div class="progress-bar" role="progressbar" id="progress3" aria-valuenow="1" aria-valuemin="1" aria-valuemax="100" -->
							<!-- 							style="width: 0%;"> -->
							<!-- 							<span class="sr-only">progress</span> -->
							<!-- 						</div> -->
							<!-- 					</div> -->
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

	<!-- 顯示會員資料的跳視窗 -->
	<div class="modal fade" id="myShow" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">X</button>
					<h4 class="modal-title" id="UpdateModalTitle">享。閱人s</h4>
				</div>
				<!-- /.modal-header -->

				<div class="modal-body">
					<form role="form" id="showform" method="POST"
						enctype="multipart/form-data">
						<table>
							<thead>
								<tr>
									<th>享。閱人編號</th>
									<th>註冊帳號</th>
									<th>享。閱人，名</th>
									<th>暱稱</th>
									<th>住在哪裡</th>
									<th>享。電聯</th>
									<th>壽星日</th>
									<th>加入享。閱</th>
									<th>性別</th>
									<th>享。收入</th>
									<th>享。真相</th>
									<th>權限</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bean" items="${select}">
									<tr>
										<td>${bean.memberID}</td>
										<td>${bean.account}</td>
										<td>${bean.pwd}</td>
										<td>${bean.MName}</td>
										<td>${bean.nickName}</td>
										<td>${bean.addr}</td>
										<td>${bean.cell}</td>
										<td>${bean.birthday}</td>
										<td>${bean.regDate}</td>
										<td><c:choose>
												<c:when test="${bean.gender==0}">
													<c:out value="男" />
												</c:when>
												<c:when test="${bean.gender==1}">
													<c:out value="女" />
												</c:when>
											</c:choose></td>
										<td>${bean.income}</td>
										<td><img
											src="data:image/png;base64, ${bean.byteArrayString }" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<div class="form-group">
							<div class="input-group">
								<input type="text" name="memberID" class="form-control"
									placeholder="請輸入會員編號"> <label
									class="input-group-addon glyphicon glyphicon-search"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="radio" class="form-control" name="gender" value="0">
								<label class="input-group-addon glyphicon">男</label> <input
									type="radio" class="form-control" name="gender" value="1">
								<label class="input-group-addon glyphicon">女</label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="file" name="file" class="form-control"> <label
									class="input-group-addon glyphicon glyphicon-picture"></label>
							</div>
						</div>
						<div class="modal-footer">
							<button id="updatebutton" class="form-control btn btn-primary"
								name="memaction" value="Update">確定。修</button>
							<!-- 						<div class="progress"> -->
							<!-- 							<div class="progress-bar" role="progressbar" id="progress3" aria-valuenow="1" aria-valuemin="1" aria-valuemax="100" -->
							<!-- 							style="width: 0%;"> -->
							<!-- 							<span class="sr-only">progress</span> -->
							<!-- 						</div> -->
							<!-- 					</div> -->
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

	<script type="text/javascript">
		$(function() {
			$('#querybutton').click(
					function(event) {
						event.preventDefault();
						var data = $('#queryform').serialize();
						$.get('/ireading/user/member.controller/Show', data,
								function(data) {

								})

					})

		})
	</script>


	<c:import url="/pages/templates/user/userfooter.jsp"></c:import>
</body>

</html>