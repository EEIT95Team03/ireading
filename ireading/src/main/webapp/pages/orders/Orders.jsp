<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>訂單清單</title>

<!-- 最新編譯和最佳化的 CSS --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"> 
<!-- 選擇性佈景主題 --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css"> 

<%-- <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" /> --%>
<%-- <link href="<c:url value="/css/bootstrap-theme.min.css"/>" --%>
<!-- 	rel="stylesheet" /> -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 最新編譯和最佳化的 JavaScript --> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js">
</script>
<%-- <script src="<c:url value="/js/bootstrap.min.js"/>"></script> --%>
</head>
<body>
	<div class="container">
		<div class="row col-md-8 col-md-offset-2 custyle">
		<button class="btn btn-primary btn-xs pull-right" data-toggle="modal" data-target="#neworder"><b>+</b>新增訂單</button>
			<table class="table table-striped custab" id="orderlist">
				<thead>
					<tr>
						<th>訂單編號</th>
						<th>訂單日期</th>
						<th>會員編號</th>
						<th>訂單狀態</th>
						<th class="text-center">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orders}">
						<tr>
							<td class="oid">${order.orderID}</td>
							<td>${order.odate}</td>
							<td>${order.memberID}</td>
							<td>${order.orderStatusBean.statusName}</td>
							<td class="text-center"> 
							<c:url value="/order.controller/${order.orderID}" var="link"/>
								<a class='btn btn-info btn-xs editbtn' href="${link}"> <span
									class="glyphicon glyphicon-edit"></span>Edit</a>
									<button class="btn btn-danger btn-xs deletebtn">
										<span class="glyphicon glyphicon-remove"></span>Del
									</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<div class="modal fade" id="neworder" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">新增訂單</h3>
                </div>
                <div class="modal-body" style="overflow: auto;">
                    <!-- content goes here -->
                    <form id="newform">
                        <div class="form-group col-xs-12 col-md-6">
                            <label for="memberid">會員編號</label>
                            <input type="text" class="form-control" id="new_memberid" name="memberid" value="" >
                            <label class="msg"></label>
                        </div>
                        <div class="form-group col-xs-12">
                            <label for="status">訂單狀態</label>
                            <select  id="status" name="status">
                                <option value="OS001">收到訂單</option>
                                <option value="OS002">待付款</option>
                                <option value="OS003">訂單處理中</option>
                                <option value="OS004">配送中</option>
                                <option value="OS005">已到貨</option>
                                <option value="OS006">訂單取消</option>
                            </select>
                        </div>
                         <div class="form-group col-xs-12">
                         <label for="pay">付款方式</label>
                            <select id="pay" name="pay">
                                <option value="P0001">信用卡</option>
                                <option value="P0002">ATM轉帳</option>
                            </select></div>
                        <div class="form-group">                          
                            <div class="form-group col-xs-12">
                                <label for="reciepient">收件人</label>
                                <input type="text" class="form-control" id="new_reciepient" name="reciepient" value="">
                            </div>
                            <div class="form-group col-xs-12">
                                <label for="addr">寄送地址</label>
                                <input type="text" class="form-control" id="new_addr" name="oaddr" value="">
                            </div>
                            <div class="form-group col-xs-12">
                                <label for="memo">備註</label>
                                <textarea class="form-control" style="resize: vertical;" id="new_memo" name="omemo" value=""></textarea>
                            </div>
                        </div>
                        <div class="form-group col-xs-12">
                        <button class="btn btn-primary" id="new_btn">新增</button> <button class="btn btn-default" data-dismiss="modal">取消</button>
                       </div>
                    </form>

                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

</body>
<script>
	$(function() {
        $('#new_btn').click(function(event){
        	event.preventDefault();
        	var data=$('#newform').serialize();
        	$.post("order.controller/insert",data,function(data){
        		if(data[0].change=="0"){
        			alert("新增訂單失敗");
        			$('#new_memberid + .msg').text(data[0].memberid);
				}
        		else{alert("新增訂單成功");
        		location.reload();}
        	});
        	
        });
 
        
		$('#orderlist').on('click', '.deletebtn', function() {
			var id = $(this).parents("tr").children('.oid').text();
			if (confirm("確定要刪除這筆訂單?")) {
				$.post("order.controller/delete", {OrderID : id}, 
				   function(data) {
				if(data[0].change==1){
					location.reload();
				}
				else{
					alert("訂單編號 "+data[0].id+" 刪除失敗");
					location.reload();
				}
				});
			}
		});
// 		$('#orderlist').on('click', '.editbtn', function() {
//			var id = $(this).parents("tr").children('.oid').html();
//			getjson(id);
//		});
// 		function getjson(id) {
// 			$.getJSON('order.json', {
// 				OrderID : id
// 			}, function(data) {
// 				if (data.length != 0) {
// 					$.each(data, function(i, order) {
// 						$('#e_orderid').attr("value", order.orderid);
// 						$('#e_orderdate').attr("value", order.orderdate);
// 						$('#e_invoice').attr("value", order.invoice);
// 						$('#e_memberid').attr("value", order.memberid);
// 						$('#e_status > option').each(function() {
// 							if ($(this).attr("value") == order.status) {
// 								$(this).prop("selected", true);
// 								return false;
// 							}
// 						});
// 						$('#e_total').attr("value", order.total);
// 						$('#e_pay > option').each(function() {
// 							if ($(this).attr("value") == order.pay) {
// 								$(this).prop("selected", true);
// 								return false;
// 							}
// 						});
// 						$('#e_reciepient').attr("value", order.reciepient);
// 						$('#e_addr').attr("value", order.addr);
// 						$('#e_memo').attr("value", order.memo);
// 					});
// 				}
// 			});
// 		}

	})
</script>
</html>