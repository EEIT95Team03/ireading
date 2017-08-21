<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱管理者後台</title>

<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet" />
<!--jQuery-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script> 

<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.tablesorter.js"/>"></script>

<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/login.css'/>">
<style>
.search{
padding:10px;
margin-top: 30px;
margin-bottom: 30px;
}

</style>
</head>
<body>
	<c:import url="/pages/templates/manager/managermenu.jsp"></c:import>

	<div class="col-lg-11" style="padding-bottom: 50px;">
		<!--    內容寫這 -->

		<h1><span class="glyphicon glyphicon-tags"></span>二手書上架管理</h1>
		<div class="search col-xs-12">
		<div class="col-xs-12">
		<form
		action="<c:url value="/user/productlaunched.controller/SearchList"/>"
		method="get">
		<div class="row col-xs-4 col-md-2 text-right">
		    賣書清單編號:		
		</div>		
		<div id="searcher" class="row col-xs-5 ">
			<input type="text" id="searchcontent" name="search" class="form-control"></input>
			</div>
			<div class="row col-xs-3 text-left">
				<button class='btn btn-info btn-md searchbtn'>搜尋</button>			
		</div>
	</form>
	</div>
	
	<!-- 狀態查詢 -->
	<div class="col-xs-12">
	<form id ="statuslist"
		action="<c:url value="/user/productlaunched.controller/searchByStatus"/>"
		method="get">	
		<div class="row col-xs-4 col-md-2 text-right">
		    賣書清單狀態:		
		</div>
	  <div id="searcher" class="row col-xs-5 ">
	<!--select要有name才能取到值，是取到option的value喔！ -->
		<select id="searchstatus" name="searchstatus" class="form-control">
			<option></option>
			<option value="L0001">未處理</option>
			<option value="L0002">處理中</option>
			<option value="L0003">已處理</option>
			<option value="L0004">數量不符，通知會員</option>
			<option value="L0005">其他</option>
		</select>
		</div>
		<div class="row col-xs-3 text-left">
			<button class='btn btn-info btn-md searchbtn'>搜尋</button>
		</div>
	</form>
</div>
</div>
	<!-- Select 後的結果畫面 -->
	<div class="container">
		<div class="row col-xs-12 custyle">
			<table class="table table-striped custab" id="productlist">
				<thead>
					<tr>
						<th class="text-center">商品清單編號</th>
						<th class="text-center">申請時間</th>
						<th class="text-center">會員編號</th>
						<th class="text-center">清單處理狀態</th>
						<th class="text-center">action</th>
					</tr>
				</thead>
				<tbody>
					
					<c:forEach var="product" items="${dataList}">
						<tr>
							<c:url value="${product.SellListID}" var="linkP" />
							<td class="text-center" name="SellListID"><a href="${linkP}">${product.SellListID}</a></td>	
							<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${product.ApplyDate}"/></td>				
							<td class="text-center">${product.MemberID}</td>
							<td class="text-center">${product.StatusName}</td>
							<td class="text-center"><c:url value="" var="link">
									<c:param name="ProductID" value="${product.SellListID}"></c:param>
								</c:url> <a href="${linkP}" class='btn btn-primary btn-sm selectbtn'
								value="javascript:excuteUpdate('${product.SellListID}')"> 
								<span>享。審查清單內容</span>
							</a></td>
							
						</tr>
					</c:forEach>
					
					<c:forEach var="product" items="${dataLs}">
						<tr>
							<td>${product.SellListID}</td>
							<td>${product.ProductID}</td>
							<td>${product.StatusName}</td>
							<td>${product.ProductPrice}</td>
							<td>${product.Status}</td>
							<td>${product.Detail}</td>
							<td></td>

							<td class="text-center"><c:url
									value="/sellbook.controller/goUpdatePage" var="link">
									<c:param name="ProductID" value="${product.ProductID}"></c:param>
								</c:url> <a class='btn btn-info btn-xs editbtn'
								value="javascript:excuteUpdate('${product.ProductID}')"> <span
									class="glyphiconglyphicon-edit"></span>享。審核
							</a> <a class='btn btn-success btn-xs savebtn hidden'
								value="javascript:excuteUpdate('${product.ProductID}')"> <span
									class="glyphiconglyphicon-edit"></span>享。儲存
							</a> <a class='btn btn-danger btn-xs cancelbtn hidden'
								value="javascript:excuteUpdate('${product.ProductID}')"> <span
									class="glyphiconglyphicon-edit"></span>享。取消
							</a>
								<button class="btn btn-danger btn-xs deletebtn">
									<span class="glyphicon glyphicon-remove"></span>享。刪除
								</button></td>
						</tr>
					</c:forEach>
					
					<!-- searchByStatus -->
					<c:forEach var="product" items="${data}">
						<tr>
							<td>${product.SellListID}</td>
							<td>${product.MemberID}</td>
							<td>${product.StatusName}</td>
							<td></td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
	
	
	
	</div>




	<c:import url="/pages/templates/manager/managerfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script>
$(function(){
	
	  $('#productlist').DataTable({ "searching": false});
	  
	  })

</script>
</html>