<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱管理者後台</title>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <style>
        body {
       background: url("/ireading/images/manager_img.png") no-repeat center center fixed; 
        
        }
        .main { 
            padding:20px;
             background-color:#80beb0;          
             border-radius:15px;
             margin-top:15%;
        }


    </style>
</head>
<body>
 <div class="main col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
        <div class="text-center"><img src="/ireading/images/manager_LOGO.png" /></div>
        <div class="col-xs-12" style="background-color:white;padding:30px;border-radius:15px;">
        <form action="<c:url value="/manager/login.manager"/>" method="post">
         <div class="form-group text-center"><span id="msg" style="color:red">${InvalidLogin}</span></div>
            <div class="form-group text-center"><label>帳號 </label> <input type="text" name="Account" value="${param.Account}"/><br><span style="color:red">${error.account}</span></div>
            <div class="form-group text-center"><label>密碼 </label><input type="password" name="Password" value=""/><br><span style="color:red">${error.password}</span></div>
            
            <div class="form-group text-center"> <button type="submit" class="btn btn-primary btn-lg">登入</button></div>                           
        </form>
        </div>
    </div>
</body>
</html>