<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"> 
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    
    <!--jQuery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!--jQuery UI-->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">
</head>
<body>
 <c:import url="/pages/templates/user/usermenu.jsp"></c:import>
 <div class="col-lg-10 col-lg-offset-1">
                 <!--    內容寫這 -->
                    
                        <h1><span class="glyphicon glyphicon-shopping-cart"></span> 我的訂單</h1>                      
                       <br>
                       <div>
                       <h3><label>訂單編號: </label> ${Order.orderID}</h3>
                       <p><label class="glyphicon glyphicon-time"> 訂單時間: </label> ${Order.odate}</p>
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
									<td class="text-center" class="photo">${OD.productBean.booksBean.cover}</td>
									<td class="text-center" class="title">${OD.productBean.booksBean.title}</td>
									<td class="text-center" class="status">${OD.productBean.status}</td>
									<td class="text-center" class="price">${OD.productBean.productPrice}</td>		
									</tr>
									</c:forEach>
								</tbody>				
							</table>
							<h5>訂單總金額: <strong style="color:red;">${Order.ototal}</strong></h5>
							<br>
							<div><label class="glyphicon glyphicon-credit-card"> 付款方式: </label> ${Order.payBean.payType} &nbsp;
							<c:choose>
									<c:when test="${Order.paid eq '0'}"><span class="glyphicon glyphicon-remove text-danger">未付款</span></c:when>
									<c:when test="${Order.paid eq '0'}"><span class="glyphicon glyphicon-ok text-success">已付款</span></c:when>
						    </c:choose>
							</div>
							
							<br>
							
							<h3><span class="glyphicon glyphicon-send"></span> 寄件資訊</h3>
							<div class="col-xs-12 col-md-5" style="background-color:rgba(128, 190, 176, 0.28);border-radius: 15px;padding:10px;">
							<label>收件人: </label>${Order.reciepient}<br>
							<label>寄送地址: </label>${Order.oaddr}<br>
							<label>備註: </label>${Order.omemo}<br>
							</div>
							
							
							</div>
                    </div>


<c:import url="/pages/templates/user/userfooter.jsp"></c:import>
</body>
 <script>

         $(document).ready(function () {
             var trigger = $('.hamburger'),
                 overlay = $('.overlay'),
                isClosed = false;

             trigger.click(function () {
                 hamburger_cross();
             });

             function hamburger_cross() {

                 if (isClosed == true) {
                     overlay.hide();
                     trigger.removeClass('is-open');
                     trigger.addClass('is-closed');
                     isClosed = false;
                 } else {
                     overlay.show();
                     trigger.removeClass('is-closed');
                     trigger.addClass('is-open');
                     isClosed = true;
                 }
             }

             $('[data-toggle="offcanvas"]').click(function () {
                 $('#wrapper').toggleClass('toggled');
             });
         });
  </script>
</html>