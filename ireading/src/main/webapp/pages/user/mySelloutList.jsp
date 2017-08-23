<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心</title>

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
                 
                                 <h1><span class="glyphicon glyphicon-home"></span> 我的書店</h1>
                         <div><a class="btn btn-lg btn-primary" href="<c:url value='/user/product/sellBook'/>">上架中二手書</a>&nbsp;&nbsp;&nbsp;<a class="btn btn-lg btn-success" disabled>已出售商品</a> </div/>                  
                       <br>


                         
           <nav class="navbar navbar-default query" role="query">

            <div class="container-fluid">

                <div class="navbar-header">
                 <h1 class="head-title" style="color:white">已出售商品清單</h1>                   
                </div>
              
                    <div class="navbar-form navbar-left col-xs-12 col-sm-4">
                       
                         <select name="query" class="form-control">
                            <option value="3">近3個月</option>
                            <option value="6">近6個月</option>
                            <option value="12">近1年</option>
                            <option value="all">全部</option>
                        </select>
                        <button class="btn btn-default query-btn">查询</button>
                   
                    </div>

                <div class="navbar-right col-xs-12 col-sm-4"><h4 class="text-right"></h4></div>                  
                </div>
        </nav>   
                                             
            <div class="col-sm-12">
            <table class="table table-hover" id="selloutTable">
                <thead>
                    <tr>
                        <th>商品資訊</th>
                        <th class="text-center">細節描述</th>
                        <th class="text-center">售價<span class="glyphicon glyphicon-sort"></span></th>
                         <th class="text-center">實收金額<span class="glyphicon glyphicon-sort"></span></th>
                        <th class="text-center">入帳時間<span class="glyphicon glyphicon-sort"></span></th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="Payment" items="${PaymentList}">
                <tr>
                        <td class="col-md-5">
                        <div class="media">
                            <a class="thumbnail pull-left" href="#"> <img class="media-object" src="data:image/png;base64,${Payment.productBean.booksBean.byteArrayString}" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#">${Payment.productBean.booksBean.title}</a></h4>
                                <h5 class="media-heading"> 編號 <a href="#">${Payment.productBean.productID}</a></h5>
                                <span>使用狀態: </span><span class="text-success"><strong>${Payment.productBean.status}</strong></span>
                            </div>
                        </div></td>
                        <td class="col-md-2 text-center"><strong>${Payment.productBean.detail}</strong></td>
                        <td class="col-md-1 text-center"><strong>${Payment.productBean.productPrice}</strong></td>
                        <td class="col-md-2 text-center"><strong>${Payment.amount}</strong></td>
                        <td class="col-md-2 text-center"><strong><fmt:formatDate value="${Payment.paytime}" pattern="yyyy/MM/dd HH:mm"/></strong></td>
                    </tr>
                
                
                </c:forEach>                  
                   
                </tbody>
            </table>
        </div>
                    </div>
                                  

<c:import url="/pages/templates/user/userfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/login.js"/>"></script>
  <script>         
           $(function () {
             $("#selloutTable").tablesorter();

             
             $(".query-btn").click(function(event){
            	 var action=$("select[name='query']").val();
            	 console.log(action);
            	 if(action=="3"){location.reload();}
            	 $.post("/ireading/user/product/sellout/query",{Action:action},function(data){
            		 console.log(data);
            		 var tbody=$('#selloutTable tbody').empty();
            		 $.each(data,function(i,payment){
            			console.log(payment);
            			 var img=$('<img class="media-object" style="width: 72px; height: 72px;">').attr("src","http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png");
            			var imga=$('<a class="thumbnail pull-left"></a>').attr("href","#").append(img);
            			
            			var title=$('<a></a>').text(payment.productBean.booksBean.Title).attr("href","#");
            			var h4=$('<h4 class="media-heading"></h4>').append(title);            			
            			var pid=$('<a></a>').text(payment.productBean.ProductID).attr("href","#");
            			var h5=$('<h5 class="media-heading"></h5>').text(" 編號 ").append(pid);
            			var s1=$('<span>使用狀態: </span>');
            			var s2=$('<span class="text-success"></span>').append($('<strong></strong>').text(payment.productBean.Status));
            			
            			var mbody=$('<div class="media-body"></div>').append([h4,h5,s1,s2]);
            			
            			var td1=$('<td class="col-md-5"></div>').append($('<div class="media"></div>').append([imga,mbody]));          			
            			var td2=$('<td class="col-md-2 text-center"></td>').append($('<strong></strong>').text(payment.productBean.Detail));
            			var td3=$('<td class="col-md-1 text-center"></td>').append($('<strong></strong>').text(payment.productBean.ProductPrice));
            			var td4=$('<td class="col-md-2 text-center"></td>').append($('<strong></strong>').text(payment.Amount));
            			var td5=$('<td class="col-md-2 text-center"></td>').append($('<strong></strong>').text(payment.Paytime));
            			
            			var tr=$('<tr></tr>').append([td1,td2,td3,td4,td5]);
            			tbody.append(tr);
            		 });
            	 });
            	 
             });
           
         })
  </script>

</html>