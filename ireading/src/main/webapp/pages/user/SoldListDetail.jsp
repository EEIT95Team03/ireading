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

<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>
<body>
	<c:import url="/pages/templates/user/usermenu.jsp"></c:import>

	   <div class="col-lg-11 col-lg-offset-1">


		<!-- 內容寫這 -->

		<div class="row col-md-10 custyle">
		 <h1>
			<span class="glyphicon glyphicon-book"></span> 二手書上架申請
		</h1>
		<div>
			<a class="btn btn-lg btn-primary"
				href="<c:url value="/pages/user/ApplyToSell.jsp"/>">申請賣書</a>&nbsp;&nbsp;&nbsp;
			<a class="btn btn-lg btn-success" disabled>查詢賣書清單</a>
		</div/>
		<br>
		<span><input class="btn btn-info" type="button" onclick="history.back()"
				value="回到上一頁"></input></span>
			<h4><strong>商品清單編號： ${SellListID}</strong></h4>
			
		</div>

		<div class="container">
			<div class="row col-md-10 custyle">
				<table class="table table-striped custab" id="productlist">
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

								<td>${product.ProductID}</td>
								<td>${product.Title}</td>
								<td><fmt:parseNumber integerOnly = "true" 
         type = "number" value = "${product.ProductPrice}" /></td>								 
								<td>${product.status}</td>
								<td>${product.Detail}</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<c:import url="/pages/templates/user/userfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/login.js"/>"></script>

</html>