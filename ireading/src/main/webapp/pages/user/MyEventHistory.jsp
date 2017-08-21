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
                    
                        <h1><span class="glyphicon glyphicon-calendar"></span> 我的活動</h1> 
                        <div><a class="btn btn-lg btn-success" href="<c:url value="/user/joinevent.controller/myEventList"/>">已報名活動</a>&nbsp;<a class="btn btn-lg btn-info" disabled>已參加活動</a></div>                     
                       <br>
                       
                        <table class="table table-striped custab" id="myEvent">
								<thead>
									<tr>
										<th style="width: 100px" class="text-center">活動編號</th>
										<th style="width: 350px" class="text-center">活動名稱</th>
										<th style="width: 250px" class="text-center">活動日期</th>
										<th style="width: 300px" class="text-center">主辦單位</th>
										<th style="width: 250px" class="text-center">活動地點</th>
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
											<td class="text-center" class="EventPlace">${myjoinlist.EventPlace}</td>
										</tr>
										</c:forEach>
								</tbody>
							</table>
                    </div>
                    
     
                    

<c:import url="/pages/templates/user/userfooter.jsp"></c:import>

</body>
 <script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/js/login.js"/>"></script>
 

</html>