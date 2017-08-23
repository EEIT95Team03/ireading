<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱管理者後台</title>

<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<!--jQuery-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.tablesorter.js"/>"></script>

<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">
</head>
<body>
	<c:import url="/pages/templates/manager/managermenu.jsp"></c:import>

	<script>
		//編輯商品清單的按鈕
		$(function() {
			$('.forselllist').on('click', '.editSellListStatusbtn',
					function(event) {
						$(".statusid").toggleClass("hidden", false);
						$("#upt_statusname").toggleClass("hidden");
						$("#savebtnsls").toggleClass("hidden", false);
					});
		});

		$(function() {
			$('.forselllist')
					.on(
							'click',
							'.saveSellListStatusbtn',
							function(event) {
								var statusid = $("#statusid").val();
								// 				alert(statusid);
								var SellListID = $("#slID").text();
								// 				alert(SellListID);				

								$
										.post(
												"/ireading/manager/productlaunched.controller/updateSellListID",
												{
													SellListID : SellListID,
													statusid : statusid
												},
												function(statusid) {

													console
															.log(statusid[0].change);
													if (statusid[0].change == "1") {
														alert("資料更新成功");
														location.reload();
													} else {
														alert("資料更新失敗");
													}
												});

							});
		});
	</script>

	<div class="col-lg-10 col-lg-offset-1 mainmain">
		<!-- 內容寫這 -->
		<div class="forselllist">
			<div class="row col-md-8 col-md-offset-1 custyle">
				<h1><span class="glyphicon glyphicon-tags"></span>二手書上架管理</h1>
				<div>
					<span><input class="btn btn-info" type="button"
						onclick="history.back()" value="回到上一頁"></input></span>
				</div>
				<h4>
					<span class="label label-warning target">&nbsp;商品清單編號&nbsp;</span>&nbsp;
					<span id="slID">${SellListID}</span>
				</h4>
				<h4>
					<span class="label label-warning target">&nbsp;商品清單狀態&nbsp;</span>&nbsp;
					<select id="statusid" class="statusid hidden" name="statusid">
						<option value="L0001"
							<c:if test="${status.StatusID eq 'L0001'}">selected</c:if>>未處理</option>
						<option value="L0002"
							<c:if test="${status.StatusID eq 'L0002'}">selected</c:if>>處理中</option>
						<option value="L0003"
							<c:if test="${status.StatusID eq 'L0003'}">selected</c:if>>已處理</option>
						<option value="L0004"
							<c:if test="${status.StatusID eq 'L0004'}">selected</c:if>>數量不符，通知會員</option>
						<option value="L0005"
							<c:if test="${status.StatusID eq 'L0005'}">selected</c:if>>其他</option>
					</select> <span><button id="savebtnsls"
							class="btn btn-info saveSellListStatusbtn hidden">儲存</button></span> <span
						id="upt_statusname">&nbsp;&nbsp;${status.StatusName}<span>&nbsp;&nbsp;
							<button class="btn btn-info editSellListStatusbtn">修改</button>
				</h4>
			</div>
		</div>

		<div class="container">
			<div class="row col-md-8 col-md-offset-1 custyle">
				<table class="table table-striped custab" id="productlist"
					class="productcont">
					<thead>
						<tr>
							<th>商品編號</th>
							<th>商品名稱</th>
							<th>商品狀態</th>
							<th>二手價</th>
							<th>狀態</th>
							<th>備註</th>
							<th></th>
						</tr>
					</thead>
					<tbody class="detailcont">
						<c:forEach var="product" items="${dataLs}">
							<tr>

								<td class="ProductID">${product.ProductID}</td>
								<td class="Title">${product.Title}</td>
								<td class="StatusName">${product.StatusName}<span class="hidden StatusID">${product.StatusID}</span></td>
								<td class="ProductPrice"><fmt:formatNumber type="number"
										value="${product.ProductPrice}" /></td>
								<td class="status">${product.status}</td>
								<td class="Detail">${product.Detail}</td>
                                <td class="hidden Digital">${product.Digital}</td>
								<td class='bookinfo'
									style='display: inline-block; vertical-align: TOP; margin-left: 10pt;'>
									<button class="btn btn-sm btn-primary btn_upt" type="submit"
										data-toggle="modal" data-target="#newCon">Update</button> <!-- 									<button class="btn_del btn btn-sm btn-danger" type="submit">Delete</button> -->
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- DIALOG 修改評論對話框 -->
	<div class="modal fade" id="newCon" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content" style="height:480px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">X <span class="sr-only">Close</span>
						</span>
					</button>
					<h3 class="modal-title">修改商品內容</h3>
				</div>
				<div class="modal-body" style="overflow: auto;">
					<form id="newProductCont">
						<div class="form-gorup col-xs-12">
							<label for="ProductID">商品編號 <input type="text"
								class="form-control hidden" id="ProductID" name="ProductID" value=""
								readonly></input>
							</label><br/>
							<span id="ProductID2"></span>
						</div>
						<div class="form-gorup col-xs-12">
							<label for="inputdefault">商品名稱 
							<input type="text" class="form-control hidden" id="Title" name="Title" value="" readonly></input>
							
							</label><br/>
							<span id="Title2"></span>
						</div>
						<div class="form-gorup col-xs-12">
							<label for="rate">商品狀態 </label> <br/> <select id="StatusName"
								name="StatusName">
								<option value="S0001">未處理</option>
								<option value="S0002">申請上架</option>
								<option value="S0003">審核中</option>
								<option value="S0004">已上架</option>
								<option value="S0005">已下架</option>
								<option value="S0006">義賣</option>
							</select>

						</div>
						<div class="form-gorup col-xs-12">
							<label for="rate">二手價 <input type="number"
								class="form-control" id="ProductPrice" name="ProductPrice" min=30
								value=""></input>
							</label>
						</div>
						<div class="form-gorup col-xs-12">
							<label for="rate">狀態 <!-- 							<input type="text" class="form-control" id="status" name="status" value=""></input> -->
							</label><br /> 
							<select id="status" name="status">
								<option value="全新">全新</option>
								<option value="九成新">九成新</option>
								<option value="八成新">八成新</option>
								<option value="七成新">七成新</option>
								<option value="六成新">六成新</option>
								<option value="五成新">五成新</option>
								<option value="四成新">四成新</option>
								<option value="三成新">三成新</option>
								<option value="二成新">二成新</option>
								<option value="一成新">一成新</option>
							</select>
						</div>
						<div class="form-gorup col-xs-12">
							<label for="Digital">影片連結<input type="text"
								class="form-control" id="Digital" name="Digital" value=""></input>
							</label>
						</div>
						<div class="form-gorup col-xs-12">
							<label for="rate">備註 <input type="text"
								class="form-control" id="Detail" name="Detail" value=""></input>
							</label>
						</div>
						<div class="form-group col-xs-12"
							style="height: 50em; float: right;">
							<button class="btn btn-danger" id="btn_ContS">確定</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
				<!--  modal-footer	-->
			</div>
			<!--  modal-content -->
		</div>
		<!-- modal-dialog modal-md -->
	</div>

	<!-- dialog -->
	<c:import url="/pages/templates/manager/managerfooter.jsp"></c:import>

	<script>
		//塞值到更新的跳出視窗
		$(function() {
			$('#productlist')
					.on(
							'click',
							'.btn_upt',
							function(event) {

								//取值
								var tr = $(this).parents("tr");
								var ProductID = tr.children(".ProductID")
										.text();
								var Title = tr.children(".Title").text();
								var StatusID = tr.find(".StatusID")
										.text();
								var ProductPrice = tr.children(".ProductPrice")
										.text();
								var status = tr.children(".status").text();
								var Digital = tr.children(".Digital").text();
								var Detail = tr.children(".Detail").text();
								//alert(ProductPrice);

								var form = $('#newCon')
								form.find('#ProductID')
										.attr("value", ProductID);
								form.find('#ProductID2').text(ProductID);
								form.find('#Title').attr("value", Title);
								form.find('#Title2').text(Title);
								var option1=form.find('#StatusName option')
								$.each(option1,function(i,opt){
									if($(opt).val()==StatusID){
										$(opt).prop("selected",true);
									}
									
								})
								form.find('#ProductPrice').attr("value",
										ProductPrice);
								form.find('#Digital').attr("value",
										Digital);
								var option2=form.find('#status option');
								$.each(option2,function(i,opt){
									if($(opt).val()==status){
										$(opt).prop("selected",true);
									}
									
								})
								
								form.find('#Detail').attr("value", Detail);

								//Update
								$('#btn_ContS')
										.click(
												function(event) {
													event.preventDefault();
													var data = $('#newProductCont').serialize();
													// 					var ProductID = $('#newProductCont').find('#ProductID').val();
													// 					var Title = $('#newProductCont').find('#Title').val();
													// 					var StatusName = $('#newProductCont').find('#StatusName').val();
													// 					var ProductPrice = $('#newProductCont').find('#ProductPrice').val();
													// 					var status = $('#newProductCont').find('#status').val();
													// 					var Detail = $('#newProductCont').find('#Detail').val();

													// 					alert(StatusName);

													$.post("/ireading/manager/productlaunched.controller/update",data,function(
																			data) {
																		console
																				.log(data[0].change);
																		if (data[0].change == "1") {
																			alert("資料更新成功");
																			location.reload();
																		} else {
																			alert("資料更新失敗");
																		}
																	});

												});
							});
		});
	</script>
<!-- 	<script type="text/javascript" src="./html2canvas.js"></script> -->
	

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>

</html>