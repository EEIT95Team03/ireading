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
   <link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <!--jQuery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script> 
    
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
                        
                        
                        <div>
                        
                        <form action="<c:url value="/manager/order.controller/search"/>">
                         <div class="form-group col-md-4">
                        <label class="col-xs-4 control-label text-right">訂單編號：</label>
                        <div class="col-xs-7">
                            <input type="text" class="form-control" id="OrderID" name="OrderID" placeholder="請輸入訂單編號" value="${param.OrderID}"/>
                        </div>
                        </div>
                        <div class="form-group col-md-4">
                        <label class="col-xs-4 control-label  text-right">會員編號：</label>
                        <div class="col-xs-7">
                            <input type="text" class="form-control" id="MemberID" name="MemberID" placeholder="請輸入會員編號" value="${param.MemberID}"/>
                        </div>
                        </div>
                         <div class="form-group col-md-4">
                        <label class="col-xs-4 control-label  text-right">訂單狀態：</label>
                        <div class="col-xs-7">
                            <select class="form-control"  id="OrderStatus" name="OrderStatus">
                                <option></option>
						        <option value="OS001" <c:if test="${param.OrderStatus eq 'OS001'}">selected</c:if>>收到訂單</option>
						        <option value="OS002" <c:if test="${param.OrderStatus eq 'OS002'}">selected</c:if>>待付款</option>
						        <option value="OS003" <c:if test="${param.OrderStatus eq 'OS003'}">selected</c:if>>訂單處理中</option>
						        <option value="OS004" <c:if test="${param.OrderStatus eq 'OS004'}">selected</c:if>>配送中</option>
						        <option value="OS005" <c:if test="${param.OrderStatus eq 'OS005'}">selected</c:if>>已到貨</option>
						        <option value="OS006" <c:if test="${param.OrderStatus eq 'OS006'}">selected</c:if>>訂單取消</option>
						       </select>
                        </div>
                        </div>                    
                        <div  class="form-group col-xs-12 text-center"><button type="submit"  class="btn btn-primary btn-md">查詢</button></div>
                        </form>
                        </div>
                                           
              <table class="table table-striped custab" id="orderlist">
				<thead>
					<tr>
						<th>訂單編號</th>
						<th>訂單日期</th>
						<th>會員編號</th>
						<th>付款狀態</th>
						<th>訂單狀態</th>
						<th class="text-center">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orders}">
						<tr>
							<td class="oid">${order.orderID}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${order.odate}"/></td>							
							<td>${order.memberID}</td>
							<td>
							<c:choose>
							<c:when test="${order.Paid eq '1'}">
							<span style="color:green">已付款</span>
							</c:when>
							<c:when test="${order.Paid eq '0'}">
							<span style="color:red">未付款</span>
							</c:when>
							</c:choose>
							</td>
							
							<td>${order.statusName}</td>
							<td class="text-center"> 
								<a class='btn btn-info btn-xs editbtn'  href="<c:url value="/manager/order.controller/edit/${order.orderID}"/>"> <span
									class="glyphicon glyphicon-edit"></span>Edit</a>
									<button class="btn btn-danger btn-xs deletebtn">
										<span class="glyphicon glyphicon-remove"></span>Del
									</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
                    </div>
                    
               


<c:import url="/pages/templates/manager/managerfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script>
$(function(){
	
	  $('#orderlist').DataTable({});
	  
	  
	  $('#orderlist').on('click', '.deletebtn', function() {
			var id = $(this).parents("tr").children('.oid').text();
			if (confirm("確定要刪除這筆訂單?")) {
				$.post("/ireading/manager/order.controller/delete", {OrderID : id}, 
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
	
})
</script>
</html>