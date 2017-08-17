<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value='/css/card.css'/>">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/js/bootstrap.min.js"/>"></script>
 <script type="text/javascript" src="<c:url value="/js/card.js"/>"></script> 

<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/login.css'/>">
<link rel="stylesheet" href="<c:url value='/css/CartStep.css'/>">

</head>
<body>
	<c:import url="/pages/templates/front/frontmenu.jsp"></c:import>
	 
 <div class="container main">
    <div class="row">
      <div class="main clearfix">
				<div class="demo-container col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
                     <div id="step" class="box vpadding text-center"><img class="pic_timeline02 img-responsive" src="//jci.book.com.tw/css/books/m_cart2015/images/time_line_step3_zh-tw.png"></div>
                    <h2 class="labelbox"><span class="label">信用卡付款</span></h2>
                    <h3 class="text-center">金額:<span>${Cart.sumtotal}</span></h3>
			        <div class="card-wrapper"></div>
			        <div class="form-container active">

			            <form id="cardform" class="text-center" action="<c:url value="/browse/cart/card"/>" method="post">
                             <div class="row">
                            <div class="col-xs-12">
                            <label>卡別</label>
                                <p><input type="radio" name="cardtype" value="visa"<c:if test="${param.cardtype eq 'visa'}">checked</c:if> required/><img class="cardlogo" src="<c:url value="/images/visa.png"/>" />&nbsp;&nbsp;&nbsp;<input type="radio" name="cardtype" value="master" <c:if test="${param.cardtype eq 'master'}">checked</c:if> required/><img  class="cardlogo" src="<c:url value="/images/master.png"/>" /></p>
                            </div>
                             </div>

                             <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="number">卡號</label>
                                    <input type="text" class="form-control" placeholder="Card number" name="number" id="number" value="${param.number}" required/>
                                </div>
                            </div>                        
                        </div>

                            	 <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label for="expiry">到期日</label>
                                    <input type="text" class="form-control" placeholder="MM/YY"  name="expiry" id="expiry" maxlength="7" value="${param.expiry}" required  />
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label for="cvc">CV CODE</label>
                                    <input type="text"  placeholder="CVC" class="form-control" name="cvc" id="cvc" maxlength="3" value="${param.cvc}"  required/>
                                </div>
                            </div>
                        </div>
                       <div class="row">
                       <div class="col-xs-12">
                       <h4><strong><span style="color:red;">${error}</span></strong></h4>
                       </div>
                       </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <a type="button" class="btn btn-default btn-lg" href="<c:url value="/browse/cart/buyinfo"/>">
                   <span class="glyphicon glyphicon-shopping-cart" ></span>上一步</a>
                                <button type="submit" class="subscribe btn btn-success btn-lg" type="submit">結帳，送出訂單<span class="glyphicon glyphicon-play"></span></button>
                            </div>
                        </div>
                        <div class="row" style="display:none;">
                            <div class="col-xs-12">
                                <p class="payment-errors"></p>
                            </div>
                        </div>                			                			                
			            </form>
			        </div>
			    </div>

			</div>

          </div>     
 </div>
	 
	<c:import url="/pages/templates/front/frontfooter(noCart).jsp"></c:import>
</body>
  <script>
        $('#cardform').card({
            // a selector or jQuery object for the container
            // where you want the card to appear
            container: '.card-wrapper', // *required*
            numberInput: 'input#number', // optional — default input[name="number"]
            expiryInput: 'input#expiry', // optional — default input[name="expiry"]
            cvcInput: 'input#cvc', // optional — default input[name="cvc"]
            nameInput: '', // optional - defaults input[name="name"]

            width: 200, // optional — default 350px
            formatting: true, // optional - default true

            // Strings for translation - optional
            messages: {
            validDate: 'valid\ndate', // optional - default 'valid\nthru'
            monthYear: 'mm/yyyy', // optional - default 'month/year'
            fullName: '' // optional - default 'Full Name'
            }
        });
        
    </script>
</html>