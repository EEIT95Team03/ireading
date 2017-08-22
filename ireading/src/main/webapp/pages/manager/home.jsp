<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 <c:import url="/pages/templates/manager/managermenu.jsp"></c:import>

                   <div  class="col-lg-12" style="padding-bottom: 50px;">
                 <!--    內容寫這 -->
                
   <div class="container">
    <h1><span class="glyphicon glyphicon-home"></span>功能選單</h1>
     <div class="col-xs-6 col-sm-4">
        <a class="btn btn-block btn-lg btn-success menubtn" href="<c:url value="/pages/member/member_manage.jsp"/>"  style="background-color: rgba(86, 120, 193, 0.67);">
            <span style="font-size:100px;padding:5px;" class="glyphicon glyphicon-user"></span><br><br>
            <span class="texto_grande">會員管理</span></a>
      </div>
       <div class="col-xs-6 col-sm-4">
        <a class="btn btn-block btn-lg btn-success menubtn" href="<c:url value="/manager/order.controller"/>" style="background-color: rgba(114, 173, 159, 0.67);;
    border: none;
    padding: 20px;">
            <span style="font-size:100px;padding:5px;" class="glyphicon glyphicon-shopping-cart"></span><br><br>
            <span class="texto_grande">訂單管理</span></a>
      </div>
      <div class="col-xs-6 col-sm-4">
        <a class="btn btn-block btn-lg btn-success menubtn" href="<c:url value="/user/productlaunched.controller/SearchList?search="/>" style="background-color: rgba(193, 86, 91, 0.71);
    border: none;
    padding: 20px;">
            <span style="font-size:100px;padding:5px;" class="glyphicon glyphicon-tags"></span><br><br>
            <span class="texto_grande">二手書上架管理</span></a>
      </div>
           <div class="col-xs-6 col-sm-4">
        <a class="btn btn-block btn-lg btn-success menubtn" href="<c:url value="/manager/Manager.product/selectProduct?search=&search2=&search3="/>" style="background-color: rgba(30, 125, 42, 0.48);
    border: none;
    padding: 20px;">
            <span style="font-size:100px;padding:5px;"  class="glyphicon glyphicon-home"></span><br><br>
            <span class="texto_grande">商品管理</span></a>
      </div>
 <div class="col-xs-6 col-sm-4">
        <a class="btn btn-block btn-lg btn-success menubtn" href="/ireading/manager/books.controller/booksMainPage?Title=&CategoryID=&Year=&ISBN=&Author=&Publisher="  style="background-color: rgba(224, 133, 40, 0.6);
    border: none;
    padding: 20px;">
            <span style="font-size:100px;padding:5px;" class="glyphicon glyphicon-book"></span><br><br>
            <span class="texto_grande">書籍資料維護</span></a>
      </div>
        <div class="col-xs-6 col-sm-4">
        <a class="btn btn-block btn-lg btn-success menubtn" href="<c:url value="/manager/event.controller/seeAllEvent"/>" style="background-color: rgba(197, 112, 159, 0.67);
    border: none;
    padding: 20px;">
            <span style="font-size:100px;padding:5px;" class="glyphicon glyphicon-calendar"></span><br><br>
            <span class="texto_grande">活動管理</span></a>
      </div>
     
   </div>
   </div>                 
                    
               


<c:import url="/pages/templates/manager/managerfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
</html>