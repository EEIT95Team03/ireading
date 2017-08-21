<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style>

</style>

</head>
<body>
 <c:import url="/pages/templates/manager/managermenu.jsp"></c:import>

                    <div  class="col-lg-11 " style="padding-bottom: 50px;">
                 <!--    內容寫這 -->
                    
                        <h1><span class="glyphicon glyphicon-calendar"></span>活動管理</h1>                      
                        <button class="btn btn-lg btn-success" data-toggle="modal" data-target="#newEvent"><span class="glyphicon glyphicon-plus"></span>新增</button>

	<table id="eventDisplay" class="table">
		<thead>
			<tr>
				<th>活動編號</th>
				<th>活動名稱</th>
				<th>活動日期</th>
				<th>主辦單位</th>
				
				<th>截止日期</th>
				
				<th>上限人數</th>
				<th>action</th>
			</tr>
		</thead>

		<c:forEach var="bean" items="${select}">
			<tr>
				<td class="eventID">${bean.eventID}</td>
				<td class="eventName">${bean.eventName}</td>
				<td class="eventDate"><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" 
         value = "${bean.eventDate}" /></td>
				<td class="host">${bean.host}</td>
				<td class="eventPhone hidden">${bean.eventPhone}</td>
				<td class="eventPlace hidden">${bean.eventPlace}</td>
				<td class="eventImg hidden">${bean.eventImg}</td>
				<td class="deadline"><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" 
         value = "${bean.deadline}" /></td>
				<td class="eventContent hidden">${bean.eventContent}</td>
				<td class="max">${bean.max}</td>
				<td><button class="updatebtn btn btn-primary" data-toggle="modal" data-target="#updateEvent">修改</button>
				<button class="deletebtn btn btn-danger data-toggle="modal" data-target="#deleteEvent">刪除</button></td>
			
			</tr>
		</c:forEach>
		</tbody>
	</table>

<!-- Modal-Dialog 新增活動 對話框 -->
	<div class="modal fade" id="newEvent" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title">新增活動</h3>
				</div>

				<div class="modal-body" style="overflow: auto;">

					<!--content goes here -->
					<form id="newform">
						<div class="form-group col-xs-12 col-md-6" style="display: none">
							<label for="EventID">活動編號</label> <input type="text"
								class="form-control" id="new_EventID" name="EventID" value="">
						</div>

						<div class="form-group col-xs-12">
							<label for="EventName">活動名稱</label> <input type="text"
								class="form-control" id="new_EventName" name="EventName">
						</div>

						<div class="form-group col-xs-12">
							<label for="EventDate">活動日期</label> <input type="text"
								class="form-control" id="new_EventDate" name="EventDate"
								value="">
						</div>

						<div class="form-group col-xs-12">
							<label for="Host">活動單位</label> <input type="text"
								class="form-control" id="new_Host" name="Host">
						</div>


						<div class="form-group col-xs-12">
							<label for="EventPhone">連絡電話</label> <input type="text"
								class="form-control" id="new_EventPhone" name="EventPhone">
						</div>

						<div class="form-group col-xs-12">
							<label for="EventPlace">活動地點</label> <input type="text"
								class="form-control" id="new_EventPlace" name="EventPlace">
						</div>

						<div class="form-group col-xs-12">
							<label for="EventImg">活動海報</label> <input type="file"
								id="new_EventImg" name="EventImg">
						</div>

						<div class="form-group col-xs-12">
							<label for="Deadline">截止日期</label> <input type="text"
								class="form-control" id="new_Deadline" name="Deadline"
								value="">
						</div>

						<div class="form-group col-xs-12">
							<label for="EventContent">活動內容</label> <input type="text"
								class="form-control" id="new_EventContent" name="EventContent">
						</div>

						<div class="form-group col-xs-12">
							<label for="Max">上限人數</label> <input type="text"
								class="form-control" id="new_Max" name="Max">
						</div>


						<div class="form-group col-xs-12">
							<button class="btn btn-primary" id="new_btn">新增</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>

					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	
		<!-- Modal-Dialog 修改活動 對話框 -->
	<div class="modal fade" id="updateEvent" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">修改活動</h3>
				</div>

				<div class="modal-body" style="overflow: auto;">

					<!--content goes here -->
					<form id="updateform">

						<div class="form-group col-xs-12 col-md-6">
							<label for="EventID">活動編號</label> <input type="text" readonly="readonly"
								class="form-control" id="new_EventID" name="EventID" value="" >
						</div>
						<div class="form-group col-xs-12">
							<label for="EventName">活動名稱</label> <input type="text"
								class="form-control" id="new_EventName" name="EventName">
						</div>

						<div class="form-group col-xs-12">
							<label for="EventDate">活動日期</label> <input type="text"
								class="form-control" id="new_EventDate" name="EventDate"
								value="">
						</div>

						<div class="form-group col-xs-12">
							<label for="Host">活動單位</label> <input type="text"
								class="form-control" id="new_Host" name="Host">
						</div>

						<div class="form-group col-xs-12">
							<label for="EventPhone">連絡電話</label> <input type="text"
								class="form-control" id="new_EventPhone" name="EventPhone">
						</div>

						<div class="form-group col-xs-12">
							<label for="EventPlace">活動地點</label> <input type="text"
								class="form-control" id="new_EventPlace" name="EventPlace">
						</div>

						<div class="form-group col-xs-12">
							<label for="EventImg">活動海報</label> <input type="file"
								id="new_EventImg" name="EventImg">
						</div>

						<div class="form-group col-xs-12">
							<label for="Deadline">截止日期</label> <input type="text"
								class="form-control" id="new_Deadline" name="Deadline">
						</div>

						<div class="form-group col-xs-12">
							<label for="EventContent">活動內容</label> <input type="text"
								class="form-control" id="new_EventContent" name="EventContent">
						</div>

						<div class="form-group col-xs-12">
							<label for="Max">上限人數</label> <input type="number"
								class="form-control" id="new_Max" name="Max">
						</div>

						<div class="form-group col-xs-12">
							<button class="btn btn-primary" id="up_btn">修改</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
                    </div>
                    
               


