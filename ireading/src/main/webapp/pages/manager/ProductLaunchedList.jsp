<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<%-- <script src="<c:url value="/js/bootstrap.min.js"/>"></script> --%>
<script type="text/javascript">
	function clearForm() {
		var inputs = document.getElementsByTagName("input");
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == "text") {
				inputs[i].value = "";
			}
		}
	}
</script>
<div>
	<form
		action="<c:url value="/manager/productlaunched.controller/SellBookMainPage"/>"
		method="get">
		<input type="submit" value="Select">
	</form>
</div>

</head>
<body>
	<!--  -->
	<form
		action="<c:url value="/user/productlaunched.controller/SearchList"/>"
		method="get" style="display: inline-block;">
		<div id="searcher" class="row col-md-8 col-md-offset-5"
			style="display: inline-block;">
			<input type="text" id="searchcontent" name="search"></input> <span>
				<button class='btn btn-info btn-xs searchbtn'>搜尋</button>
			</span>
		</div>
	</form>

	<!-- 狀態查詢 -->
	<form id ="statuslist"
		action="<c:url value="/user/productlaunched.controller/searchByStatus"/>"
		method="get" style="display:inline-block;">		
	<!--select要有name才能取到值，是取到option的value喔！ -->
		<select id="searchstatus" name="searchstatus">
			<option value="L0001">未處理</option>
			<option value="L0002">處理中</option>
			<option value="L0003">已處理</option>
			<option value="L0004">數量不符，通知會員</option>
			<option value="L0005">其他</option>
		</select> <span style="display: inline-block;">
			<button class='btn btn-info btn-xs searchbtn'>搜尋</button>
		</span>
	</form>


	<!-- Select 後的結果畫面 -->
	<div class="container">
		<div class="row col-md-8 col-md-offset-2 custyle">
			<table class="table table-striped custab" id="productlist">
				<thead>
					<tr>
						<th>商品清單編號</th>
						<th>會員編號</th>
						<th>清單處理狀態</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					
					<c:forEach var="product" items="${dataList}">
						<tr>
							<c:url value="${product.SellListID}" var="linkP" />
							<td name="SellListID"><a href="${linkP}">${product.SellListID}</a></td>	
							<td>${product.MemberID}</td>
							<td>${product.StatusName}</td>
							<td></td>

							<td class="text-center"><c:url value="" var="link">
									<c:param name="ProductID" value="${product.SellListID}"></c:param>
								</c:url> <a href="${linkP}" class='btn btn-default btn-sm selectbtn'
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
	<script>
		// 	$("#searcher").on("click",".searchbtn",function(event){
		// 		var result = $("#searchcontent").val();
		// 		alert(result);
		// 		$.post("/ireading/user/productlaunched.controller/SearchList", {
		// 			SellListID : result

		// 		}, function(data) {

		// 			location.reload();
		// 		});
		// 	});
	</script>

</body>
</html>