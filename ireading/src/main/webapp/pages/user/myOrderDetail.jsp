<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"> 
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
 <c:import url="/pages/templates/user/usermenu.jsp"></c:import>
 <div class="col-lg-10 col-lg-offset-1">
                 <!--    內容寫這 -->
                    
                        <h1><span class="glyphicon glyphicon-shopping-cart"></span> 我的訂單</h1>
                        <a class="btn btn-lg btn-success" href="<c:url value="/user/myorder/getOrders"/>">回上一頁</a>                      
                       <br>
                       <div>
                       <h3><label>訂單編號:</label> ${Order.orderID}</h3>
                       <h4><label class="label label-primary"><span class="glyphicon glyphicon-time"></span>訂單時間: </label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${Order.odate}"/> </h4>
                        <h4><label class="label label-info"> 訂單狀態: </label> ${Order.orderStatusBean.statusName}</h4>
                        <table class="table table-striped custab" id="ODtable" style="border:3px solid rgba(128, 128, 128, 0.27);padding:5px;">
								<thead>
									<tr>
									    <th class="text-center"></th>
										<th class="text-center">商品編號</th>
										<th class="text-center">書籍圖片</th>
										<th class="text-center">書名</th>
										<th class="text-center">書籍狀態</th>
										<th class="text-center">售價</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="OD" items="${OrderDetails}" varStatus="vs">
									<tr>
									<td class="text-center">${vs.index+1}</td>
									<td class="text-center" class="id">${OD.productBean.productID}</td>
									<td class="text-center" class="photo">
									<img style="width:50px" class="img-responsiv" id="item-display" src="data:image/png;base64, ${OD.productBean.booksBean.byteArrayString}"></img></td>
									<td class="text-center" class="title">${OD.productBean.booksBean.title}</td>
									<td class="text-center" class="status">${OD.productBean.status}</td>
									<td class="text-center" class="price">${OD.productBean.productPrice}</td>		
									</tr>
									</c:forEach>
								</tbody>				
							</table>
							<h4><strong>訂單總金額: </strong><strong style="color:red;">${Order.ototal}</strong></h4>
							<br>
							<div><h4><label class="glyphicon glyphicon-credit-card"> <strong>付款方式: </strong></label> ${Order.payBean.payType} &nbsp;
							<c:choose>
									<c:when test="${Order.paid eq '0'}"><span class="glyphicon glyphicon-remove text-danger">未付款</span></c:when>
									<c:when test="${Order.paid eq '1'}"><span class="glyphicon glyphicon-ok text-success">已付款</span></c:when>
						    </c:choose></h4>
							</div>
							
							<br>
							
							<h3><span class="glyphicon glyphicon-send"></span> 寄件資訊</h3>
							<div class="col-xs-12 col-md-7" style="background-color:rgba(128, 190, 176, 0.28);border-radius: 15px;padding:10px;">
							<h4><label>收件人: </label>${Order.reciepient}<br></h4>
							<h4><label>寄送地址: </label>${Order.oaddr}<br></h4>
							<h4><label>備註: </label>${Order.omemo}<br></h4>
							</div>
							
							
							</div>
                    </div>


<c:import url="/pages/templates/user/userfooter.jsp"></c:import>
</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/login.js"/>"></script>
</html>