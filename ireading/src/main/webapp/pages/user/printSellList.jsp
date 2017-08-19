<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body>
	<c:import url="/pages/templates/user/usermenu.jsp"></c:import>

	<div class="col-lg-12" style="padding-bottom: 50px;">
		<!--    內容寫這 -->

		<div class="ui page grid" style="padding:0">
			<div class="wide column">
				<h1 class="ui header aligned center">HTML to PDF</h1>
				<div class="ui divider hidden"></div>
				<div class="ui segment">
					<div class="ui button aligned center teal" id="create_pdf">Create PDF</div>
					<div class="ui divider"></div>
					<form class="ui form">
					<h1>享閱會員賣書清單</h1>
					</form>
				</div>
			</div>
		</div>
	</div>




	<c:import url="/pages/templates/user/userfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/login.js"/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/niklasvh/html2canvas/0.5.0-alpha2/dist/html2canvas.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/MrRio/jsPDF/master/dist/jspdf.min.js"></script>
	<script type="text/javascript" src="/ireading/js/app.js"></script>
</html>