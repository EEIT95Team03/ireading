<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style >
    .texto_grande {
    font-size: 2.5rem;
    color: white;
} 
.icone_grande {
    font-size: 8rem;
    color:#fff;
} 

.menubtn{
margin-bottom: 50px;
border: none;
padding: 20px;
}
    </style>
</head>
<body>
 <c:import url="/pages/templates/user/usermenu.jsp"></c:import>

       <div  class="col-lg-12" style="padding-bottom: 50px;">
                 <!--    內容寫這 -->
                
   <div class="container">
    <h1><span class="glyphicon glyphicon-home"></span>會員中心</h1>
     <div class="col-xs-6 col-sm-4 col-md-3">
        <a class="btn btn-block btn-lg btn-success menubtn"  style="background-color: rgba(86, 120, 193, 0.67);">
            <span style="font-size:100px;padding:5px;" class="glyphicon glyphicon-user"></span><br><br>
            <span class="texto_grande">編輯帳號資訊</span></a>
      </div>
       <div class="col-xs-6 col-sm-4 col-md-3">
        <a class="btn btn-block btn-lg btn-success menubtn" href="<c:url value="/user/myorder/getOrders"/>" style="background-color: rgba(114, 173, 159, 0.67);;
    border: none;
    padding: 20px;">
            <span style="font-size:100px;padding:5px;" class="glyphicon glyphicon-shopping-cart"></span><br><br>
            <span class="texto_grande">我的訂單</span></a>
      </div>
         <div class="col-xs-6 col-sm-4 col-md-3">
        <a class="btn btn-block btn-lg btn-success menubtn" href="<c:url value="/user/account"/>"  style="background-color: rgba(230, 109, 51, 0.68);
    border: none;
    padding: 20px;">
            <span style="font-size:100px;padding:5px;" class="glyphicon glyphicon-credit-card"></span><br><br>
            <span class="texto_grande">我的帳戶</span></a>
      </div>
      <div class="col-xs-6 col-sm-4 col-md-3">
        <a class="btn btn-block btn-lg btn-success menubtn" href="<c:url value="/pages/user/ApplyToSell.jsp"/>" style="background-color: rgba(193, 86, 91, 0.71);
    border: none;
    padding: 20px;">
            <span style="font-size:100px;padding:5px;" class="glyphicon glyphicon-tags"></span><br><br>
            <span class="texto_grande">申請賣書</span></a>
      </div>
           <div class="col-xs-6 col-sm-4 col-md-3">
        <a class="btn btn-block btn-lg btn-success menubtn" href="<c:url value="/user/product/sellBook"/>" style="background-color: rgba(30, 125, 42, 0.48);
    border: none;
    padding: 20px;">
            <span style="font-size:100px;padding:5px;" class="glyphicon glyphicon-home"></span><br><br>
            <span class="texto_grande">我的書店</span></a>
      </div>
       <div class="col-xs-6 col-sm-4 col-md-3">
        <a class="btn btn-block btn-lg btn-success menubtn" href="<c:url value='/user/bookcase'/>" style="background-color: rgba(110, 23, 132, 0.51);
    border: none;
    padding: 20px;">
            <span style="font-size:100px;padding:5px;"  class="glyphicon glyphicon-book"></span><br><br>
            <span class="texto_grande">我的書櫃</span></a>
      </div>
          <div class="col-xs-6 col-sm-4 col-md-3">
        <a class="btn btn-block btn-lg btn-success menubtn" href="<c:url value='/user/review.controller/getReview'/>" style="background-color: rgba(199, 194, 21, 0.55);
    border: none;
    padding: 20px;">
            <span style="font-size:100px;padding:5px;" class="glyphicon glyphicon-comment"></span><br><br>
            <span class="texto_grande">我的書評</span></a>
      </div>
        <div class="col-xs-6 col-sm-4 col-md-3">
        <a class="btn btn-block btn-lg btn-success menubtn" href="<c:url value="/user/joinevent.controller/myEventList"/>"  style="background-color: rgba(197, 112, 159, 0.67);
    border: none;
    padding: 20px;">
            <span style="font-size:100px;padding:5px;" class="glyphicon glyphicon-calendar"></span><br><br>
            <span class="texto_grande">我的活動</span></a>
      </div>
     
   </div>
   </div>                 
               


<c:import url="/pages/templates/user/userfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/login.js"/>"></script>
</html>