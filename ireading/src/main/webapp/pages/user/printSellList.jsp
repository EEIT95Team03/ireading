<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心</title>

<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<!--jQuery-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.tablesorter.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.12.0/semantic.min.css">
<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>
<style>
td {
	padding: 5px;
}

h1 {
	font: 微軟正黑體;
	color: white;
	padding-left: 30px;
	padding-top: 2cm;
}

table {
	margin-left: auto;
	margin-right: auto;
}

p{
	padding-left: 30px;
	padding-top: 1cm;
	font: 微軟正黑體;
	color: white;
}

#p1 {
	padding-left: 30px;
	padding-right: 30px;
	padding-top: 1px;
	font: 微軟正黑體;
	color: white;
}
</style>
<body>
	<c:import url="/pages/templates/user/usermenu.jsp"></c:import>

	<div class="col-lg-8" style="padding-bottom: 50px;">
		<!--    內容寫這 -->
        <span><input class="btn btn-info" type="button" onclick="history.back()"
				value="回到上一頁"></input></span>
		<div class="ui page grid" style="padding: 0">
			<div class="wide column">
				<h1 class="ui header aligned center"></h1>

				<div class="ui divider hidden"></div>
				<div class="ui segment">
					<div class="ui button aligned center teal" id="create_pdf">一鍵產生
						pdf檔</div>&nbsp;&nbsp;<span>將本清單儲存，在日後資料有所出入或有疑問時，方便與工作人員進行核對。</span>
					<div class="ui divider"></div>
					<form class="ui form">
						<div style="hieght:1000px;">
							<div style="height: 150px; background-color: #80beb0;">
								<h1>
									<strong>享閱會員賣書清單</strong>
								</h1>
							</div>

							<h3>
								<span class="label label-success target">&nbsp;商品清單編號&nbsp;</span>&nbsp;
								<span id="slID">${SellListID}</span>
							</h3>
							<h3>
								<span class="label label-success target">&nbsp;會員編號&nbsp;</span>&nbsp;
								<span id="mID">${dataLs2[0].MemberID}</span>
								&nbsp;&nbsp;&nbsp;&nbsp; <span
									class="label label-success target">&nbsp;申請日期&nbsp;</span>&nbsp;
								<span id="ApplyDate"><fmt:formatDate
										value="${dataLs2[0].ApplyDate}" pattern="yyyy-MM-dd HH:mm" /></span>

							</h3>

							<table border=1>
								<thead>
									<tr>
										<th>商品編號</th>
										<th>商品名稱</th>
										<th>二手價</th>
										<th>狀態</th>
										<th>備註</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="product" items="${dataLs}">
										<tr>
											<td class="ProductID">${product.ProductID}</td>
											<td class="Title">${product.Title}</td>
											<td class="ProductPrice"><fmt:formatNumber type="number"
													value="${product.ProductPrice}" /></td>
											<td class="status">${product.status}</td>
											<td class="Detail">${product.Detail}</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div style="height: 20px;"></div>
							<div style="height: 170px; background-color: #80beb0;">
								<p>親愛的享閱人，您好！歡迎加入這個喜愛閱讀的大家庭，並謝謝您使用本公司的賣書功能。</p>
								<p id="p1">
									本清單的目的在於保障享閱會員的權益，在日後資料有所出入或有疑問時，方便與工作人員進行。請妥善保存。
									並將您欲販售的書籍郵寄至：<strong>106 台北市大安區復興南路一段390號二樓 203室</strong> 
									<br>收件者請填寫：<strong>享閱股份有限公司收</strong>。
									<br>有其他問題，歡迎撥打：(02)6631-6666。將會有客服為您服務。
								</p>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>




	<c:import url="/pages/templates/user/userfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/login.js"/>"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.rawgit.com/niklasvh/html2canvas/0.5.0-alpha2/dist/html2canvas.min.js"></script>
<script type="text/javascript"
	src="https://cdn.rawgit.com/MrRio/jsPDF/master/dist/jspdf.min.js"></script>
<script>
	(function() {
		var form = $('.form'), cache_width = form.width(), a4 = [ 595.28,
				841.89 ]; // for a4 size paper width and height

		var slID = $('#slID').text();
		$('#create_pdf').on('click', function() {
			$('body').scrollTop(0);
			createPDF();
		});
		//create pdf
		function createPDF() {
			getCanvas().then(function(canvas) {
				var img = canvas.toDataURL("image/png"), doc = new jsPDF({
					unit : 'px',
					format : 'a4'
				});
				doc.addImage(img, 'JPEG', 20, 20);
				doc.save(slID + '.pdf');
				form.width(cache_width);
			});
		}

		// create canvas object
		function getCanvas() {
			form.width((a4[0] * 1.33333) - 80).css('max-width', 'none');
			return html2canvas(form, {
				imageTimeout : 2000,
				removeContainer : true
			});
		}

	}());
</script>
</html>