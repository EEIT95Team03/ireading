<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="http://malsup.github.com/jquery.form.js"></script>

<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>
<body>
 <c:import url="/pages/templates/user/usermenu.jsp"></c:import>

                    <div class="col-lg-25 col-lg-offset-1">
                 <!--    內容寫這 -->
                    
                        <h1></span> 我的活動</h1>                      
                       <br>
                       
                        <table class="table table-striped custab" id="myEvent">
								<thead>
									<tr>
										<th style="width: 100px" class="text-center">活動編號</th>
										<th style="width: 350px" class="text-center">活動名稱</th>
										<th style="width: 250px" class="text-center">活動日期</th>
										<th style="width: 300px" class="text-center">主辦單位</th>
										<th style="width: 200px" class="text-center">電話</th>
										<th style="width: 250px" class="text-center">活動地點</th>
										<th style="width: 200px" class="text-center">報名截止日期</th>
										<th style="width: 500px" class="text-center">活動內容</th>
										<th style="width: 200px" class="text-center">動作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="myjoinlist" items="${myjoinlist}" varStatus="loop">
										<tr>
										    <td class="text-center hidden " headers="MemberID" id='mem${loop.index }'>${myjoinlist.MemberID}</td>
											<td class="text-center" headers="EventID" id='event${loop.index }'>${myjoinlist.EventID}</td>
											<td class="text-center" class="EventName">${myjoinlist.EventName}</td>
											<td class="text-center" class="EventDate">
											<fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${myjoinlist.EventDate}" />
                                            </td>
											<td class="text-center" class="Host">${myjoinlist.Host}</td>
											<td class="text-center" class="EventPhone">${myjoinlist.EventPhone}</td>
											<td class="text-center" class="EventPlace">${myjoinlist.EventPlace}</td>
											<td class="text-center" class="Deadline">
											<fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${myjoinlist.Deadline}" />
											</td>
											<td class="text-center" class="EventContent">${myjoinlist.EventContent}</td>
											<td>
<%-- 											<form action="<c:url value="/browse/joinevent.controller/delete"/>" method="post"> --%>
												<button class="deletebtn" data-toggle="modal" data-target="#deleteEvent" onclick="deleteJoin(mem${loop.index }, event${loop.index })">取消參加</button>
<!-- 											</form> -->
											</td>
										</tr>
										</c:forEach>
								</tbody>
							</table>
                    </div>
                    
      <div class="modal fade" id="deleteConfirm" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md" style="padding-top: 200px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">X</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">刪除活動成功！</h3>
				</div>
				<div class="modal-body" style="overflow: auto;">
					<button  id='deleteBtn' onclick="closeable()" class="btn" style='background-color: #80beb0; color: white' data-dismiss="modal">關閉</button>
				</div>
			</div>
		</div>
	</div>
                    

<c:import url="/pages/templates/user/userfooter.jsp"></c:import>

</body>
 <script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/js/login.js"/>"></script>
 <!-- 刪除活動 -->
	<script>
	function closeable() {
		$('#deleteConfirm').modal('toggle');
		location.reload();
	}
	
	
	function deleteJoin(m, n) {
		var MemberID = $(m).text();
		var EventID = $(n).text();
		if (confirm("確定要取消參加活動？")) {
			console.log(MemberID);
			console.log(EventID);			
			$.ajax({
				type:'post',		
				url:'/ireading/user/joinevent.controller/delete',
				data:{
					'EventID': EventID,
					'MemberID': MemberID
				},		
				success:function(json){
					console.log(typeof json[0].change);
					if(json[0].change==1){
						$('#deleteConfirm').modal('toggle');
					}
					else{
						alert('活動編號：' + json[0].EventID + "取消失敗");
					}
					return false;
				}
			})
		}}
				
</script>

</html>