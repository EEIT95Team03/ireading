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
        <div id="step" class="box vpadding text-center"><img class="pic_timeline02 img-responsive" src="//jci.book.com.tw/css/books/m_cart2015/images/time_line_step2_zh-tw.png"></div>
        <div class="Orderform">
       
            <form action="<c:url value="/browse/cart/check"/>" method="post">
                 <div class="form-group col-xs-12">
                     <h2 class="labelbox"><span class="label">付款方式</span></h2>
                      <input type="radio"  name="pay" value="P0001" <c:if test="${Order.payBean.payID eq 'P0001'}">checked</c:if> required/><span class="formtext">信用卡</span><br />
                     <input type="radio"   name="pay" value="P0002" <c:if test="${Order.payBean.payID eq 'P0002'}">checked</c:if> required/><span class="formtext">ATM轉帳</span>
                        </div>
                <div class="form-group col-xs-12">
                     <h2 class="labelbox"><span class="label">寄送資訊</span></h2>
                    <label class="formtext">收件人</label><input type="text" class="form-control" name="reciepient" value="${Order.reciepient}" required/>
                    <label class="formtext">收件地址</label><input type="text" class="form-control" name="oaddr" value="${Order.oaddr}" required/>
                    <label class="formtext">備註</label><textarea class="form-control" rows="4" cols="50" style="resize: none;" name="omemo" value="${Order.omemo}">${Order.omemo}</textarea>
                        </div>
                 <div class="form-group col-xs-12 text-center">
                   <a type="button" class="btn btn-default btn-lg" href="<c:url value="/browse/cart/show"/>">
                   <span class="glyphicon glyphicon-shopping-cart"></span>上一步</a>
                   <button type="submit" class="btn btn-success btn-lg">下一步 <span class="glyphicon glyphicon-play"></span></button>
               </div>
            </form>
        </div>     
</div>
           </div>
	<c:import url="/pages/templates/front/frontfooter(noCart).jsp"></c:import>
</body>
</html>