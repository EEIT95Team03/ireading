<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"> 
   
    
    <!--jQuery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <!--jQuery UI-->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <!--w3 css-->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">
</head>
<body>
 <c:import url="/pages/templates/user/usermenu.jsp"></c:import>

                    <div class="col-lg-10 col-lg-offset-1">
                 <!--    內容寫這 -->
                    
                        <h1><span class="glyphicon glyphicon-shopping-cart"></span> 我的訂單</h1>                      
                       <br>
                       <h4 class="text-right">共 <strong style="color:red">${OrderCount}</strong> 筆</h4>
                        <table class="table table-striped custab">
								<thead>
									<tr>
										<th class="text-center">訂單編號</th>
										<th class="text-center">訂購時間</th>
										<th class="text-center">付款方式</th>
										<th class="text-center">訂單金額</th>
										<th class="text-center">訂單狀態</th>
										<th class="text-center">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="order" items="${Orders}">
										<tr>
											<td class="text-center" class="OrderID">${order.orderID}</td>
											<td class="text-center" class="odate">${order.odate}</td>
											<td class="text-center" class="pay">${order.payBean.payType}</td>
											<td class="text-center" class="total">${order.ototal}</td>
											<td class="text-center" class="status">${order.orderStatusBean.statusName}</td>
											<td class="text-center" class="text-center">
												<a class="btn btn-primary btn-md viewOrder" 
												href="<c:url value="/user/myorder/getOD/${order.orderID}"/>">												
													<span class="glyphicon glyphicon-search">訂單明細</span>
												</a>
											</td>
										</tr>
										</c:forEach>
								</tbody>
							</table>
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