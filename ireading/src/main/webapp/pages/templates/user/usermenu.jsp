<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>usermenu</title>
</head>
<body>
<header>
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header col-sm-12 col-md-3">
                <a class="navbar-brand " href="#"><img src="<c:url value="/images/LOGO.png"/>" /></a>
                 </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div>
                <ul class="nav navbar-nav navbar-right">
                    <li id="login"><a href="#">享。登入</a></li>           
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</header>


<div id="wrapper">
        <div class="overlay"></div>
    
        <!-- Sidebar -->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
            <div>
            
            </div>
            <ul class="nav sidebar-nav">
                <!--<li class="sidebar-brand">-->
                <div class="container-fluid" style="text-align:center;background-color: #98d7f7;padding:5%;border-bottom-left-radius:50px;border-bottom-right-radius:50px;margin-bottom:20px;">
                <h1 id="username" style="color:white;font-family:微軟正黑體;font-weight:700;">米小奇</h1>
                <div id="userPic" style="margin:25px">
                <img src="http://pic.gomaji.com/uploads/stores/072/72/50241/1.jpg" alt="username" class="img-circle img-responsive" style="background-color:white;margin:auto;border:8px solid #efefef; box-shadow:2px 2px 5px gray; width:220px;height:220px">
                </div>
                    <button type="button" class="btn btn-warning" style="font-family:微軟正黑體;font-weight:500;"><span class="glyphicon glyphicon-pencil"></span>&nbsp;個人資料</button>  
                </div>  
                <li>
                
                    <a href="<c:url value="/user/myorder/getOrders"/>"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;我的訂單</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-credit-card"></span>&nbsp;我的帳戶</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-tags"></span>&nbsp;二手書上架申請</a>
                </li>
                <li>
                    <a href="<c:url value="/user/product/sellBook"/>"><span class="glyphicon glyphicon-home"></span>&nbsp;我的書店</a>
                </li>
                <li>
                    <a href="<c:url value='/user/bookcase'/>"><span class="glyphicon glyphicon-book"></span>&nbsp;我的書櫃</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-calendar"></span>&nbsp;我的活動</a>
                </li>
            </ul>
        </nav>
        <!-- /#sidebar-wrapper -->
        
                <!-- Page Content -->
        <div id="page-content-wrapper">
            <button type="button" class="hamburger is-closed" data-toggle="offcanvas">
                <span class="hamb-top"></span>
    			<span class="hamb-middle"></span>
				<span class="hamb-bottom"></span>
            </button>
            <div id="content_block" class="container">
                <div class="row">
</body>
</html>