<c:import url="/pages/templates/manager/managerfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<!-- 新增活動 -->
<script>
	$(function() {
		$('#new_btn').click(
				function(event) {
					event.preventDefault();
					var data = $('#newform').serialize();
					$.post("/ireading/manager/event.controller/insert", data,
							function(data) {
								console.info(data)
								if ("1" == data) {
									alert("新增活動資料成功");
									location.reload();
								} else {
									lert("新增活動資料失敗");
									// 	        			$('#new_BCID + .msg').text(data[0].BCID);
								}
							});
				});
	});
</script>

<!-- 修改書櫃	 -->
<script>
	$(function() {
		$('#up_btn').click(
				function(event) {
					event.preventDefault();
					var data = $('#updateform').serialize();
					$.post("/ireading/manager/event.controller/update", data,
							function(data) {
								console.log(data)
								if (data[0].change == "1") {
									alert("修改活動資料成功");
									location.reload();
								} else {
									if (data[0].error != "") {
										alert(data[0].error);
									} else {
										alert("修改活動資料失敗");
									}
									// 	        			$('#new_BCID + .msg').text(data[0].BCID);
								}
							});
				});
	});
</script>

<!--  更新活動  塞值-->
<script>
	$(function() {
		$("#eventDisplay").on(
				"click",
				".updatebtn",
				function(event) {
					var div = $(this).parents("tr");
					
					$("#updateEvent").find("#new_EventID").attr("value",
							div.children('.eventID').text());
					$("#updateEvent").find("#new_EventName").attr("value",
							div.children('.eventName').text());
					$("#updateEvent").find("#new_EventDate").attr("value",
							div.children('.eventDate').text());
					$("#updateEvent").find("#new_Host").attr("value",
							div.children('.host').text());
					$("#updateEvent").find("#new_EventPhone").attr("value",
							div.children('.eventPhone').text());
					$("#updateEvent").find("#new_EventPlace").attr("value",
							div.children('.eventPlace').text());
					$("#updateEvent").find("#new_EventImg").attr("value",
							div.children('.eventImg').text());
					$("#updateEvent").find("#new_Deadline").attr("value",
							div.children('.deadline').text());
					$("#updateEvent").find("#new_EventContent").attr("value",
							div.children('.eventContent').text());
					$("#updateEvent").find("#new_Max").attr("value",
							div.children('.max').text());
				
				});
	})
	
</script>

<!-- 刪除活動 -->
	<script>
		$(function() {				
			$('#eventDisplay').on('click','.deletebtn',function() {
				
			var eventID = $(this).parents("tr").children('.eventID').text();
			console.log(eventID);
			if (confirm("確定要刪除此筆活動？")) {
			$.post("/ireading/manager/event.controller/delete", {EventID : eventID}, 
				function(data) {
				if (data[0].change == 1) {
					location.reload();
					} else {alert("活動編號 " + data[0].eventID + " 刪除失敗");
				location.reload();
				}
				});
			}
		});
	});
</script>
</html>