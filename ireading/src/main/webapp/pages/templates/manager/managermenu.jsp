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
            <div class="navbar-header col-sm-12 col-md-6">
                <a class="navbar-brand" href="<c:url value="/pages/manager/home.jsp"/>"><img src="<c:url value="/images/manager_LOGO.png"/>" /></a>
                 </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div>
                <ul class="nav navbar-nav navbar-right">
                    <li id="login"><a id="loginlink" href="<c:url value="/pages/manager/login.jsp"/>" class="show">登出</a>
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
                <div class="container-fluid" style="padding:20px;background-color: #64bae6;">
               
               <h1 class="label text-center" style="font-size: 50px;">功能選單</h1>
                   
                </div>  
                 <li>
                
                    <a href="<c:url value="/pages/member/member_manage.jsp"/>"><span class="glyphicon glyphicon-user"></span>&nbsp;會員管理</a>
                </li>
                <li>
                
                    <a href="<c:url value="/manager/order.controller"/>"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;訂單管理</a>
                </li>
     
                <li>
                    <a href="<c:url value="/user/productlaunched.controller/SearchList?search="/>"><span class="glyphicon glyphicon-tags"></span>&nbsp;二手書上架管理</a>
                </li>
                <li>
                    <a href=""><span class="glyphicon glyphicon-home"></span>&nbsp;商品管理</a>
                </li>
                <li>
                   <a href=""><span class="glyphicon glyphicon-comment"></span>&nbsp;書評管理</a>
                </li>
                <li>
                   <a href=""><span class="glyphicon glyphicon-calendar"></span>&nbsp;活動管理</a>
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
                
                
                
                
                 
    </div>
</body>
</html>