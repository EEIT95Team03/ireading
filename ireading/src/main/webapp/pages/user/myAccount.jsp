<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

                    <div  class="col-lg-11 col-lg-offset-1" style="padding-bottom: 50px;">
                 <!--    內容寫這 -->
                    
                        <h1><span class="glyphicon glyphicon-credit-card"></span>我的帳戶</h1>  
                        <h1>享閱帳戶金額共有 <span class="account" style="color:red;"><fmt:parseNumber  value="${Account}" type="number" integerOnly="true"/></span> 元</h1>
                        <div>
                      
                        <div class="col-xs-8 col-sm-6 col-md-4">      
                         <label>匯出金額：</label>               
                        <input type="number" class="form-control" min="30" max="<fmt:parseNumber  value="${Account}" type="number" integerOnly="true"/>" id="output"/>                        
                         <button class="btn btn-warning">匯出</button>   
                        </div>
                        
                        </div>                    
                       
                       <div>
                       <table class="col-xs-12">
                       <thead>
                       <tr>
                       <th class="text-center">匯出時間</th>
                       <th class="text-center">匯出帳號</th>
                       <th class="text-center">實收金額</th>
                       <th class="text-center">手續費</th>
                       <th class="text-center">匯出總額</th>
                       </tr>
                       </thead>
                       <tbody>
                       
                       <c:forEach var="record" items="${OutputList}">
                       <tr>
                       <td class="text-center"><fmt:formatDate value="${record.ApplyTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                       <td class="text-center">${record.BankAccount}</td>
                       <td class="text-center"><fmt:parseNumber  value="${record.Amount}" type="number" integerOnly="true"/></td>
                       <td class="text-center"><fmt:parseNumber  value="${record.Amount-record.TotalTransfer}" type="number" integerOnly="true"/></td>
                       <td class="text-center"><fmt:parseNumber  value="${record.TotalTransfer}" type="number" integerOnly="true"/></td>
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
</html>