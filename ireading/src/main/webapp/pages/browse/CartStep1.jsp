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
  <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>
<body>
	<c:import url="/pages/templates/front/frontmenu.jsp"></c:import>
	  <div class="container main">
    <div class="row">
        <div id="step" class="box vpadding text-center"><img class="pic_timeline02 img-responsive" src="//jci.book.com.tw/css/books/m_cart2015/images/time_line_step1_zh-tw.png"></div>
        <div class="col-sm-12 col-md-8">
            <table class="table table-hover" id="CartTable">
                <thead>
                    <tr>
                        <th><h4>享。買這些</h4></th>
                        <th class="text-center"><h4>細節描述</h4></th>
                        <th class="text-center"><h4>售價</h4></th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${Cart.items}">
                    <tr>
                        <td class="col-md-6">
                        <div class="media">
                            <a class="thumbnail pull-left" href="<c:url value="/browse/books/${item.productBean.booksBean.ISBN}"/>"><img style="width:80px" class="img-responsiv" id="item-display" src="data:image/png;base64, ${item.productBean.booksBean.byteArrayString}"></img> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="<c:url value="/browse/books/${item.productBean.booksBean.ISBN}"/>">${item.productBean.booksBean.title}</a></h4>
                                <h5 class="media-heading"> 編號 <a href="<c:url value="/browse/books/${item.productBean.booksBean.ISBN}?action=buy"/>">${item.productBean.productID}</a></h5>
                                <span>使用狀態: </span><span class="text-success"><strong>${item.productBean.status}</strong></span>
                            </div>
                        </div></td>
                        <td class="col-md-2 text-center"><strong>${item.productBean.detail}</strong></td>
                        <td class="col-md-2 text-center"><strong>${item.productBean.productPrice}</strong></td>
                        <td class="col-md-2">                        
                        <button type="button" class="btn btn-danger deletCart" value="<c:url value="/browse/cart/delete/${item.productBean.productID}" />">
                            <span class="glyphicon glyphicon-remove"></span> 不享。要
                        </button></td>
                    </tr>
                   </c:forEach>
                   
                    <tr>
                      
                        <td>   </td>
                        <td>   </td>
                        <td>
                        </td>
                        <td>
                       </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="col-sm-12 col-md-4 rightbox">
            <div class="boxtitle"><h2>摘要</h2></div>
            <div class="content">
            <table>
                 <tr>
                    <td><h3>商品數量:</h3></td>
                    <td class="text-right"><span style="font-size:30px">${Cart.sumnumb}</span><span> 件</span></td>
                </tr>
                <tr>
                    <td><h3>小計:</h3></td>
                    <td class="text-right"><span style="font-size:30px">${Cart.sumamount}</span><span> 元</span></td>
                </tr>
                <c:if test="${Cart.sumnumb gt 0}">
                <tr>
                    <td><h3>運送與處理:</h3></td>
                    <td class="text-right"><span style="font-size:30px">${Cart.freight}</span><span> 元</span></td>
                </tr>
                </c:if>
                <tr><td colspan="2" class="note">訂單金額滿${Cart.shpingTarget}即可免運費</td></tr>
               
                <tr>
                    <td><h3>總計:</h3></td>
                    <td class="text-right"><span style="font-size:30px">${Cart.sumtotal}</span><span> 元</span></td>
                </tr>
                <tr>
                    <td class="text-center"><a type="button" class="btn btn-default btn-lg" href="<c:url value="/browse/searchBooks.controller/searchBooksList?search="/>">
                            <span class="glyphicon glyphicon-shopping-cart"></span> 享。再逛逛
                        </a></td>
                    <td class="text-center"> <a type="button" class="btn btn-success btn-lg" href="<c:url value="/browse/cart/buyinfo"/>" <c:if test="${Cart.sumnumb eq 0}">disabled</c:if>>
                            享。結帳 <span class="glyphicon glyphicon-play"></span>
                        </a></td>
                </tr>
            </table>            
        </div>

    </div>
</div>
           </div>

	<c:import url="/pages/templates/front/frontfooter(noCart).jsp"></c:import>
	<script type="text/javascript" src="<c:url value="/js/login.js"/>"></script>
</body>
<script>
$(function(){
	$("#CartTable").on("click",".deletCart",function(event){
		var url=$(this).attr("value");
		console.log(url);
		$.post(url,{},function(data){
			console.log(data);
			location.reload();
		});
	})
	
	
	
})
</script>
</html>