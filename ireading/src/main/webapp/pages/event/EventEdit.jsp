<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<title>活動總覽</title>
<style>
body {
	font-family: 微軟正黑體;
}

table {
	font-family: "微軟正黑體", "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 14px;
	margin: 45px;
	width: 850px;
	text-align: left;
	border-collapse: collapse;
	position: relative;
	left: 50px;
	table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。  */ 
	text-align: center;
}

th {
	font-size: 14px;
	font-weight: normal;
	padding: 8px;
	background: #b9c9fe;
	border-top: 4px solid #aabcfe;
	border-bottom: 1px solid #fff;
	color: #039;
	text-align: center;
}

td {
	padding: 8px;
	background: #e8edff;
	border-bottom: 1px solid #fff;
	color: #669;
	border-top: 1px solid transparent;
    word-break:keep-all;/* 不换行 */  
    white-space:nowrap;/* 不换行 */ 
    overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */  
    text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/  
    text-align: center;
}

tr:hover td {
	background: #d0dafd;
	color: #339;
}
</style>

</head>

<body>

    <h3><a href="<c:url value="/pages/event/Event.jsp" />">回活動主頁面</a></h3>

	<button data-toggle="modal" data-target="#newEvent">新增</button>

	<table id="eventDisplay">
		<thead>
			<tr>
				<th>活動編號</th>
				<th>活動名稱</th>
				<th>活動日期</th>
				<th>主辦單位</th>
				<th>連絡電話</th>
				<th>活動地點</th>
				<th>活動海報</th>
				<th>截止日期</th>
				<th>活動詳情</th>
				<th>上限人數</th>
				<th>系統編輯</th>
				<th>系統刪除</th>
			</tr>
		</thead>

		<c:forEach var="bean" items="${select}">
			<c:url value="/pages/event/Event.jsp" var="link">
				<c:param name="eventID" value="${bean.eventID}" />
				<c:param name="eventName" value="${bean.eventName}" />
				<c:param name="eventDate" value="${bean.eventDate}" />
				<c:param name="host" value="${bean.host}" />
				<c:param name="eventPhone" value="${bean.eventPhone}" />
				<c:param name="eventPlace" value="${bean.eventPlace}" />
				<c:param name="eventImg" value="${bean.eventImg}" />
				<c:param name="deadline" value="${bean.deadline}" />
				<c:param name="eventContent" value="${bean.eventContent}" />
				<c:param name="max" value="${bean.max}" />
			</c:url>

			<tr>
				<td class="eventID">${bean.eventID}</td>
				<td class="eventName">${bean.eventName}</td>
				<td class="eventDate"><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" 
         value = "${bean.eventDate}" /></td>
				<td class="host">${bean.host}</td>
				<td class="eventPhone">${bean.eventPhone}</td>
				<td class="eventPlace">${bean.eventPlace}</td>
				<td class="eventImg">${bean.eventImg}</td>
				<td class="deadline"><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" 
         value = "${bean.deadline}" /></td>
				<td class="eventContent">${bean.eventContent}</td>
				<td class="max">${bean.max}</td>
				<td><button class="updatebtn" data-toggle="modal" data-target="#updateEvent">修改</button></td>
				<td><button class="deletebtn" data-toggle="modal" data-target="#deleteEvent">刪除</button></td>
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
	

</body>


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
