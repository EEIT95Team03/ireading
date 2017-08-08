<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱</title>
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/js/jquery.tablesorter.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/CartStep.css'/>">
</head>
<body>
	<c:import url="/pages/templates/front/frontmenu.jsp"></c:import>
	  <div class="container main">
    <div class="row">
        <div id="step" class="box vpadding text-center"><img class="pic_timeline02 img-responsive" src="//jci.book.com.tw/css/books/m_cart2015/images/time_line_step3_zh-tw.png"></div>
       <h2 class="labelbox"><span class="label">訂單明細</span></h2>
     <div class="col-sm-12 col-md-8">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>享。買這些</th>
                        <th class="text-center">細節描述</th>
                        <th class="text-center">售價</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${Cart.items}">
                    <tr>
                        <td class="col-md-6">
                        <div class="media">
                            <a class="thumbnail pull-left" href="#"> <img class="media-object" src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                               <h4 class="media-heading"><a href="<c:url value="/browse/books/${item.productBean.booksBean.ISBN}"/>">${item.productBean.booksBean.title}</a></h4>
                                <h5 class="media-heading"> 編號 <a>${item.productBean.productID}</a></h5>
                                <span>使用狀態: </span><span class="text-success"><strong>${item.productBean.status}</strong></span>
                            </div>
                        </div></td>
                        <td class="col-md-4 text-center"><strong>${item.productBean.detail}</strong></td>
                        <td class="col-md-4 text-center"><strong>${item.productBean.productPrice}</strong></td>       
                    </tr>
                    </c:forEach>                  
                   <tr>
                     
                        <td >   </td>
                        <td  class="text-left"><h4>小計:</h4></td>
                        <td class="text-center"><h4><strong>${Cart.sumamount}</strong></h4></td>
                    </tr>
                    <tr>
                       
                        <td >   </td>
                        <td class="text-left"><h4>運送與處理:</h4></td>
                        <td class="text-center"><h4><strong>${Cart.freight}</strong></h4></td>
                    </tr>
                    <tr>
                       
                        <td >   </td>
                        <td  class="text-left"><h3>總計:</h3></td>
                        <td class="text-center"><h3><strong>${Cart.sumtotal}</strong></h3></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="col-sm-12 col-md-4 rightbox">
            <div class="boxtitle"><h2>訂單資訊</h2></div>
            <div class="content col-md-12">
             <h3>付款方式:<span>${Order.payBean.payType}</span></h3>
                <br />
             <h3>收件人: <span>${Order.reciepient}</span></h3>
             <h3>收件地址:</h3>
             <h4 style="word-wrap:break-word;">${Order.oaddr}</h4>
           <h3>備註:</h3>
             <h4 style="word-wrap:break-word;">${Order.omemo}</h4>
             <br>
        </div>
             <div class="text-center"><a type="button" class="btn btn-default btn-lg" href="${prepage}">
                   <span class="glyphicon glyphicon-shopping-cart" ></span>上一步</a>
                   <button type="submit" class="btn btn-success btn-lg">結帳，送出訂單<span class="glyphicon glyphicon-play"></span></button></div>
           </div>
          </div>

       
 </div>
	<c:import url="/pages/templates/front/frontfooter(noCart).jsp"></c:import>
</body>
</html>