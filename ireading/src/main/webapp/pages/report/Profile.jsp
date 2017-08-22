<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱</title>
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- 選擇性佈景主題 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<%-- <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" /> --%>
<%-- <link href="<c:url value="/css/bootstrap-theme.min.css"/>" --%>
<!-- 	rel="stylesheet" /> -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 最新編譯和最佳化的 JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	
	

<style>
.destacados {
	padding: 20px 0;
	text-align: center;
}

.destacados>div>div {
	padding: 10px;
	border: 1px solid transparent;
	border-radius: 4px;
	transition: 0.2s;
}

.destacados>div:hover>div {
	margin-top: -10px;
	border: 1px solid rgb(200, 200, 200);
	box-shadow: rgba(0, 0, 0, 0.1) 0px 5px 5px 2px;
	background: rgba(200, 200, 200, 0.1);
	transition: 0.5s;
}

.text-center .mandarinfont {
	text-align: center;
	font-family: 微軟正黑體;
}

.mandarinfont {
	font-family: 微軟正黑體;
}

.bookbackground {
	-webkit-filter: brightness(.7);
	opacity: 0.8;
}

.words {
	font-size: 25px;
	letter-spacing: 10px;
	position: absolute;
	margin: 30px;
	color: white;
	font-family: 微軟正黑體;
	line-height: 200%;
}

.imgw {
	position: relative;
}

.pic_height {
	height: 530px;
	background-image:url("/ireading/images/back.png");
	width:100%;
	padding:20px;

}

.teachers {
	font-size: 34px;
	font-family: 微軟正黑體;
	color: #ececec;
}

.teachers {
	font-size: 34px;
	font-family: 微軟正黑體;
	color: #ececec;
	margin-bottom: 35px;
}

.container {
	/*  border-bottom:solid 1px red; */
	
}

.textShadow {
	text-shadow: 0px 0px 20px #AE57A4;
}
</style>
<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">
</head>
<body>
	<div>
		<h1 class="text-center mandarinfont">
			<strong>我們是：享。閱</strong>
		</h1>
	</div>
	<br>
	<div class="text-center pic_height">
