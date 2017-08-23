<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱管理者後台</title>

   <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">  
    <!--jQuery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
  <script src="<c:url value="/js/jquery.tablesorter.js"/>"></script>

    <link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">
     <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>
<body>
 <c:import url="/pages/templates/manager/managermenu.jsp"></c:import>

                    <div  class="col-lg-11" style="padding-bottom: 50px;">
                 <!--    內容寫這 -->
                     <h1><span class="glyphicon glyphicon-shopping-cart"></span>訂單管理</h1>
                     <a class="btn btn-lg btn-success" href="<c:url value="/manager/order.controller"/>">回上一頁</a>   
                     <h1>訂單編號:<span style="color:blue;">${OrderID}</span></h1>
                        <div class="col-md-12">
                        <div class="col-xs-12 col-md-5">
					<form id="editform" action="<c:url value="/orderinfo.controller"/>" method="post">
						<input
								type="text" class="form-control hidden" id="orderid" name="OrderID"
								value="${order.orderID}" readonly />
						<ul class="list-group">				
							<li class="list-group-item"><label for="orderdate">訂單日期</label><span class="msg"></span>
								<input type="datetime" class="form-control" id="orderdate"
								name="Odate" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${order.odate}"/>" readonly /></li>
								
							<li class="list-group-item"><label for="invoice">發票號碼</label><span class="msg"></span>
								<input type="text" class="form-control" id="invoice"
								name="Oinvoice" value="${order.invoice}" /></li>
							<li class="list-group-item"><label for="memberid">會員編號</label><span class="msg"></span>
								<input type="text" class="form-control" id="memberid"
								name="memberid" value="${order.memberID}" readonly />
							</li>
							<li class="list-group-item"><label for="status">訂單狀態</label><span class="msg"></span>
								<select id="status" name="status">
									<option value="OS001"
										<c:if test="${order.orderStatusBean.statusID eq 'OS001'}">selected</c:if>>收到訂單</option>
									<option value="OS002"
										<c:if test="${order.orderStatusBean.statusID eq 'OS002'}">selected</c:if>>待付款</option>
									<option value="OS003"
										<c:if test="${order.orderStatusBean.statusID eq 'OS003'}">selected</c:if>>訂單處理中</option>
									<option value="OS004"
										<c:if test="${order.orderStatusBean.statusID eq 'OS004'}">selected</c:if>>配送中</option>
									<option value="OS005"
										<c:if test="${order.orderStatusBean.statusID eq 'OS005'}">selected</c:if>>已到貨</option>
									<option value="OS006"
										<c:if test="${order.orderStatusBean.statusID eq 'OS006'}">selected</c:if>>訂單取消</option>
							</select></li>
							<li class="list-group-item"><label for="total">訂單金額</label><span class="msg"></span>
								<input type="number" class="form-control" id="total"
								name="Ototal" value="${order.ototal}" /></li>
							<li class="list-group-item"><label for="pay">付款方式</label><span class="msg"></span> <c:choose>
									<c:when test="${order.paid eq '0'}">
										<select id="pay" name="pay">
											<option value="P0001"
												<c:if test="${order.payBean.payID eq 'P0001'}">selected</c:if>>信用卡</option>
											<option value="P0002"
												<c:if test="${order.payBean.payID  eq 'P0002'}">selected</c:if>>ATM轉帳</option>
										</select>
										<input class="hidden" type="text" name="Opaid" value="0"
											readonly />
										</br>
										<p class="glyphicon glyphicon-remove text-danger">未付款</p>
									</c:when>
									<c:when test="${order.paid eq '1'}">
										<c:if test="${order.payBean.payID eq 'P0001'}">
											<input class="hidden" type="text" name="pay" value="P0001"
												readonly />
											<p>信用卡</p>
										</c:if>
										<c:if test="${order.payBean.payID  eq 'P0002'}">
											<input class="hidden" type="text" name="pay" value="P0002"
												readonly />
											<p>ATM轉帳</p>
										</c:if>
										<input class="hidden" type="text" name="Opaid" value="1"
											readonly />
										<p class="glyphicon glyphicon-ok text-success">已付款</p>
									</c:when>
								</c:choose></li>

							<li class="list-group-item"><label for="reciepient">收件人</label>
								<input type="text" class="form-control" id="reciepient"
								name="Reciepient" value="${order.reciepient}" /></li>
							<li class="list-group-item"><label for="addr">寄送地址</label> <input
								type="text" class="form-control" id="addr" name="Oaddr"
								value="${order.oaddr}" /></li>
							<li class="list-group-item"><label for="memo">備註</label> <textarea
									class="form-control" style="resize: vertical;" id="memo"
									name="Omemo" value="${order.omemo}">${order.omemo}</textarea></li>
						</ul>
						<button class="btn btn-primary savebtn" name="orderaction"
							value="update">儲存</button>
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
                        
                    </div>
                    
               


<c:import url="/pages/templates/manager/managerfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script>
	$(function() {
		$('#ODtable').on('click', '.deleteOD', function() {
			var pid = $(this).parents("tr").children('.productID').text();
			console.log(pid);
			var oid = $('#orderid').attr('value');
			console.log(oid);
			if (confirm("確定要刪除這個商品?")) {
				$.post("/ireading/manager/orderdetail.controller/delete", {
					OrderID : oid,
					ProductID : pid
				}, function(data) {
					if(data[0].change=="1")
						{
						location.reload();
						}
					else{alert("刪除失敗");
					location.reload();}
					
				});
			}
		});
		
		$('.savebtn').click(function(event){
			event.preventDefault();
			var data=$('#editform').serialize();
			$.post("/ireading/manager/order.controller/edit/update",data,function(data){
				console.log(data);
				
				if(data[0].change=="1"){
					alert("更新成功");
				}
				else{alert("更新失敗");}
				
			})
		});
		
	})
</script>
</html>