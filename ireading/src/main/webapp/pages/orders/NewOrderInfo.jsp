<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>訂單資訊</title>
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/css/bootstrap-theme.min.css"/>"
	rel="stylesheet" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<style>
.well {
	overflow: auto;
}
</style>
</head>
<body>
	<div class="row order-info">

		<div class="col-md-12">
			<div class="well">

				<div class="form-horizontal">
					<div class="form-group">
						<label for="inputOrderTrackingID" class="col-sm-2 control-label">Order
							id</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputOrderTrackingID"
								value="" placeholder="# put your order id here" />
							<button type="button" id="shopGetOrderStatusID"
								class="btn btn-success">Get status</button>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-md-5">
					<form action="<c:url value="/orderinfo.controller"/>" method="post">
						<ul class="list-group">
							<li class="list-group-item">
								<h3>訂單資訊</h3>
							</li>
							<li class="list-group-item"><label for="memberid">會員編號</label>
								<input type="text" class="form-control" id="memberid"
								name="memberid" value="${order.memberID}"  /><label></label>
							</li>
							<li class="list-group-item"><label for="status">訂單狀態</label>
								<select id="status" name="status">
									<option value="OS001" <c:if test="${order.orderStatusBean.statusID eq 'OS001'}">selected</c:if>>收到訂單</option>
									<option value="OS002"<c:if test="${order.orderStatusBean.statusID eq 'OS002'}">selected</c:if>>待付款</option>
									<option value="OS003"<c:if test="${order.orderStatusBean.statusID eq 'OS003'}">selected</c:if>>訂單處理中</option>
									<option value="OS004"<c:if test="${order.orderStatusBean.statusID eq 'OS004'}">selected</c:if>>配送中</option>
									<option value="OS005"<c:if test="${order.orderStatusBean.statusID eq 'OS005'}">selected</c:if>>已到貨</option>
									<option value="OS006"<c:if test="${order.orderStatusBean.statusID eq 'OS006'}">selected</c:if>>訂單取消</option>
							</select></li>
							<li class="list-group-item"><label for="total">訂單金額</label>
								<input type="number" class="form-control" id="total"
								name="Ototal" value="${order.ototal}" /></li>
							<li class="list-group-item"><label for="pay">付款方式</label> 
							
							<select
								id="pay" name="pay">
									<option value="P0001" <c:if test="${order.payBean.payID eq 'P0001'}">selected</c:if>>信用卡</option>
									<option value="P0002" <c:if test="${order.payBean.payID  eq 'P0002'}">selected</c:if>>ATM轉帳</option>
							</select>
							</li>

							<li class="list-group-item"><label for="reciepient">收件人</label>
								<input type="text" class="form-control" id="reciepient"
								name="Reciepient" value="${order.reciepient}" /></li>
							<li class="list-group-item"><label for="addr">寄送地址</label> <input
								type="text" class="form-control" id="addr" name="Oaddr"
								value="${order.oaddr}" /></li>
							<li class="list-group-item"><label for="memo">備註</label> <textarea
									class="form-control" style="resize:vertical;" id="memo" name="Omemo"
									value="${order.omemo}" >${order.omemo}</textarea></li>
						</ul>
						<button type="submit" class="btn btn-primary" name="orderaction" value="insert">儲存</button>
					</form>
					<br />
				</div>
				<div class="col-xs-12 col-md-7">
					<ul class="list-group">
						<li class="list-group-item">
							<h3>訂單明細</h3>
							<table class="table table-striped custab" id="ODtable">
								<thead>
									<tr>
										<th>商品編號</th>
										<th>書籍名稱</th>
										<th>商品狀態</th>
										<th>價格</th>
										<th class="text-center">Action</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="OD" items="${OrderDetails}">
									<tr>
										<td class="productID">${OD.productBean.productID}</td>
										<td class="title">${OD.productBean.booksBean.title}</td>
										<td class="status">${OD.productBean.status}</td>
										<td class="productPrice">${OD.productBean.productPrice}</td>
										<td class="text-center">
										<button class="btn btn-danger btn-xs deleteOD">
										<span class="glyphicon glyphicon-trash"></span>
										</button>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</li>
					</ul>
				</div>
			
			</div>
		</div>

	</div>

</body>

<script>
$(function() {
	
	
})

</script>
</html>