<!-- 		<img class="bookbackground imgw" style="height:500px; width: 1200px;" -->
<!-- 			src="https://drive.google.com/uc?id=0B_81cnaarNZxNmZNOWE3T2JWTkU"> -->
		<div class=" col-xs-12 text-center words">

			<p class='textShadow'>
				<strong>這是一個二手書的交易平台</strong>
			</p>
			<p class='textShadow'>
				<strong>每本會員想販售的二手書，都必須經由本團隊拍攝短片</strong>
			</p>
			<p class='textShadow'>
				<strong>讓所有想買書的會員都能知道二手書最真實的狀況</strong>
			</p>
			<p class='textShadow'>
				<strong>讓買家能買得安心，賣家也能輕鬆的獲得收入</strong>
			</p>
			<p class='textShadow'>
				<strong>進而形成良好的書籍流動，讓每一本書都能發揮最大價值</strong>
			</p>
			<p class='textShadow'>
				<strong>同時本網站也開放會員們撰寫書評</strong>
			</p>
			<p class='textShadow'>
				<strong>並定期更新相關活動資訊，讓會員們能享受閱讀的樂趣</strong>
			</p>
		</div>
	</div>
	<br>



	<br>
	<br>
	<div class="container" id="team"
		style="background-color: #80beb0; margin-left: 0px; width: 100%; height: 600px;">
		<h2 class="text-center mandarinfont" style="margin-top: 90px;">
			<strong>享閱團隊成員介紹</strong>
		</h2>

		<div class="row destacados">
			<div class="col-md-2">

				<div>
					<img src="https://drive.google.com/uc?id=0B_GhjMBLfX3BVTRwZ3NiTVQ3SXc"
						alt="Texto Alternativo" class="img-circle img-thumbnail"
						style="height: 150px; width:150px;">
					<h3>
						<span class="label label-warning target mandarinfont">&nbsp;組長&nbsp;</span>
					</h3>
					<h3 class="mandarinfont">
						許維城
					</h3>
					<p class="mandarinfont">
						<br>訂單管理<br>購物車<br>會員轉出實體金額<br>網站版型設設計
					</p>
				</div>
			</div>

			<div class="col-md-2">
				<div>
					<img
						src="https://drive.google.com/uc?id=0B_GhjMBLfX3BNndiQTZjVnF3Y3c"
						alt="Texto Alternativo" class="img-circle img-thumbnail"
						style="height: 150px; width:150px;">
					<h3>
						<span class="label label-success target mandarinfont">&nbsp;組員&nbsp;</span>
					</h3>
					<h3 class="mandarinfont">李則誼</h3>
					<br>
					<p class="mandarinfont">
						資料庫建置<br>會員註冊 / 登入 / 登出<br>查詢密碼<br>網站美術設計
					</p>

				</div>
			</div>

			<div class="col-md-2">
				<div>
					<img
						src="https://drive.google.com/uc?id=0B_GhjMBLfX3BeXQ2b0tJdC13Wms"
						alt="Texto Alternativo" class="img-circle img-thumbnail"
						style="height: 150px; width:150px;">
					<h3>
						<span class="label label-success target mandarinfont">&nbsp;組員&nbsp;</span>
					</h3>
					<h3 class="mandarinfont">賀易凡</h3>
					<br>
					<p class="mandarinfont">
						活動牆<br>活動管理<br>報名參加活動
					</p>
					<!-- 				<a href="#" class="btn btn-primary" title="Enlace">Leer más »</a> -->
				</div>
			</div>
			<div class="col-md-2">
				<div>
					<img src="https://drive.google.com/uc?id=0B_GhjMBLfX3BMWc1a0hlZkx5ZVk"
						alt="Texto Alternativo" class="img-circle img-thumbnail"
						style="height: 150px; width:150px;">
					<h3>
						<span class="label label-success target mandarinfont">&nbsp;組員&nbsp;</span>
					</h3>
					<h3 class="mandarinfont">陳慈嫺</h3>
					<br>
					<p class="mandarinfont">
						書籍基本資料查詢<br>書籍分類查詢<br>維護書籍資料
					</p>

				</div>
			</div>

			<div class="col-md-2">
				<div>
					<img
						src="https://drive.google.com/uc?id=0B_GhjMBLfX3BazIzbUUzUjJMaHc"
						alt="Texto Alternativo" class="img-circle img-thumbnail"
						style="height: 150px; width:150px;">
					<h3>
						<span class="label label-success target mandarinfont">&nbsp;組員&nbsp;</span>
					</h3>
					<h3 class="mandarinfont">賴佳妤</h3>
					<br>
					<p class="mandarinfont">
						書櫃管理<br>修改書櫃明細<br>修改書評
					</p>

				</div>
			</div>

			<div class="col-md-2">
				<div>
					<img src="https://drive.google.com/uc?id=0B_GhjMBLfX3BZFFQMkktQUl6YUE"
						alt="Texto Alternativo" class="img-circle img-thumbnail"
						style="height: 150px; width:150px;">
					<h3>
						<span class="label label-success target mandarinfont">&nbsp;組員&nbsp;</span>
					</h3>
					<h3 class="mandarinfont">劉仲桓</h3>
					<br>
					<!-- 				<h4><strong>《負責項目》</strong></h4> -->
					<p class="mandarinfont">
						使用者申請賣書<br>修改二手書售價<br>管理者上架二手書<br>修改二手書狀態
					</p>

				</div>
			</div>
		</div>
	</div>

	<div class="container"
		style="background-color: white; margin-left: 0px; width: 100%; height: 650px;">
		<div class="row destacados">
			<h2 class="text-center mandarinfont" style="margin-bottom: 15px;">
				<strong>Tech We Use</strong>

			</h2>
			<div>
				<img
					src="https://drive.google.com/uc?id=0B_81cnaarNZxaS1zWENoakN1N2M"
					style="width: 1200px; height: 520px;">
			</div>
		</div>
	</div>

	<div class="container"
		style="background-color: #80beb0; margin-left: 0px; width: 100%; height: 500px;">
		<div class="row destacados" style="margin-top: 50px;">
			<h2 class="text-center"
				style="color: #ececec; font-family: 微軟正黑體; letter-spacing: 10x">
				<strong>技術指導團隊</strong>
			</h2>
			<br>
			<p class="teachers">
				邱華傑老師&nbsp; &nbsp; <span>陳奕兆老師</span>&nbsp; &nbsp; <span>劉漢卿老師</span>&nbsp;
				&nbsp; <span>潘麗珍老師</span>
			</p>
			<p class="teachers">
				紀宜昕老師&nbsp; &nbsp; <span>陳銀華老師</span>&nbsp; &nbsp; <span>王憲春老師</span>&nbsp;
				&nbsp; <span>王孝弘老師</span>
			</p>
			<p class="teachers">
				吳永志老師&nbsp; &nbsp; <span>馬全德老師</span>&nbsp; &nbsp; <span>蘇國鈞老師</span>&nbsp;
				&nbsp; <span>林昭吟老師</span>
			</p>

		</div>
	</div>



	<div class="container" id="contact"
		style="margin-left: 0px; width: 100%; height: 500px;">
		<div class="row destacados" style="margin-top: 50px;">
			<h2 class="text-center"
				style="color: black; font-family: 微軟正黑體; letter-spacing: 10x">
				<strong>聯絡我們</strong>
			</h2>
			<br>
			<div>
				<span id="contentframe" style="top: 250px; right: 500px; padding-top:100px;">
					<h3
						style="font-size:40px; font-family: 微軟正黑體; border: 20px; padding-bottom: 50px; padding-left: 150px; padding-top:50px; position: absolute;">享。閱股份有限公司
					</h3>
					<p
						style="font-size: 20px; font-family: 微軟正黑體; border: 20px; padding-bottom: 100px; padding-left: 150px; padding-top: 150px; position: absolute;">台北市大安區復興南路一段390號二樓203室</p>
						<p
						style="font-size: 20px; font-family: 微軟正黑體; border: 20px;  padding-bottom: 100px; padding-left: 150px; padding-top: 180px; position: absolute;">(02)6631-6666</p>

				</span>
				<span id="contentframe" style="top: 160px; left: 500px;">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d57840.16650733009!2d121.50839957891277!3d25.033720896846596!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abd379a5ec97%3A0xedc006d25a9e35df!2z6LOH562W5pyDIOaVuOS9jeaVmeiCsueglOeptuaJgCDos4foqIrmioDooZPoqJPnt7TkuK3lv4M!5e0!3m2!1szh-TW!2stw!4v1503300688118"
						width="500" height="500" align="left" frameborder="10"
						style="border: 20px; padding-bottom: 100px; padding-right: 170px; height: 80%; width: 55%; position: absolute;"
						allowfullscreen></iframe>
				</span>
			</div>

		</div>
	</div>

</body>
</html>